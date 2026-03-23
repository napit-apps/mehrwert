---
layout: post
title: IT-Modernisierung Schritt für Schritt – das Strangler Fig Pattern
cover: cover.jpg
type: "Artikel"
datum:  "27.03.2026"
post_image: "/assets/images/blog/2026-12-18-mehrwiki.jpg"
tags: Modernisierung, Softwareentwicklung, Ressourceneffizienz, Toolkritik, KI-gestütztes-Coding, Integration
categories: de posts
author: "Marcel"
featured: false
---
 
Eine der schwierigsten Fragen in der IT-Modernisierung lautet:  

Wie ersetzt man ein bestehendes System, ohne den laufenden Betrieb zu gefährden?  

Der klassische Ansatz ist bekannt:  
Ein vollständiger Neuaufbau – oft als „Big Bang“ umgesetzt.  

Die Realität zeigt jedoch:  
Solche Projekte sind riskant, teuer und selten erfolgreich.  

## Ein anderer Ansatz  

Das **Strangler Fig Pattern** verfolgt eine grundlegend andere Strategie.  

Statt das bestehende System auf einmal zu ersetzen, wird es schrittweise transformiert.  

Neue Funktionalitäten werden außerhalb des bestehenden Systems aufgebaut und nach und nach integriert.  
Das alte System wird dabei Stück für Stück „ersetzt“ – ähnlich wie eine Würgefeige, die einen Baum langsam umschließt.  

## Das Prinzip  

Der Ansatz lässt sich auf wenige Kerngedanken reduzieren:  

- Das bestehende System bleibt zunächst bestehen  
- Neue Funktionalitäten werden separat entwickelt  
- Zugriffe werden schrittweise umgeleitet  
- Alte Komponenten werden nach und nach entfernt  

Der entscheidende Vorteil:  

Das Risiko wird verteilt – nicht konzentriert.  

## Einstieg in die Umsetzung  

Ein typischer Einstieg beginnt mit der Definition klarer Schnittstellen.  

Diese fungieren als Übergabepunkt zwischen Alt- und Neusystem.  

Darauf aufbauend können einzelne Bereiche gezielt herausgelöst werden:  

- Identifikation einer klar abgegrenzten Domäne  
- Aufbau einer neuen Implementierung  
- Umlenkung der Anfragen auf das neue System  
- Abschaltung der alten Funktionalität  

Dieser Prozess wird iterativ wiederholt.  

## Verbindung zu Domain-Driven Design  

Das Strangler Fig Pattern entfaltet seine volle Wirkung erst in Kombination mit Domain-Driven Design.  

DDD hilft dabei:  
- sinnvolle fachliche Schnitte zu identifizieren  
- klare Verantwortlichkeiten zu definieren  
- Abhängigkeiten zu verstehen  

Ohne diese Grundlage besteht die Gefahr, lediglich technische Teile zu verschieben –  
statt echte Komplexität zu reduzieren.  

## Qualität während der Transformation  

Während der schrittweisen Migration stellt sich eine zentrale Frage:  

Wie stellen wir sicher, dass sich das Verhalten nicht unbeabsichtigt verändert?  

Hier kommt beispielsweise **Golden Master Testing** ins Spiel.  

Bestehende Funktionalität wird abgesichert, während neue Komponenten entstehen.  
So können Änderungen kontrolliert und nachvollziehbar umgesetzt werden.  

## Typische Herausforderungen  

Auch dieser Ansatz ist nicht trivial.  

Häufige Herausforderungen sind:  

- Unklare Schnittstellen im bestehenden System  
- Versteckte Abhängigkeiten  
- Datenmigration und Synchronisation  
- Paralleler Betrieb von Alt- und Neusystem  

Diese Aspekte müssen aktiv adressiert werden.  

## Warum sich der Ansatz lohnt  

Trotz der Herausforderungen bietet das Strangler Fig Pattern entscheidende Vorteile:  

- Reduziertes Risiko durch inkrementelle Umsetzung  
- Frühe sichtbare Ergebnisse  
- Bessere Steuerbarkeit der Transformation  
- Möglichkeit zur kontinuierlichen Anpassung  

Modernisierung wird damit kein einmaliges Projekt, sondern ein steuerbarer Prozess.  

## Fazit  

Das Strangler Fig Pattern ist kein technischer Trick.  
Es ist ein strategischer Ansatz für den Umgang mit Komplexität.  

In Kombination mit Domain-Driven Design und gezielter Qualitätssicherung entsteht ein belastbares Fundament für nachhaltige IT-Modernisierung.  

Nicht durch radikale Brüche.  
Sondern durch kontrollierte, kontinuierliche Veränderung.  