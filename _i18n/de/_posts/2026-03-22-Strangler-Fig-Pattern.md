---
layout: post
title: IT-Modernisierung Schritt für Schritt – das Strangler Fig Pattern
cover: cover.jpg
type: "Artikel"
datum:  "23.03.2026"
post_image: "/assets/images/blog/2026-12-18-mehrwiki.jpg"
tags: Modernisierung, Softwareentwicklung, Ressourceneffizienz, Toolkritik, KI-gestütztes-Coding, Integration
categories: de posts
author: "Marcel"
featured: false
--- 

Eine der schwierigsten Fragen in der IT-Modernisierung lautet nicht, wie ein Zielsystem aussehen soll, sondern wie der Übergang dorthin gestaltet werden kann. Bestehende Systeme lassen sich selten isoliert ersetzen. Sie sind in Prozesse eingebettet, unterstützen laufende Geschäftsabläufe und können nicht einfach abgeschaltet werden.  

Genau hier liegt die Herausforderung: Veränderung ist notwendig, gleichzeitig muss der Betrieb stabil bleiben.  

## Warum der „Big Bang“ in der Praxis selten funktioniert  

Ein häufiger Ansatz besteht darin, ein System vollständig neu zu entwickeln und zu einem definierten Zeitpunkt zu ersetzen. Dieses Vorgehen wirkt auf den ersten Blick logisch, da es klare Schnittpunkte und ein sauberes Zielbild verspricht.  

In der Praxis zeigt sich jedoch, dass dieser Ansatz mit erheblichen Risiken verbunden ist.  

Während der Entwicklungsphase müssen bestehende und neue Anforderungen parallel berücksichtigt werden. Das Altsystem entwickelt sich weiter, während gleichzeitig ein neues System entsteht. Am Ende treffen zwei Welten aufeinander, die sich oft nicht mehr synchronisieren lassen.  

Zudem entsteht ein hoher Druck auf den finalen Umschaltzeitpunkt. Fehler oder unvollständige Funktionalität lassen sich zu diesem Zeitpunkt kaum noch kontrolliert beheben.  

Der Versuch, Komplexität in einem Schritt zu ersetzen, führt häufig dazu, dass sie sich an anderer Stelle erneut aufbaut.  

## Das Grundprinzip des Strangler Fig Patterns  

Das Strangler Fig Pattern verfolgt einen anderen Ansatz. Statt eines vollständigen Austauschs wird das bestehende System schrittweise transformiert. Neue Funktionalität entsteht außerhalb des bestehenden Systems und übernimmt nach und nach einzelne Aufgabenbereiche.  

Der Name beschreibt dieses Vorgehen sehr treffend: Wie eine Würgefeige einen Baum langsam umschließt, wird das bestehende System Stück für Stück durch neue Komponenten ersetzt.  

Der zentrale Gedanke ist dabei nicht die technische Umsetzung, sondern die Art der Veränderung:  

Transformation erfolgt inkrementell, kontrolliert und entlang fachlicher Grenzen.  

## Technische Struktur des Ansatzes  

In der Praxis wird das Strangler Fig Pattern häufig über eine zusätzliche Schicht umgesetzt, die eingehende Anfragen steuert. Diese Schicht entscheidet, ob eine Anfrage an das bestehende System oder an eine neue Komponente weitergeleitet wird.  

Im Laufe der Transformation verschiebt sich diese Zuordnung schrittweise.  

Zu Beginn werden nahezu alle Anfragen an das bestehende System weitergeleitet. Mit jeder neuen Komponente wird ein weiterer Teil der Funktionalität ausgelagert.

Die zentrale Steuerung ermöglicht es, diese Übergänge kontrolliert zu gestalten und bei Bedarf auch wieder rückgängig zu machen.

## Ein konkretes Beispiel aus der Praxis

Im Projekt zeigte sich der Bedarf für diesen Ansatz besonders in Bereichen mit hoher Änderungsdynamik. Kundenspezifische Anpassungen mussten regelmäßig umgesetzt werden, während gleichzeitig bestehende Funktionalität stabil bleiben musste.

