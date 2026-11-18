# Gemeinsame Jekyll-Architektur DE/EN

Stand: 18. November 2026, Branch `fb_update-2027`.

## Verbindliche Struktur

- `_layouts/default.html`: gemeinsame Seitenschale, Head, Navigation und Footer.
- `_layouts/post.html`, `tag_page.html`, `training.html`: Artikel, Tag-Archive und Training innerhalb derselben Seitenschale.
- `_layouts/legal.html`: Impressum, Datenschutz und AGB aus den unveränderten bestehenden Dokumentdaten. Semantische Überschriften und isolierte Typografie entsprechen den Größen und Abständen der produktiven Rechtsseiten.
- `_layouts/case-study.html` und `_includes/components/case-study.html`: gemeinsamer Aufbau der 17 Cases mit optionalen, projektspezifischen Abschnitten und Diagrammen.
- `_includes/pages/`: seitenbezogener Aufbau; `_includes/components/`: gemeinsame Projektkarten, Case Study und Portfolio-Kontakt.
- `_includes/header.html`, `navigation.html`, `footer.html`: DE/EN und Desktop/Mobile verwenden dieselben Komponenten. „Rechtliches“ verwendet die bestehenden Ziele und Bezeichnungen aus `common.footer.legal`.
- Seiten im Wurzel-, Service- und Projektverzeichnis enthalten Front Matter, Routing und die Inhaltszuordnung. Es gibt keine sprachspezifischen Layoutkopien.

Die bisherigen Umschalter und Ressourcenlisten für zwei Website-Versionen sind entfernt. Dünne Layout-Aliase, die fünf Case-Zuordnungswrapper, nicht importierte Theme-Module und das unbenutzte Sammelskript wurden entfernt. Es gibt keine zweite technische Seitenschale.

## Styles und Verhalten

`assets/scss/style.scss` ist der einzige Website-Stylesheet-Einstieg. Grundlagen und weiterhin benötigte Training-/Dokumentregeln werden mit `components/` und `pages/` zusammengeführt. Startseiten- und Blogregeln sind in ihren jeweiligen Seitenmodulen konsolidiert; die bewährte Kaskade bleibt erhalten. Rechtliche Typografie ist auf `.imprint` begrenzt und beeinflusst keine anderen Seiten.

Bootstrap bleibt die vorhandene Layoutgrundlage. Themify wird nur für Artikel, Blog und Training geladen. jQuery und Slick sind ausschließlich für den bestehenden Training-Slider und dessen FAQ erforderlich. Blogsuche verwendet lokales Lunr und `assets/js/blog-search.js`; das Training verwendet `training.js`. Filter, Kundenstimmen und bewusst aktivierte Karte behalten ihre bestehenden kleinen JavaScript-Module. Ungenutzte Shuffle-, Magnific-Popup- und Such-Plugins sind entfernt. Authentische Bildbestände, Logos und Fonts bleiben erhalten; eine fehlende aktuelle Verwendung allein ist kein Löschgrund für redaktionelle Assets.

## Inhalte und Übersetzungen

`_i18n/de.yml` und `_i18n/en.yml` besitzen dieselbe Schlüsselstruktur:

- `common`: Navigation, Footer, Marke, Formular, Karussell, veröffentlichte Zitatquellen und SEO-Grundlagen.
- `pages.home`, `pages.services`, `pages.about`, `pages.contact`, `pages.blog`, `pages.training`, `pages.error`, `pages.testimonial_archives`: jeweilige Seiteninhalte.
- `pages.portfolio.grid_entries`: Auswahl, Karten und Filter; `pages.portfolio.details`: 17 Cases einschließlich NOE und die weiterhin erreichbare zusätzliche Mobile-Software-Seite.

Templates lesen `site.translations[site.lang]` oder den bestehenden `{% t ... %}`-Tag. Das bestehende Mehrsprachen-Plugin erzeugt beide Sprachen. Blogartikel bleiben unter `_i18n/de/_posts` und `_i18n/en/_posts`; Rechtstexte bleiben in ihren bestehenden Datenquellen und werden nicht übersetzt.

`_plugins/i18n_contract.rb` kontrolliert vollständige Schlüsselparität, Typen, Array-Längen, leere Pflichtfelder, doppelte YAML-Schlüssel, Zitatverweise und Redaktionsfreigaben. `_data/translation_review.yml` behält die bereits geprüften englischen Inhalte und deren Quellenprüfsummen. `_data/testimonial_publication.yml` dokumentiert die 15 verwendeten sprachbezogenen Veröffentlichungsnachweise. Unveröffentlichte englische Zitate werden nicht durch deutsche Fassungen ersetzt.

## Routing und Indexierung

