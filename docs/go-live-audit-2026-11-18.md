# Go-live-Audit – 18. November 2026

Repository: `/Users/mehrwert/Development/homepage/mehrwert` · Branch: `fb_update-2027`.
Geprüfter Ausgangsstand: `d97d8e320ae24d1b187bebcdc1790164ae98dd16`.
Grundlagen: Manifest v2.1, Jekyll Coding Guidelines und der aktuelle Audit-Auftrag.

## Empfehlung

**Noch keine uneingeschränkte Go-live-Freigabe.** Die erzeugte Website besteht die unten genannten technischen Prüfungen. Vor Veröffentlichung sind jedoch der sichere Artefakttransfer und die offenen Datenschutz-/Kontaktfragen zu klären. Der Commit dieses Berichts enthält nur die dokumentierte Barrierefreiheitskorrektur, Übersetzungsfreigabe und diesen Bericht. Kein Push, Merge oder Deployment.

## BLOCKER

- **Bestehendes `deploy.sh` nicht unverändert verwenden.** Es entfernt die erzeugten Verzeichnisse `tag` und `en/tag`, obwohl Blogartikel darauf verlinken. Zudem räumt es das Veröffentlichungsverzeichnis nur teilweise auf. Im lokal bekannten `origin/deployment` liegen noch `_i18n`-Quelldateien, die der Ablauf nicht ausdrücklich entfernt. Ein sauberer Build allein garantiert damit keinen sauberen veröffentlichten Stand. Vor Go-live einen vollständigen, kontrollierten Artefaktabgleich einschließlich Löschung veralteter öffentlicher Dateien vorsehen und erneut prüfen. Das Skript wechselt außerdem auf andere Branches und am Ende auf `main`; es wurde nicht ausgeführt oder geändert. Der Remote-Stand wurde nicht neu abgerufen.

## FREIGABE OFFEN

- **Externe Dienste und Datenschutz:** Blog/ältere Seitentypen laden Lunr von `cdnjs.cloudflare.com`. Das Kontaktformular in Artikeln/Trainings sendet an Formspree (`/f/xjvnvkzb`). Die Kontaktseite lädt OpenStreetMap erst nach bewusster Aktivierung. Die vorhandene Datenschutzerklärung benennt diese Dienste nicht. Technische Bestandsaufnahme, keine rechtliche Bewertung: Dienstnutzung und passende Datenschutzhinweise vor Veröffentlichung fachlich/rechtlich abgleichen. Keine Formulare abgesendet; tatsächliche Zustellung bleibt durch den Betreiber zu testen.
- **Kontaktdaten:** Datenschutz nennt `+49 152 22169 4139`, Impressum/Kontakt `+49 152 2169 4139`. Richtige Angabe bestätigen und anschließend gezielt korrigieren. Rechtliche Texte erscheinen auch im englischen Bereich auf Deutsch; Entscheidung über eine englische Fassung bleibt offen. Keine rechtlichen Inhalte verändert.
- **Ausnahme Portfolio:** `/projects/mobile-software-projekte.html` und die englische Entsprechung bleiben auf ausdrücklichen Wunsch unverändert: kein `noindex`, keine gezielte KI-Crawler-Sperre; bereits nicht in der Sitemap. Damit ist die ursprüngliche Vorgabe „sämtliche Projektdetails schützen“ nicht vollständig erfüllt. Die 17 ausgewählten Detailseiten und die Übersicht sind dagegen geschützt. Dies ist eine dokumentierte offene Ausnahme, keine stillschweigende Freigabe der Indexierung.
- **Hosting-Abnahme:** Echte unbekannte URLs liefern im lokalen Jekyll-Server HTTP 404. Nach einem separat autorisierten Deployment muss dies am produktiven Host erneut geprüft werden. Die alte IT-Strategie-Adresse führt clientseitig korrekt weiter, liefert aber HTTP 200 statt 301/308. Ob ein echter HTTP-Redirect eingerichtet werden kann, hängt vom produktiven Hosting ab.

