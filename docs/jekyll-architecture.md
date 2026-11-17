# Gemeinsame Jekyll-Architektur DE/EN

Stand: 17. November 2026, Branch `fb_update-2027`.

## Struktur und Ursache

Die überarbeiteten Seiten wählten bisher mit `site.lang == 'de'` neue Includes
und für Englisch die alten Abschnitte. Zusätzlich waren zahlreiche Projektseiten
auf `languages: [de]` eingeschränkt und die aktuellen englischen Daten fehlten.
Diese Sprachverzweigungen sind entfernt. Das bestehende
`jekyll-multiple-languages-plugin` erzeugt beide Versionen aus denselben Seiten.

- `_layouts/default.html`: gemeinsame HTML-Schale, Head, Navigation, Footer.
- `_layouts/relaunch.html`, `portfolio.html`, `blog-review.html`: bestehende
  Layoutnamen als dünne Verweise; `_layouts/post.html` bleibt der Artikelaufbau.
- `_includes/relaunch/`: gemeinsame seitenbezogene Inhalte/Komponenten.
- `_includes/relaunch/case-study.html`: gemeinsame Struktur der 16 Case Studies;
  bestehende Zuordnungs-Includes wählen die jeweiligen Projektdaten. Optionale
  Abschnitte und Visualisierungen bleiben projektspezifisch.
- Seiten im Wurzel-, Service- und Projektverzeichnis enthalten Routing/Front
  Matter und den gemeinsamen Include-Aufruf, keine DE-/EN-HTML-Kopien.
- Blogartikel bleiben unverändert unter `_i18n/de/_posts` bzw. `_i18n/en/_posts`.
  Rechtliche Inhalte bleiben unverändert in ihrer bestehenden Datenstruktur.

## Inhalte und Übersetzungen

`_i18n/de.yml` und `_i18n/en.yml` sind die einzigen aktiven Sprachdateien.
Sie haben dieselbe vollständige Schlüsselstruktur; es gibt keinen separaten
Relaunch-Inhaltsbereich und keine Alias-Schlüssel oder historischen Fallbacks.

- `common`: Marke, Navigation, Header, Footer, gemeinsames Kontaktformular,
  Karussell-Bedienung, veröffentlichte Zitatquellen und globale SEO-Texte.
- `pages.home`, `pages.services.it_strategy`,
  `pages.services.software_delivery`, `pages.about`, `pages.contact`:
  aktuelle Seiteninhalte und Metadaten.
- `pages.portfolio`: Übersicht mit `grid_entries`, Filtern und Bedienung;
  `details.<bestehende Projekt-ID>` enthält die 16 Case Studies sowie die
  weiterhin erreichbaren Bestandsseiten NOE und Mobile-Software-Projekte.
  Die früheren redaktionellen Viererblöcke sind aufgelöst.
- `pages.blog`: Übersicht, Suche, Teilen, Pagination, Tag-Archive und Kontakt.
- `pages.training`: bestehendes Green-Software-Training und dessen Kontakttext.
- `pages.error`, `pages.testimonial_archives`: bestehende Sonderseiten/Metadaten.

Templates lesen `site.translations[site.lang]` oder verwenden den bestehenden
`{% t ... %}`-Tag. Front Matter verweist auf dieselben Schlüssel. Die bestehenden
technischen Layout-/Include-Namen unter `relaunch/` bleiben erhalten; sie
bezeichnen gemeinsame Templates, keine zweite Inhaltsquelle.

`_plugins/i18n_contract.rb` prüft jetzt die vollständigen Sprachdateien ohne
historische Ausnahmeliste: doppelte YAML-Schlüssel, fehlende/zusätzliche Felder,
Typen, Array-Längen, leere benötigte Übersetzungen, veröffentlichte Zitatverweise
und verwaiste Redaktionsfreigaben führen zum Build-Fehler.

`_data/translation_review.yml` enthält weiterhin 1.111 aktive englische
Freigabeeinträge mit ihren unveränderten deutschen Prüfsummen. 22 Einträge zu
entfernten, nicht gerenderten Feldern wurden mit diesen Feldern ausgemustert.
Es wurden keine Übersetzungen ergänzt oder freigegeben.

Die veröffentlichten Zitate bleiben wortgetreu. Die gemeinsame Zitatstruktur
enthält nur tatsächlich verwendete Quellen. Für Michael Weinheimer existiert
keine freigegebene englische Fassung: Der englische Datensatz bleibt explizit
`published: false` mit leerem Zitat und leerer Rollenangabe; er wird nicht
angezeigt und löst keinen deutschen Fallback aus. Der Veröffentlichungsnachweis
in `_data/testimonial_publication.yml` enthält die 15 weiterhin verwendeten
sprachbezogenen Originalnachweise. Nicht mehr verwendete Nachweise und Inhalte
sind weiterhin in der Git-Historie nachvollziehbar.

### Prüfung der Konsolidierung

