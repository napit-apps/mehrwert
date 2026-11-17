#!/usr/bin/env python3
"""Check a generated Jekyll site without making network requests."""
import argparse
import json
from html.parser import HTMLParser
from pathlib import Path
from urllib.parse import quote, unquote, urljoin, urlsplit


class Page(HTMLParser):
    def __init__(self):
        super().__init__()
        self.links, self.canonical, self.robots = [], [], []
        self.ids = set()

    def handle_starttag(self, tag, attributes):
        attributes = dict(attributes)
        if 'id' in attributes:
            self.ids.add(attributes['id'])
        if tag == 'meta' and attributes.get('name') == 'robots':
            self.robots.append(attributes.get('content'))
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

    for file, page in pages.items():
        relative = str(file.relative_to(root))
        current = origin.scheme + '://' + origin.netloc + args.baseurl + '/' + quote(relative)
        expected = ['noindex, nofollow'] if args.test else []
        if page.robots != expected:
            errors.append([relative, 'Incorrect robots directive', page.robots])
        if len(page.canonical) != 1 or resolve(urlsplit(page.canonical[0]).path) != file:
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
    print(json.dumps({'pages': len(pages), 'test': args.test, 'errors': errors}, ensure_ascii=False, indent=2))
    raise SystemExit(bool(errors))


if __name__ == '__main__':
    main()
