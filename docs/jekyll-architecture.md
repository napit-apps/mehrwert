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

`_i18n/de.yml` und `_i18n/en.yml` behalten die etablierten Schlüssel:
`relaunch.pages`, `relaunch.contact_page`, `relaunch.portfolio_cases*`, Navigation
und UI sowie `ac_testimonials` und die vorhandenen Blog-/Kontakt-Schlüssel.
Die aktuell gerenderten Zweige haben dieselbe Struktur und Reihenfolge.
Historische, nicht mehr gerenderte deutsche Felder wurden nicht redaktionell
bereinigt. Sie sind kein Fallback für englische Inhalte.

`_plugins/i18n_contract.rb` prüft beim Build die benötigten Strukturen beider
Sprachen. Fehlende Schlüssel oder abweichende Array-Längen brechen den Build
mit dem konkreten Pfad ab. Beim Hinzufügen neuer Seitentypen ist der geprüfte
Inhaltsumfang entsprechend zu ergänzen; neue Felder innerhalb bestehender
aktiver Zweige werden automatisch mitgeprüft.

`_data/translation_review.yml` kennzeichnet neue/geänderte englische Texte als
`pending_editorial_review`, mit Schlüssel und Prüfsumme des deutschen Ausgangs.
Die Kennzeichnung wird nicht auf der Website ausgegeben. Freigabe erforderlich
für die aktuellen Texte von Startseite, Leistungen, Über mehr.wert, Kontakt,
Portfolioübersicht und Case Studies einschließlich übersetzter Zitate/Metadaten.
Passende bestehende UI-/Servicebezeichnungen, der englische Hero-Claim,
Blogtexte und `ac_testimonials` bleiben erhalten.

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