## SPÄTER

- Der gemeinsame 404-Fallback ist auf dem lokalen statischen Server auch unter einer unbekannten `/en/…`-Adresse deutsch; die explizite `/en/404.html` ist englisch und verlinkt korrekt. Sprachabhängige Fehlerbehandlung würde Hosting-Unterstützung benötigen.
- Einige indexierbare Hauptseiten haben weiterhin `sitemap: false`. Ihre internen Links und Canonicals funktionieren; ein vollständigerer Sitemap-Umfang kann gezielt abgestimmt werden.
- Lokale Ladeprüfung ohne auffällige Verzögerungen, keine fehlenden Ressourcen in den geprüften Ansichten. Das ersetzt keine Core-Web-Vitals-Messung am produktiven Host. Vollständige Kontrast-/Screenreader-Abnahme und ältere rechtliche Überschriftenstruktur bleiben gesonderte Qualitätsarbeit.

## Umsetzung und Prüfungen

- Arbeitsfassungsbanner DE/EN entfernt; vollständiges Original-Logo in gemeinsamer Navigation (Desktop/Mobile). Desktop-Hero mit vergrößertem vertikalem Raum, mobile Abstände kompakt.
- Neue IT-Strategie-Route DE/EN erreichbar. Alte Route führt per Meta-Refresh/JavaScript zur richtigen Sprachversion; Canonicals/hreflang zeigen auf das Ziel. Kein echter HTTP-Redirect behauptet.
- Individuelle 404-Texte und Startseitenlinks DE/EN vorhanden. Direkter Aufruf der 404-Datei: HTTP 200; tatsächlich unbekannte Route: HTTP 404.
- NOE vollständig DE/EN, bestehende Route und gemeinsame Case-Study-Komponente, 17. Portfolio-Kachel. Keine Platzhalter im NOE-Inhalt.
- Produktion: Übersicht plus 17 ausgewählte Details in beiden Sprachen = **36 geschützte HTML-Seiten** mit `noindex, nofollow`, ohne Sitemap-Eintrag. Gezielte Regeln für GPTBot, OAI-SearchBot, ClaudeBot und Claude-SearchBot; Googlebot nicht blockiert. Übrige produktive Seiten grundsätzlich indexierbar. **Diese Maßnahmen sind kein technischer Zugriffsschutz.**
- Test-Build: alle **159 HTML-Seiten** `noindex, nofollow`, korrekter `/mw-testpage`-Basispfad; produktiver Build ohne Testkonfiguration.
- Produktions- und Test-Build erfolgreich; `_scripts/check-site.py` jeweils 159 Seiten, keine Fehler. Prüfung lokaler Links/Anker, Canonicals, Sitemap, Crawler-Regeln und interner/sensibler Build-Dateien. Zusätzlich reziproke hreflang-Verweise geprüft: keine Fehler. Keine internen Arbeitsunterlagen oder bekannten Secret-Signaturen im frischen Build gefunden; keine Garantie über unbekannte Credential-Formate oder alte Dateien am Host.
- **11 i18n-Vertragsprüfungen bestanden.** Gemeinsame Templates und Komponenten DE/EN; keine Sprachlayoutkopien ergänzt.
- **156 Browseransichten** in DE/EN bei 1440, 390 und 320 px geprüft: Startseite, Leistungen, Über uns, Kontakt, Portfolio und sämtliche Projektdateien, Blogübersicht und Beispielartikel. Keine horizontalen Überläufe, leeren geprüften Überschriften/Links, fehlenden sofort geladenen Bildern oder JavaScript-Fehler. Struktur-/Hero-Parität DE/EN, Filter, Suchfunktion, Sprachlinks, mobile Navigation, Karussells und Kartenaktivierung bestanden. Keine Screenshots oder Exporte erstellt. Kartentest prüft Aktivierungslogik mit abgefangener Kartenantwort, nicht Verfügbarkeit/Genauigkeit des externen Kartendiensts.
- **15 sprachspezifische Zitatfassungen** samt Urheberangaben gegen den archivierten bisherigen Live-Bestand und dessen im Repository gespeicherte Hash-Nachweise geprüft. Keine Änderungen; insbesondere keine Wiedereinführung von Binder/Bezjak oder unveröffentlichten englischen Zitaten.
- Fachliche Projekttitel bleiben prominent, Kundenkontext getrennt und untergeordnet; keine Projekttexte, Reihenfolgen, Kategorien oder Routen verändert.

