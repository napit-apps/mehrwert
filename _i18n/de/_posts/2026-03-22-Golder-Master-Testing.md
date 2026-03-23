---
layout: post
title: Qualität sichern während der Modernisierung – mit Golden Master Testing
cover: cover.jpg
type: "Artikel"
datum:  "22.03.2026"
post_image: "/assets/images/blog/2026-12-18-mehrwiki.jpg"
tags: Modernisierung, Softwareentwicklung, Ressourceneffizienz, Toolkritik, KI-gestütztes-Coding, Integration
categories: de posts
author: "Marcel"
featured: false
---
 
IT-Modernisierung bedeutet Veränderung.  
Und jede Veränderung bringt ein Risiko mit sich:  

Funktioniert das System danach noch genauso wie zuvor?  

Gerade bei gewachsenen Systemen ist diese Frage schwer zu beantworten.  
Zu viele Sonderfälle, zu viele implizite Regeln, zu wenig Dokumentation.  

Und genau hier liegt eines der größten Risiken jeder Modernisierung.  

## Das eigentliche Problem  

In vielen Legacy-Systemen steckt die fachliche Logik nicht nur im Code – sie ist über Jahre gewachsen, erweitert und angepasst worden.  

Oft gilt:  
Das System funktioniert – aber niemand weiß genau, warum.  

Ein klassischer Ansatz wäre, umfassende Tests zu schreiben.  
Doch in der Praxis ist das kaum realistisch:  

- Die vollständige fachliche Logik ist nicht bekannt  
- Anforderungen sind unvollständig oder widersprüchlich  
- Der Aufwand für klassische Testabdeckung ist enorm  

Die Folge:  
Modernisierung wird zum Blindflug.  

## Die Idee des Golden Master Testing  

Golden Master Testing (auch bekannt als **Characterization Testing**) verfolgt einen anderen Ansatz.  

Statt zu definieren, wie ein System *funktionieren soll*, wird zunächst erfasst, wie es sich *tatsächlich verhält*.  

Das Prinzip ist einfach:  

1. Bestehende Funktionalität wird mit realistischen Eingaben ausgeführt  
2. Die Ergebnisse werden aufgezeichnet („Golden Master“)  
3. Änderungen am System werden gegen diesen Referenzzustand geprüft  

Ziel ist nicht Perfektion.  
Ziel ist Stabilität.  

## Warum das in der Modernisierung so wertvoll ist  

Golden Master Testing ermöglicht es, bestehendes Verhalten abzusichern – ohne es vollständig verstehen zu müssen.  

Das ist besonders in frühen Phasen entscheidend:  

- Beim Refactoring bestehender Komponenten  
- Beim Herauslösen einzelner Domänen  
- Beim Aufbau neuer Services parallel zum Altsystem  

Der große Vorteil:  

Das Risiko von unbeabsichtigten Änderungen wird drastisch reduziert.  

## Ein pragmatischer Einsatz  

In der Praxis hat sich ein iteratives Vorgehen bewährt:  

- Auswahl kritischer Use Cases  
- Aufzeichnung von Ein- und Ausgaben  
- Aufbau einer automatisierten Vergleichslogik  
- Schrittweise Erweiterung der Testbasis  

Wichtig ist dabei:  

Nicht alles muss getestet werden.  
Aber das Richtige.  

## Grenzen des Ansatzes  

Golden Master Testing ist kein Ersatz für fachliche Tests.  

Es zeigt, ob sich das Verhalten verändert hat –  
nicht, ob es fachlich korrekt ist.  

Gerade in gewachsenen Systemen kann es sinnvoll sein, bestehendes Verhalten bewusst zu verändern.  

Deshalb gilt:  

Golden Master Tests sichern den Status quo.  
Die fachliche Weiterentwicklung bleibt eine bewusste Entscheidung.  

## Verbindung zu Domain-Driven Design  

In Kombination mit Domain-Driven Design entsteht ein wirkungsvoller Ansatz:  

- DDD schafft Struktur und Verständnis  
- Golden Master Testing schafft Sicherheit bei der Umsetzung  

Während Domänen identifiziert und neu geschnitten werden, sorgt Golden Master Testing dafür, dass bestehende Funktionalität stabil bleibt.  

So wird Modernisierung nicht nur planbar – sondern auch kontrollierbar.  

## Fazit  

Modernisierung ohne Absicherung ist riskant.  
Klassische Testansätze stoßen in komplexen Legacy-Systemen schnell an ihre Grenzen.  

Golden Master Testing bietet einen pragmatischen Weg, bestehendes Verhalten zu sichern und Veränderungen kontrolliert umzusetzen.  

Nicht perfekt.  
Aber wirkungsvoll.  