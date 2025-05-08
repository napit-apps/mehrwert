---
layout: post
title: Green Coding Patterns - Praxisnahe Ansätze für energieeffiziente Software
cover: cover.jpg
type: "Artikel"
datum:  "07.05.2025"
post_image: "/assets/images/blog/2024-06-07-green-coding.jpg"
tags: "#green-coding, #nachhaltigkeit"
categories: de posts
author: "Marcel, Alina"
featured: false
---

In Zeiten der Klimakrise rückt der **Energieverbrauch der IT-Branche** zunehmend in den Fokus. Laut dem Weltklimarat (IPCC) lassen sich schwerwiegende Auswirkungen nur durch **sofortige Emissionsreduktionen** abmildern. Die IT spielt dabei eine doppelte Rolle: Einerseits kann Digitalisierung helfen, Emissionen in anderen Bereichen zu senken (*green by IT*). Andererseits muss die Branche selbst nachhaltiger werden (*green in IT*).

Software steht dabei besonders im Zentrum – denn **nachhaltige Software ist vor allem effiziente Software**. Jede ineffiziente Codezeile verursacht nicht nur technische, sondern auch **ökologische Schulden**. Ähnlich wie technische Schulden können sie die **langfristige Wartbarkeit und Effizienz** beeinträchtigen – mit dem Unterschied, dass hier auch **reale Ressourcen wie Strom und CO₂** unmittelbar betroffen sind. Die gute Nachricht: Es braucht keine radikalen Umstellungen, sondern vor allem ein **geschärftes Bewusstsein** und ein paar **gezielte Anpassungen**. Dieser Artikel stellt praxisnahe **Green Coding Patterns** vor, die sich einfach in den Entwicklungsalltag integrieren lassen.

## Kleine Hebel, große Wirkung

Nachhaltiges Entwickeln muss nicht mit einem kompletten Umdenken beginnen. Oft reichen **kleine Änderungen im Alltag** – ein anderes Format hier, eine bewusstere Entscheidung dort –, um **spürbare Effekte** zu erzielen. Solche Anpassungen wirken wie **Hebel**: Sie sind klein in der Umsetzung, aber groß in ihrer Wirkung. So kann durch viele kleine Entscheidungen der **Energieverbrauch auf vielen Ebenen deutlich reduziert** werden.

Wer sein Verhalten Stück für Stück verändert, entwickelt über die Zeit ein **neues Bewusstsein**. Was heute noch wie eine zusätzliche Maßnahme wirkt, kann schon bald zum **neuen Standard** werden. Die folgenden Beispiele zeigen solche **kleinen Stellschrauben mit großem Hebel** – direkt anwendbar und mit positivem Effekt auf Umwelt und Systemleistung.

## Effizienz durch reduzierten Rechenaufwand

Ein erster Hebel liegt im **Code selbst**: Je weniger Rechenleistung eine Anwendung benötigt, desto weniger Energie verbraucht sie. **Unnötige Berechnungen zu vermeiden**, ist ein zentraler Hebel – so wie ein sparsames Auto weniger Sprit braucht, verbraucht effizienter Code weniger Strom. Es geht nicht um Perfektion, sondern um bewusst gesetzte **Prioritäten bei der Ressourcennutzung**.

* **Überflüssige Prozesse vermeiden**: Muss wirklich bei jedem Klick eine neue Abfrage gesendet werden? Muss der komplette DOM neu gerendert werden? Gezielt gesetzte Event-Handler oder Caching-Strategien helfen, unnötige Rechenlast zu vermeiden.
* **Einfache Datentypen bevorzugen**: Ganzzahloperationen benötigen oft weniger Energie als Gleitkommazahlen. Kleine Änderungen in der Datenverarbeitung können große Effekte haben.
* **Vorkompilierte Ressourcen nutzen**: Kompilieren oder bündeln Sie Skripte und Assets vorab, um unnötige Rechenarbeit auf Endgeräten zu vermeiden.

## Daten effizient übertragen

Auch **Datenverkehr kostet Energie** – auf Endgeräten, in Netzwerken und Rechenzentren. Deshalb gilt: Je weniger, desto besser.

* **Nur notwendige Daten übertragen**: API-Responses und Datenbankabfragen sollten auf das Wesentliche reduziert sein.
* **Dateien komprimieren**: Text- und Bilddateien lassen sich oft stark verkleinern, ohne an Funktionalität oder Qualität einzubüßen.
* **Caching konsequent nutzen**: Wiederholte Datenabrufe lassen sich vermeiden, wenn Inhalte lokal oder serverseitig zwischengespeichert werden.

## Energieeffiziente Interfaces und UX

Die **Gestaltung einer Anwendung** hat direkten Einfluss auf ihren Energiebedarf. Sowohl **Nutzerfreundlichkeit als auch Ressourcenschonung** lassen sich miteinander verbinden.

* **Bilder effizient einsetzen**: Sparsame Formate wie WebP und passend skalierte Medien tragen dazu bei, die Datenmenge und damit den Energieverbrauch zu reduzieren. Große Bilddateien sollten vermieden werden, wenn kleinere Versionen denselben Zweck erfüllen.
* **Animationen reduzieren**: Bewegte Inhalte wirken oft modern, verursachen aber eine höhere GPU-Last – insbesondere auf mobilen Geräten. Weniger ist hier mehr.
* **Dark Mode anbieten**: Auf OLED-Displays spart ein dunkles Design Energie. Ein optionaler Dark Mode verbessert zugleich die Nutzerfreundlichkeit.
* **Ladezeiten optimieren**: Schnelle Ladezeiten senken nicht nur den Stromverbrauch, sondern steigern auch die Nutzerzufriedenheit.