## Kleine technische Korrektur

Blogsuche und fünf Eingabefelder des bestehenden Kontaktformulars erhielten explizite `aria-label`-Beschriftungen aus ihren vorhandenen übersetzten Platzhaltertexten. Keine neuen Texte, keine sichtbare Layoutänderung und kein geändertes Absendeverhalten. Anschließend Produktions-/Test-Build, Vertragsprüfung und Browserkontrolle der betroffenen Felder erneut erfolgreich. Der Vergleich aller 159 generierten HTML-Seiten vor/nach der Korrektur zeigt **keine Änderungen ihrer Textknoten**.

## Sprachliche Freigabe

Die **1.148 Einträge** in `_data/translation_review.yml` wurden mit den bestehenden deutschen Fassungen und der vereinbarten Markenstimme abgeglichen. Die vorhandenen englischen Texte sind im Rahmen der ausdrücklich delegierten sprachlichen Prüfung freigegeben: verständlich, fachlich zurückhaltend, ohne zusätzliche Leistungs-/Ergebnisbehauptungen; Unterscheidung zwischen Mandat, früherer persönlicher Berufserfahrung, Produkt und Initiative bleibt erhalten. Keine Übersetzung neu erstellt oder umgeschrieben. Status, Datum, Prüfgrundlage und Grenzen der Freigabe sind in der Prüfdatei dokumentiert; Schlüssel und Quellhashes bleiben erhalten. Diese sprachliche Freigabe ist keine rechtliche Prüfung oder neue Kunden-/Zitatfreigabe.

Die vorbestehende Änderung an `README.md`, die unversionierten Build-/Deployment-Helfer und privaten Unterlagen wurden nicht übernommen oder verändert. Das Manifest bleibt unverändert.

## Nachtrag nach Betreiberentscheidung am 18. November 2026

Dieser Nachtrag aktualisiert die betroffenen Befunde oben:

- Formspree bleibt gewünscht. Das vorhandene Formular ist wieder auf der Kontaktseite DE/EN eingebunden. Blog/Training und Kontakt nutzen dasselbe Formular-Include und den unveränderten Endpunkt. Keine echte Nachricht zum Test versendet.
- Die Suche lief bereits im Browser; extern war nur der Download der Lunr-Bibliothek. Dieselbe Version 2.3.9 wird nun einschließlich MIT-Lizenz lokal ausgeliefert. Keine Änderung an Suchfunktion oder Index.
- Bestätigte Telefonnummer überall in den aktiven Inhalts-/Konfigurationsquellen: Anzeige `0152 21694139`, bestehende Telefonlinks `tel:+4915221694139`. Fehler in Datenschutz und AGB sowie uneinheitliche Darstellung in Impressum und DE/EN-Kontakt korrigiert. Keine weiteren Rechtstexte geändert.
- OpenStreetMap wurde vom Betreiber bestätigt und bleibt mit bewusster Aktivierung unverändert. Die technische Entscheidung für Formspree und OpenStreetMap ersetzt nicht den noch offenen Abgleich der Datenschutzerklärung mit diesen Diensten.
- Die vom Betreiber bearbeitete `deploy.sh` löscht Blog-Tagseiten nicht mehr. Dieser Teilbefund ist erledigt. Der Ablauf entfernt alte Dateien weiterhin nur selektiv; das Risiko zurückbleibender öffentlicher Quelldateien und die Branchwechsel bleiben bestehen. Die Betreiberänderung wurde nicht überschrieben oder in diesen Commit aufgenommen.
- Produktions-/Test-Build: jeweils 159 HTML-Seiten ohne Prüffehler; 11 i18n-Vertragsprüfungen bestanden. Keine Änderungen an Manifest, Portfolio-Sperren, Routen oder anderen redaktionellen Texten.
- Ergänzende Browserprüfung: 18 Ansichten von Kontakt, Blogübersicht und Beispielartikel in DE/EN bei 1440, 390 und 320 px; Suchergebnisse, Formularfelder/-Endpunkt, Telefonnummer und Überlauf geprüft. Keine externen Ressourcenabrufe vor Formularversand/Kartenaktivierung. Keine Formulare abgesendet.