Ein vollständiger Austausch dieser Bereiche wäre mit hohem Risiko verbunden gewesen, da viele Abhängigkeiten nicht vollständig sichtbar waren.

Stattdessen wurde ein klar abgegrenzter fachlicher Bereich identifiziert und als eigenständige Komponente neu implementiert. Die Zugriffe auf diesen Bereich wurden gezielt über eine Routing-Schicht gesteuert.

Neue Anforderungen wurden ausschließlich in der neuen Komponente umgesetzt, während bestehende Funktionalität zunächst im Altsystem verblieb. Schritt für Schritt wurden weitere Funktionen migriert, bis der entsprechende Bereich vollständig aus dem Altsystem herausgelöst war.

Dieses Vorgehen ermöglichte es, Veränderungen umzusetzen, ohne den laufenden Betrieb zu gefährden.

## Verbindung zu Domain-Driven Design

Das Strangler Fig Pattern entfaltet seine volle Wirkung erst in Kombination mit Domain-Driven Design.

Die zentrale Frage lautet nicht, welche technischen Komponenten ersetzt werden sollen, sondern welche fachlichen Domänen sinnvoll geschnitten werden können.

DDD liefert genau diese Struktur:
- klare fachliche Grenzen
- definierte Verantwortlichkeiten
- nachvollziehbare Abhängigkeiten

Ohne diese Grundlage besteht die Gefahr, lediglich technische Teile zu verschieben, während die eigentliche Komplexität bestehen bleibt.

Mit einem klaren Domänenmodell hingegen lassen sich gezielte, fachlich sinnvolle Transformationen durchführen.

## Qualität und Risiko während der Migration

Ein wesentlicher Aspekt des Strangler Fig Patterns ist der parallele Betrieb von Alt- und Neusystem. Dadurch entsteht eine Übergangsphase, in der beide Systeme aktiv genutzt werden.

Diese Phase erfordert besondere Aufmerksamkeit, insbesondere im Hinblick auf Konsistenz und Qualität.

Ansätze wie Golden Master Testing können hier eine wichtige Rolle spielen. Bestehendes Verhalten wird abgesichert, während neue Komponenten entstehen. Veränderungen werden sichtbar und können gezielt bewertet werden.

Gleichzeitig müssen Aspekte wie Datenkonsistenz, Synchronisation und Monitoring aktiv adressiert werden. Der Vorteil des inkrementellen Vorgehens liegt darin, dass diese Herausforderungen schrittweise gelöst werden können.

## Typische Herausforderungen und Trade-offs

Das Strangler Fig Pattern reduziert Risiken, eliminiert sie jedoch nicht.

Zu den typischen Herausforderungen zählen:
- Unklare oder fehlende Schnittstellen im bestehenden System
- Versteckte Abhängigkeiten zwischen Systemteilen
- Synchronisation von Daten zwischen Alt- und Neusystem
- Erhöhter Betriebsaufwand durch parallele Systemlandschaften

Diese Aspekte sind Teil des Ansatzes und müssen bewusst eingeplant werden.

Der zentrale Trade-off besteht darin, kurzfristig mehr Komplexität im Betrieb in Kauf zu nehmen, um langfristig Komplexität im System zu reduzieren.

## Fazit

Das Strangler Fig Pattern ist kein technischer Trick, sondern ein strategischer Ansatz für den Umgang mit gewachsenen Systemen.

Es verschiebt den Fokus von einmaligen, risikobehafteten Großprojekten hin zu einer kontrollierten, schrittweisen Transformation.

In Kombination mit Domain-Driven Design und gezielter Qualitätssicherung entsteht ein belastbarer Weg, um bestehende Systeme weiterzuentwickeln, ohne ihre Stabilität zu gefährden.

Nicht durch radikale Brüche.
Sondern durch kontinuierliche, nachvollziehbare Veränderung.