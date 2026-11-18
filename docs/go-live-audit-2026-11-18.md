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