## Betreiberentscheidungen und Ergänzungen am 19. November 2026

- Betreiber bestätigt erfolgreichen echten Formulartest und Freigabe der Nachhaltigkeitsseite. Ihre 45 englischen Textfelder sind nun als freigegeben dokumentiert; die separat ergänzte Über-uns-Linkbeschriftung und die neuen Datenschutzhinweise bleiben zur redaktionellen Prüfung markiert.
- `deploy.sh` bleibt in der Verantwortung des Betreibers; dessen bestehende Änderungen wurden nicht überschrieben. Absicherung des Artefakttransfers und produktive Hosting-Abnahme übernimmt der Betreiber. Kein Deployment ausgeführt.
- In den 161 erzeugten HTML-Seiten wurden keine eingehenden Inhalts-/Navigationslinks zur zusätzlichen `mobile-software-projekte.html` gefunden (eigene Canonical-/Sprachlinks ausgenommen). Die Seite und ihre Indexierung bleiben gemäß Betreiberentscheidung unverändert.
- Formspree und OpenStreetMap sind als Drittanbieter in der Datenschutzerklärung ergänzt: Formspree unmittelbar nach dem Kontaktformularabschnitt, OpenStreetMap unter Plugins und Tools. Neue Texte werden über `pages.privacy.services` in DE/EN geladen; der bisherige deutsche Rechtstext bleibt auch auf der englischen Route bestehen, ausdrücklich wie beauftragt. Keine CSS-/Designänderung. Zwei direkt widersprechende Aussagen zur fehlenden Datenweitergabe wurden gezielt angepasst.
- Die kurzen Formspree-Hinweise nennen übermittelte Formular-/technische Daten, mögliche Verarbeitung in den USA und den Anbieterlink. Sie behaupten weder einen abgeschlossenen AV-Vertrag noch unbekannte kontospezifische Löschfristen. Der Betreiber kennt bislang keinen AV-Vertrag. **Die vertragliche Datenschutzprüfung bleibt offen; eine Verlinkung ersetzt sie nicht.** Dies ist keine vollständige rechtliche Freigabe der vorhandenen Datenschutzerklärung. Insbesondere ältere allgemeine Drittland-/Hosting-Aussagen wurden nicht umfassend neu geprüft oder umgeschrieben.
- OpenStreetMap wird erst nach Aktivierung geladen und kann wieder ausgeblendet werden; die Hinweise beschreiben diese tatsächliche Einbindung. Keine Formulare versendet und keine fremden Kontoeinstellungen geändert.

Geprüfte Grundlagen: [Formspree-Datenschutz](https://formspree.io/legal/privacy-policy/), [OpenStreetMap-Datenschutz](https://osmfoundation.org/wiki/Privacy_Policy), [DSGVO, insbesondere Art. 28](https://eur-lex.europa.eu/eli/reg/2016/679/oj/eng). Produktions- und Test-Build: je 161 HTML-Seiten; 11 i18n-Vertragsprüfungen. Keine Veröffentlichung.
