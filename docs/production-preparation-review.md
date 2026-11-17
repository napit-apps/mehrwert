# Produktionsvorbereitung: Kundenstimmen und Projekthierarchie

Stand: 17.11.2026 · Branch `fb_update-2027`

## Veröffentlichungsnachweise

Am 17.11.2026 direkt abgerufen und jeweils Zitat, Urheber und Rollenangabe gegen
die vorhandenen i18n-Quellen abgeglichen:

- DE Agile Coaching: https://mehrwert.tech/services/agile-transformation-coaching.html
- EN Agile Coaching: https://mehrwert.tech/en/services/agile-transformation-coaching.html
- DE IT-Leitung: https://mehrwert.tech/services/fractional-cto.html
- EN IT-Leitung: https://mehrwert.tech/en/services/fractional-cto.html
- DE Training: https://mehrwert.tech/trainings/gsp.html
- EN Training: https://mehrwert.tech/en/trainings/gsp.html

`_data/testimonial_publication.yml` dokumentiert 22 veröffentlichte
sprachbezogene Quellfassungen mit URL und Text-/HTML-Prüfsummen. Nicht alle
belegten Quellfassungen werden auf der neuen Website angezeigt.

## Tatsächlich verwendete Kundenstimmen

| Bereich | Deutsch | Englisch |
|---|---|---|
| Startseite | Lucas Schleweis und Michael Weinheimer: vollständige veröffentlichte Originaltexte und Originalattributionen, statt der bisherigen Kurzfassungen | Nur Lucas Schleweis in der veröffentlichten englischen Fassung; kein Michael-Weinheimer-Zitat |
| Organisation & Software-Delivery | Lucas Schleweis, Exxeta AG, Jacques Dunselmann, „Feedback zur Zusammenarbeit“ unverändert | Die vier bereits veröffentlichten englischen Fassungen unverändert |
| EnBW-Detailseite | Vollständiges veröffentlichtes deutsches Jacques-Dunselmann-Zitat samt veröffentlichter Namens-/Rollenangabe statt des englischen Ein-Satz-Auszuges | Vollständige veröffentlichte englische Fassung samt Attribution |
| Bestehende Trainingsseite | Ivo Ganchev, Marietta Manz und Marcus Danzer unverändert | Die bereits veröffentlichten Fassungen unverändert |

19 tatsächlich gerenderte Zitatvorkommen wurden gegen diese Originalquellen
geprüft. Ivo Ganchevs bereits veröffentlichtes englisches Original auf der
deutschen Trainingsseite wurde unverändert erhalten.

**Entfernt:** Andreas Binder und Harald Bezjak auf DE/EN, einschließlich der neu
angefertigten Übersetzungen. Kein Veröffentlichungsnachweis im untersuchten
Bestand; der Inhaber hat ihre Verwendung im Chat ausdrücklich ausgeschlossen.
Die Git-Suche findet diese Namen erst ab der Relaunch-Migration `7fe3c4c`, nicht
im vorherigen Stand `5691bf0`.

**Nicht übernommen:** Die neu angefertigte englische Michael-Weinheimer-
Übersetzung und die bisherigen gekürzten Zitatfassungen auf Startseite/EnBW.
Keine Zitate neu formuliert oder neu übersetzt.

Die neuen Verwendungsstellen referenzieren vorhandene `ac_testimonials`- bzw.
`cto_testimonials`-Datensätze, damit Originaltexte nicht doppelt gepflegt werden.
Ein fehlender referenzierter Originaldatensatz bricht den Build ab. Die explizite
sprachbezogene `published`-Kennzeichnung verhindert englische Ersatzfassungen.
Bei nur einem Zitat bleibt die Karussellnavigation ausgeblendet.

## Projektdarstellung

- Startseite: dieselben zwölf Projekte in derselben Reihenfolge; fachliche Titel
  aus dem vorhandenen Portfolio, Kundenname kleiner direkt darunter.
- Portfolio: dieselben 16 Einträge; Kundennamen aus dominanten Titeln herausgelöst
  und als dezente zweite Zeile dargestellt. Beschreibungen, Tags und Filter bleiben.
- Alle 16 Case Studies: fachlicher Titel, danach dezenter Kundenname, danach die
  bisherige Beschreibung. Eigene Produkte und Initiative behalten ihre Namen.
- Herkunftskennzeichnungen bleiben erhalten. Unbenannte Automotive-/Logistik-
  Auftraggeber bleiben unbenannt; keine Kundennamen oder Fakten ergänzt.
- Keine neuen Bilder, Logos, Routen oder Projektergebnisse. Vorhandene gemeinsame
  DE-/EN-Templates und kompakte Grids bleiben die Grundlage.

## Prüfung und Grenzen

- Produktions-Build einschließlich i18n- und Zitatquellenprüfung erfolgreich.
- 157 HTML-Dateien je Build: lokale Links, Anker, Canonicals und Robots geprüft.
  Produktion ohne noindex; Test-Build auf allen Seiten mit noindex, nofollow.
- 114 Browseransichten: 19 Seiten × DE/EN × 1440/390/320 px; keine horizontalen
  Überläufe, korrekte Schriftgrößen-/Reihenfolge der Kundennamen, 12/16 Kacheln,
  funktionierende Filter und korrekte Karussellzustände.
- Service-Texte, Über mehr.wert, Kontakt, Projekt-Fließtexte und Ergebnisse sowie
  Portfolio-Reihenfolge, Tags, Beschreibungen und URLs in DE/EN unverändert.
- Blogartikel, rechtliche Inhalte und Manifest unverändert.

Keine offene Zitat-Freigabefrage innerhalb dieses Auftrags. Die übrigen, bereits
als Entwurf gekennzeichneten englischen Seitenübersetzungen und die fachliche
Gesamtabnahme der Website bleiben offen. Dieser Schritt erteilt keine allgemeine
Veröffentlichungsfreigabe für sämtliche Kundenmandate oder die Website.
Kein Merge, Push, Deployment oder Export.