`_includes/language-routes.html` und `_data/blog_language_routes.yml` liefern Sprachwechsel, Canonicals und hreflang. Die URL-Filter in `_plugins/site_urls.rb` berücksichtigen Hosting-Unterverzeichnisse. Tag-Archive ohne Gegenstück wechseln zur anderssprachigen Blogübersicht. Bestehende Artikel- und Projektrouten bleiben erhalten.

Produktiv sind Portfolioübersicht und 17 Cases über `portfolio: true` in DE/EN `noindex, nofollow`, außerhalb der Sitemap und für die vereinbarten KI-Crawler gesperrt. Das ist kein Zugriffsschutz. Die zusätzliche Route `/projects/mobile-software-projekte.html` bleibt auf ausdrücklichen Wunsch unverändert indexierbar; ihre Ausnahme ist weiterhin offen dokumentiert.

Test-Builds aktivieren `_config.test.yml`: alle HTML-Seiten `noindex, nofollow`, kein produktiver CNAME. URL und baseurl werden passend zum Test-Repository übergeben. Die alte IT-Strategie-URL bleibt als statische Weiterleitung erhalten; sie liefert keinen echten HTTP-Redirect. Siehe auch [Release-Vorbereitung](production-release-preparation.md).

## Prüfung

```sh
JEKYLL_ENV=production bundle exec jekyll build --destination /tmp/mw-production
python3 _scripts/check-site.py /tmp/mw-production
bundle exec ruby _scripts/test-i18n-contract.rb
JEKYLL_ENV=production bundle exec jekyll build --config _config.yml,_config.test.yml --destination /tmp/mw-test
python3 _scripts/check-site.py /tmp/mw-test --test
```

Bei Unterverzeichnis-Hosting zusätzlich `--baseurl /mw-testpage` an den Prüfer übergeben. Dieser prüft HTML-Dateien, interne Links, Assets, Anker, Canonicals, Sitemap, Indexierungsregeln und unerwünschte interne Dateien.

Konsolidierungsprüfung: je 159 HTML-Dateien im Produktions- und Test-Build; 11 i18n-Vertragstests. Alle sichtbaren Hauptinhalte sind gegenüber dem gesicherten Ausgangsstand wortgleich. 116 Desktop-/Mobile-Ansichten der geschützten Seiten stimmen in berechneter Typografie, Farben, Abständen und Elementmaßen überein. 156 Browseransichten bei 1440, 390 und 320 Pixeln prüfen DE/EN, Überläufe, Filter, Karussells, Suche, Sprachlinks und Kartenaktivierung. Die Rechtsseiten wurden zusätzlich mit der tatsächlichen Live-Darstellung verglichen; dunkler direkter Text auf dunklem Grund ist nun weiß. Keine Exporte.

Weitere Änderungen folgen den pragmatischen [Coding Guidelines](mw-jekyll-coding-guidelines.md). Keine zusätzlichen Abhängigkeiten und keine Änderung des Manifests.

## Nachhaltigkeit – Stand 18. November 2026

`/sustainability.html` und `/en/sustainability.html` verwenden `pages/sustainability.html`, `pages/_sustainability.scss` und `pages.sustainability` in den bestehenden Sprachdateien. Beide URLs sind produktiv indexierbar und in der Sitemap; im Test-Build gilt weiterhin global `noindex, nofollow`. Der neue Unterpunkt steht unter Über mehr.wert; `/mission.html` bleibt dort erreichbar. Startseite und Über-uns-Seite enthalten jeweils einen zusätzlichen Textlink, sonst unveränderte Inhalte.

Webtexte: wortgetreu aus `mw-nachhaltigkeit-seite-de-en-v1.md`. Redaktionelle Abnahme DE/EN steht aus; die 45 neuen englischen Textfelder einschließlich Bildbeschreibung sind in `translation_review.yml` ausdrücklich `pending_editorial_review`. Frühere Freigaben bleiben bestehen; der Gesamtstatus nennt die offenen Ergänzungen.

Visuals: Das vom Inhaber bereitgestellte `assets/images/banner/BvGS.jpg` wird unverändert, zurückhaltend, mit Alternativtext und festen Bildabmessungen eingebunden. Für Green Agile Guide und Green Software Champion liegen keine Assets vor; nach Rückmeldung des Inhabers bleiben beide Belege rein typografisch. Keine Ersatzgrafiken und keine verbleibenden Bildplatzhalter. Vor produktiver Veröffentlichung bleibt die übliche redaktionelle und visuelle Abnahme erforderlich.

Prüfung der Ergänzung: DE/EN bei 1440, 1280, 768, 390 und 320 Pixeln, Desktop-/Mobile-Sichtprüfung, vollständige Texte, vier Engagement-Belege, Navigation per Tastatur, Anker, Sprachwechsel, interne und vorgegebene externe Linkziele, SEO und Indexierungsregeln. Produktions- und Unterverzeichnis-Test-Build: je 161 HTML-Seiten; 11 i18n-Vertragstests. Keine Exporte.
