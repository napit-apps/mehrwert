#!/usr/bin/env python3
"""Check a generated Jekyll site without making network requests."""
import argparse
import json
import re
import xml.etree.ElementTree as ET
from html.parser import HTMLParser
from pathlib import Path
from urllib.parse import quote, unquote, urljoin, urlsplit


class Page(HTMLParser):
    def __init__(self):
        super().__init__()
        self.links, self.canonical, self.robots = [], [], []
        self.ids = set()
        self.redirect = None

    def handle_starttag(self, tag, attributes):
        attributes = dict(attributes)
        if 'id' in attributes:
            self.ids.add(attributes['id'])
        if tag == 'meta' and attributes.get('name') == 'robots':
            self.robots.append(attributes.get('content'))
        if tag == 'meta' and attributes.get('http-equiv') == 'refresh':
            self.redirect = attributes.get('content', '').split('url=', 1)[-1]
        if tag == 'link' and attributes.get('rel') == 'canonical':
            self.canonical.append(attributes.get('href'))
        for key in ('href', 'src'):
            if key in attributes:
                self.links.append(attributes[key])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('directory', type=Path)
    parser.add_argument('--baseurl', default='')
    parser.add_argument('--test', action='store_true', help='Require test-only noindex on every HTML page')
    args = parser.parse_args()
    root = args.directory.resolve()
    pages = {}
    for file in root.rglob('*.html'):
        page = Page()
        page.feed(file.read_text(encoding='utf-8'))
        pages[file] = page
    if not pages or root / 'index.html' not in pages:
        parser.error('No complete site found in the supplied directory.')
    home = pages[root / 'index.html']
    if len(home.canonical) != 1:
        parser.error('The homepage must have exactly one canonical URL.')
    origin = urlsplit(home.canonical[0])
    errors = []

    def resolve(path):
        path = unquote(path)
        if args.baseurl:
            if not path.startswith(args.baseurl + '/'):
                return None
            path = path[len(args.baseurl):]
        file = root / path.lstrip('/')
        candidates = (file, file / 'index.html', file.with_name(file.name + '.html'))
        return next((candidate for candidate in candidates if candidate.is_file()), None)

    portfolio = {root / 'projects.html'}
    for link in pages[root / 'projects.html'].links:
        path = urlsplit(link).path
        if '/projects/' in path:
            target = resolve(path)
            if target:
                portfolio.add(target)
    if len(portfolio) != 18:
        errors.append(['portfolio', 'Expected overview and 17 project pages', len(portfolio)])
    portfolio.update(root / 'en' / file.relative_to(root) for file in list(portfolio))

    for file, page in pages.items():
        relative = str(file.relative_to(root))
        current = origin.scheme + '://' + origin.netloc + args.baseurl + '/' + quote(relative)
        expected = ['noindex, nofollow'] if args.test or file in portfolio else []
        if page.robots != expected:
            errors.append([relative, 'Incorrect robots directive', page.robots])
        if len(page.canonical) != 1 or resolve(urlsplit(page.canonical[0]).path) != (resolve(urlsplit(page.redirect).path) if page.redirect else file):
            errors.append([relative, 'Incorrect canonical URL', page.canonical])
        for link in page.links:
            url = urlsplit(urljoin(current, link))
            if url.scheme not in ('http', 'https') or url.netloc != origin.netloc:
                continue
            target = resolve(url.path)
            if target is None:
                errors.append([relative, 'Missing local target or base path', link])
            elif url.fragment and target in pages and unquote(url.fragment) not in pages[target].ids:
                errors.append([relative, 'Missing anchor', link])
    # Release policy: exact portfolio routes (including extensionless aliases),
    # never a general Googlebot block or a broad /projects prefix restriction.
    robots_file = root / 'robots.txt'
    agents, rules = [], {}
    for line in robots_file.read_text().splitlines():
        line = line.split('#', 1)[0].strip()
        if not line:
            continue
        key, _, value = line.partition(':')
        if key.lower() == 'user-agent':
            agents.append(value.strip())
        elif key.lower() == 'disallow':
            for agent in agents:
                rules.setdefault(agent, []).append(value.strip())
    def blocked(agent, path):
        return any(path == rule[:-1] if rule.endswith('$') else path.startswith(rule)
                   for rule in rules.get(agent, []) if rule)
    for file in pages:
        path = args.baseurl + '/' + str(file.relative_to(root))
        if blocked('Googlebot', path) or blocked('*', path):
            errors.append([path, 'Google must be able to read noindex'])
        for agent in ('GPTBot', 'OAI-SearchBot', 'ClaudeBot', 'Claude-SearchBot'):
            aliases = [path, path.removesuffix('.html'), path.removesuffix('.html') + '?review=1']
            for alias in aliases:
                if blocked(agent, alias) != (file in portfolio):
                    errors.append([alias, 'Incorrect crawler scope', agent])

    sitemap_urls = set()
    for prefix in ('', 'en/'):
        sitemap = root / prefix / 'sitemap.xml'
        for node in ET.parse(sitemap).iter('{http://www.sitemaps.org/schemas/sitemap/0.9}loc'):
            url = node.text
            sitemap_urls.add(url)
            target = resolve(urlsplit(url).path)
            if not target or target in portfolio or 'fractional-cto' in url:
                errors.append([str(sitemap.relative_to(root)), 'Invalid sitemap entry', url])
            if prefix and not urlsplit(url).path.startswith(args.baseurl + '/en/'):
                errors.append([url, 'English sitemap contains a different language'])
    for prefix in ('', '/en'):
        target = origin.scheme + '://' + origin.netloc + args.baseurl + prefix + '/services/it-strategy-modernisation.html'
        if target not in sitemap_urls:
            errors.append([target, 'New service route missing from sitemap'])

    forbidden_suffixes = {'.md', '.yml', '.yaml', '.numbers', '.docx', '.xlsx', '.rb', '.py', '.sh', '.pem', '.key', '.env'}
    secret = re.compile(rb'-----BEGIN [A-Z ]*PRIVATE KEY-----|AKIA[0-9A-Z]{16}|gh[pousr]_[A-Za-z0-9]{36}')
    for file in root.rglob('*'):
        if not file.is_file():
            continue
        path = file.relative_to(root)
        if file.suffix.lower() in forbidden_suffixes or any(part.startswith('.') for part in path.parts) or 'docs' in path.parts:
            errors.append([str(path), 'Internal or sensitive file in build'])
        if secret.search(file.read_bytes()):
            errors.append([str(path), 'Potential credential signature in build'])

    print(json.dumps({'pages': len(pages), 'test': args.test, 'errors': errors}, ensure_ascii=False, indent=2))
    raise SystemExit(bool(errors))


if __name__ == '__main__':
    main()