Die Bestandsaufnahme kombinierte den statischen Include-/Layout-Graphen,
Front Matter, Plugins und JavaScript mit einer temporären Laufzeit-Erfassung
der tatsächlich gelesenen YAML-Felder. Dynamische Projekt-IDs, Zitatquellen,
Listen, Filter-IDs und Tag-Archive wurden zusätzlich geprüft. Die derzeit
inaktive Pagination behält ihre verwendbaren UI-Schlüssel. Nicht eingebundene
historische Templates wurden mit ihren ungenutzten Inhalten entfernt.

Vergleich mit dem Produktions-Build des vorherigen Commits: **157 HTML-Seiten
mit identischen Texten, Elementen und Attributen**, einschließlich Metadaten,
Links, Zitaten und Filterdaten. Nur Kommentare und bedeutungslose Leerzeichen
wurden beim Vergleich ausgeklammert. Blogartikel, Rechtstexte, CSS und JavaScript
blieben unverändert. Produktions- und Test-Build: jeweils 157 Seiten ohne
Prüffehler; `noindex` ausschließlich im Test-Build. Browserprüfung: 156 Ansichten
(DE/EN bei 1440, 390 und 320 Pixeln) ohne Fehler, einschließlich Filter,
Sprachlinks, Karussells, Suche, Mobilmenü und bewusster Kartenaktivierung.

## URLs und Testumgebung

`_includes/language-routes.html` nutzt die bestehenden Routen und
`_data/blog_language_routes.yml` für die zwei abweichenden Artikel-Slugs.
Canonical und hreflang verwenden dieselbe Zuordnung wie der Sprachwechsel.
Tag-Archive besitzen nicht immer ein sprachliches Gegenstück: Der Wechsel führt
hier zur anderssprachigen Blogübersicht; es wird kein falsches hreflang-Paar
behauptet. Ihre bestehenden URLs und Artikel-Tags bleiben unverändert.

Die kleinen Filter in `_plugins/site_urls.rb` trennen lokalisierte Seiten-URLs
(`localized_url`) von gemeinsam ausgelieferten Assets (`asset_url`).
`content_asset_urls` passt alte absolute Asset-Pfade ausschließlich beim Rendern
an das Hosting-Unterverzeichnis an. Bestehende absolute Artikelverweise auf die
Produktivwebsite werden beibehalten. Die Blogsuche erhält den Build-Basispfad.

Produktiv: `_config.yml`, `test_environment: false`.
Test: zusätzlich `_config.test.yml`, `noindex, nofollow` auf allen HTML-Seiten,
kein produktiver CNAME. Keine robots.txt-Crawlsperre hinzugefügt. Für GitHub Pages
müssen URL und baseurl des jeweiligen Test-Repositories konfiguriert werden.

## Prüfung

```sh
JEKYLL_ENV=production bundle exec jekyll build --destination /tmp/mw-production
python3 _scripts/check-site.py /tmp/mw-production
bundle exec ruby _scripts/test-i18n-contract.rb
bundle exec jekyll build --config _config.yml,_config.test.yml --destination /tmp/mw-test
python3 _scripts/check-site.py /tmp/mw-test --test
```

Für einen Unterverzeichnis-Build dem Prüfer zusätzlich `--baseurl /mw-testpage`
übergeben. Der Prüfer kontrolliert alle HTML-Dateien, lokale Links, Assets,
Anker, Canonicals und die umgebungsabhängigen Robots-Metadaten ohne Netzwerk.

Geprüft: 157 HTML-Dateien pro Build; Produktions-, Test- und Unterverzeichnis-
Build. Browserprüfung von 26 Seiten in DE/EN bei 1440, 390 und 320 px
(156 Ansichten), inklusive DOM-/Hintergrund-Parität, Überläufen, Filtern,
Navigation, Karussells, Blogsuche und Kartenaktivierung. Keine Screenshots.
Die vier gefundenen Überläufe langer deutscher Hero-Wörter wurden gemeinsam
über den Wortumbruch behoben.

## Vorhandene redaktionelle Grenzen

- Die alte NOE-Route enthält weiterhin den vorhandenen Lorem-ipsum-Arbeitsstand;
  sie wurde weder inhaltlich ergänzt noch entfernt.
- Rechtliche Inhalte sind weiterhin deutsch; keine ungefragte Übersetzung.
- Die Herkunftsangaben der bestehenden Agile-Coaching-Zitate bleiben wie
  angeordnet unverändert. Die Architekturarbeit ersetzt keine Referenzfreigabe.
- Die bisherigen Tag-Archive enthalten teils Hashzeichen/Kommas in den URLs;
  diese wurden zum Schutz bestehender URLs nicht umbenannt.

Weitere Änderungen orientieren sich pragmatisch an
`mw-jekyll-coding-guidelines.md`. Kein Frameworkwechsel, keine zusätzlichen
Abhängigkeiten, kein Deployment und keine Manifest-Änderung.
