---
layout: post
title: Energieverbrauch bestimmen – mit Bordmitteln - Der Selbsttest zu Videokonferenztools
cover: cover.jpg
type: "Blog-Post"
datum:  "28.03.2025"
post_image: "/assets/images/blog/2023-11-13-nachhaltige-softwareentwicklung.jpg"
tags: "#green-coding, #nachhaltigkeit"
categories: de posts
author: "Alina"
featured: false
---

## Videokonferenztools im Vergleich: Wie viel Energie verbrauchen Zoom, Teams und FaceTime wirklich?

Videokonferenzen sind aus unserem Alltag nicht mehr wegzudenken. Doch wie klimafreundlich sind Zoom, Teams und FaceTime eigentlich? In einem Selbstversuch wurden die drei Tools unter identischen Bedingungen getestet – mit erstaunlichen Ergebnissen.

Dabei ging es nicht nur um die Tools selbst, sondern auch um eine zentrale Frage: Kann man den Energieverbrauch digitaler Anwendungen mit einfachen Mitteln nachvollziehen und vergleichen? Die Antwort lautet: **Ja.** Mit dem auf jedem Mac verfügbaren Tool **powermetrics** und etwas Skripting in **Python** wurde ein realistisches Testsetup aufgebaut, das zeigt, dass sich auch ohne aufwändige Hardware oder Spezialsoftware aussagekräftige Energievergleiche durchführen lassen. Der Versuch belegt, dass fundierte Aussagen zur Energieeffizienz **niedrigschwellig und reproduzierbar** möglich sind – ein wichtiger Aspekt für IT-Professionals, die Nachhaltigkeit in ihrer digitalen Infrastruktur ernst nehmen.

## Setup und Zielsetzung

Der Selbstversuch wurde im **Juni/Juli 2023** auf einem **MacBookPro17,1 mit macOS Ventura Version 13.3** durchgeführt. Getestet wurden die drei gängigen Videokonferenztools **Zoom**, **Microsoft Teams** und **FaceTime**. Ziel war es herauszufinden, wie sich aus- und eingehendes Video und Screensharing auf den Energieverbrauch auswirken – und ob sich daraus Empfehlungen für eine nachhaltigere Nutzung ableiten lassen.

Gleichzeitig sollte gezeigt werden, dass man mit Bordmitteln wie **powermetrics**, einem **Python-Skript** und einer durchdachten Versuchsanordnung bereits qualitative Aussagen über Energieeffizienz treffen kann.

## Methodik

Für jedes Tool wurden verschiedene Szenarien getestet: **eingehendes Video an/aus, ausgehendes Video an/aus und Screensharing an/aus**. Dabei wurde der sogenannte **Energy Impact** erfasst – ein Modellwert, den powermetrics in einem Textfile ausgibt. Vor jeder Messreihe wurde ein **Neustart** durchgeführt, um unnötige Prozesse zu beenden. Zusätzlich wurde zu Beginn **eine Baseline bestimmt**, indem nach einem Neustart ohne geöffnete Programme der Energy Impact modelliert wurde.

Die Messungen liefen stets in **10-Minuten-Blöcken**. Für jedes Szenario wurden **drei Wiederholungen** durchgeführt und der **mittlere Energy Impact** berechnet.

Das Skript zur Auswertung wurde in **Python** geschrieben: Mittels **Regex** wurden die relevanten Daten ausgelesen, in einen **Pandas DataFrame** überführt und **grafisch aufbereitet**.

Das Test-Setup wurde bewusst **realitätsnah** gehalten: Die Videokonferenzen liefen zwischen zwei Laptops. Ein externer Bildschirm zeigte ein standardisiertes Testvideo mit Ton, das von der Kamera des MacBooks aufgezeichnet wurde. Damit war sichergestellt, dass die Szenarien **konsistent und reproduzierbar** sind.

## Ergebnisse im Überblick

Die beiden folgenden Diagramme zeigen anschaulich den durchschnittlichen Energy Impact der getesteten Videokonferenztools in zwei Gruppen von Szenarien: mit und ohne aktiviertes Screen-Sharing. So lassen sich die Energieprofile der Anwendungen visuell vergleichen.

Die Ergebnisse zeigen klare Unterschiede zwischen den Tools – insbesondere bei Screen-Sharing und aktivem Video. **Microsoft Teams** schnitt in fast allen Szenarien **schlechter ab** als Zoom und FaceTime. Nur im **Minimalbetrieb ohne Video oder Screensharing** lagen die Werte aller Tools nah beieinander.

<img class="img-fluid w-100" src="/assets/images/blog/mit-screen-sharing.png" alt="Darstellung des Energy Impacts für alle messungen ohne Screen Sharing">

Diese Daten machen deutlich: **Die Wahl des Tools und die Konfiguration der Videokonferenz hat einen direkten Einfluss auf den Energieverbrauch.** Gerade bei regelmäßigen Meetings lohnt es sich, über bewusstes Kamera- und Screensharing-Verhalten nachzudenken – insbesondere bei der Nutzung von Teams.

Ein besonders aufschlussreicher Vergleich ergibt sich zwischen den Szenarien „Alles aus“ und „Alles an“. Während FaceTime und Zoom im Betrieb mit nur eingehendem oder ausgehendem Video nahezu identische Verbrauchswerte wie im „Alles-aus“-Szenario aufweisen, fällt der Unterschied bei Microsoft Teams drastisch aus: **Der Energy Impact steigt hier um das 80-Fache**, sobald alle Funktionen – also ein- und ausgehendes Video sowie Screensharing – aktiviert sind. Zum Vergleich: Bei FaceTime liegt der Verbrauch in diesem Fall nur etwa beim **Fünffachen**, bei Zoom beim **Dreifachen**. Das unterstreicht nicht nur die technische Effizienz der jeweiligen Plattformen, sondern auch das enorme Optimierungspotenzial durch bewusste Nutzung.

<img class="img-fluid w-100" src="/assets/images/blog/ohne-screen-sharing.png" alt="Darstellung des Energy Impacts für alle messungen ohne Screen Sharing">

Im Szenario mit allen Funktionen aktiviert („**Video in/out + Screensharing an**“) liegt der **Energy Impact bei Teams etwa dreimal so hoch** wie im Minimalmodus mit allem deaktiviert – ein signifikanter Unterschied, der über die Zeit ins Gewicht fällt.

## Fazit: Nachhaltigkeit beginnt im Detail

Der Selbstversuch zeigt, wie groß die Unterschiede beim Energiebedarf von Videokonferenztools sein können – und wie einfach sich erste Vergleiche auch im eigenen Umfeld durchführen lassen. Für IT-Teams, Unternehmen und Einzelpersonen bietet das spannende Möglichkeiten: **Mit dem richtigen Tool und einer bewussteren Nutzung lässt sich auch bei alltäglichen Anwendungen nachhaltiger handeln.**