## Ressourcen bewusster nutzen

Auch die **Infrastruktur** hinter einer Anwendung birgt Potenzial zur Optimierung. Ziel ist eine möglichst **bedarfsgerechte Auslastung** vorhandener Ressourcen.

* **Bedarfsgerechtes Skalieren**: Systeme sollten automatisch auf Last reagieren und in ruhigen Phasen herunterfahren.
* **Unnötige Umgebungen abschalten**: Entwicklungs- und Testsysteme müssen nicht durchgehend online sein.
* **Serverless & Container nutzen**: Diese Technologien ermöglichen eine effizientere Ausnutzung der Hardware.

## Carbon-Aware Coding

Nicht jeder Strom ist gleich grün. Der CO₂-Ausstoß pro Kilowattstunde variiert je nach Tageszeit und Netzbelastung – je nachdem, ob gerade viel Strom aus **erneuerbaren Quellen wie Wind oder Sonne** ins Netz eingespeist wird oder ob **fossile Energieträger** dominieren. Diese sogenannte **CO₂-Intensität** beschreibt, wie viel Kohlendioxid bei der Erzeugung einer Kilowattstunde Strom entsteht. **Carbon-Aware Coding** nutzt diese Unterschiede aktiv.

* **Zeitlich intelligent planen**: Batch-Prozesse oder Analysen können so terminiert werden, dass sie zu Zeiten mit **niedriger Netzlast oder geringerer CO₂-Intensität** des Stroms laufen – etwa wenn viele erneuerbare Energien eingespeist werden. Ein praktisches Tool dafür ist das Carbon Aware SDK der Green Software Foundation. Auch die Open-Source-Anwendung StromGedacht kann helfen, sich an besonders grüne Zeiten im Strommix zu orientieren – etwa durch Push-Benachrichtigungen, wenn gerade viel erneuerbare Energie verfügbar ist.
* **Gerätezustand berücksichtigen**: Anwendungen sollten erkennen, ob ein Gerät im Energiesparmodus läuft – und ihr Verhalten entsprechend anpassen.

## Messen und verbessern

**Nachhaltigkeit braucht Kennzahlen**. Nur was gemessen wird, kann gezielt verbessert werden. Ein **realistischer Überblick** über den Energieverbrauch bildet die Grundlage für konkrete Maßnahmen.

* **Energieverbrauch erfassen**: Der Energieverbrauch einer Anwendung lässt sich über verschiedene Wege sichtbar machen – etwa durch **dynamisches Profiling** oder durch **indirekte Messgrößen** wie CPU-Auslastung, Laufzeit oder Arbeitsspeicherbedarf. Diese Proxys bieten zwar keine exakte Messung, ermöglichen aber eine erste Orientierung. Wer tiefer einsteigen möchte, kann auf spezialisierte Tools zur Energieanalyse zurückgreifen.
* **Benchmarks nutzen**: Standardisierte Metriken wie die **Software Carbon Intensity (SCI)** helfen dabei, Verbesserungen greifbar zu machen. Ein konkretes Beispiel dazu findet sich im [vorherigen Artikel zur Energieanalyse mit Powermetrics](https://mehrwert.tech/powermetrics).

## Low Hanging Fruits: Energie sparen direkt am Gerät

Nicht alle Optimierungen müssen im Code oder in der Infrastruktur stattfinden – auch **direkt am Gerät** lassen sich einfache, aber wirksame Maßnahmen umsetzen:

* **Dark Mode aktivieren**: Besonders bei OLED-Displays reduziert ein dunkles Design den Stromverbrauch deutlich.
* **Helligkeit reduzieren**: Die Bildschirmhelligkeit ist ein großer Stromfresser. Schon eine kleine Reduktion spart Energie.
* **Geräte abends herunterfahren**: Entwicklungsgeräte, Monitore und Peripherie nach Feierabend ausschalten statt im Standby lassen.
* **Energiesparmodi aktivieren**: Sowohl Betriebssysteme als auch IDEs bieten Energiesparoptionen, die oft ungenutzt bleiben.
* **Unnötige Tabs und Programme schließen**: Viele Prozesse im Hintergrund belasten CPU und Speicher – und damit auch den Energieverbrauch.

**Diese kleinen, sofort umsetzbaren Maßnahmen** ergänzen die strukturellen Verbesserungen und machen **Green Coding** zu einem **ganzheitlichen Ansatz**.

**Ein zusätzlicher Vorteil:** Viele dieser Änderungen lassen sich **direkt umsetzen** – **ohne Teamentscheid oder umfassende Abstimmungen**. Wer etwa lokal Energiesparfunktionen nutzt oder systemseitige Einstellungen anpasst, kann **sofort Wirkung erzielen**. So liegt ein Stück der **Verantwortung** – und der **Gestaltungsspielraum** – in der eigenen Hand.

## Fazit: Kleine Schritte, große Wirkung

**Green Coding muss nicht kompliziert sein.** Viele Maßnahmen lassen sich schnell umsetzen – und haben spürbare Effekte. **Effizienter Code**, **sparsame Datenübertragung** und **durchdachte Interfaces** senken nicht nur den Energieverbrauch, sondern machen Anwendungen **performanter und robuster**.

**Entwickler\:innen haben es in der Hand**, Software nachhaltiger zu gestalten – Zeile für Zeile.

Mehr zum Thema Green Coding – inklusive strategischer Einordnung und Hintergrundwissen – finden Sie im [Artikel "Grüne Software, grüne Zukunft"](https://mehrwert.tech/green-coding).
