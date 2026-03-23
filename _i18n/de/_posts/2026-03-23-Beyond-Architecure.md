---
layout: post
title: Beyond Architecture – warum IT-Modernisierung immer auch Organisationsentwicklung ist  
cover: cover.jpg
type: "Artikel"
datum:  "23.03.2026"
post_image: "/assets/images/blog/2026-12-18-mehrwiki.jpg"
tags: Modernisierung, Softwareentwicklung, Ressourceneffizienz, Toolkritik, KI-gestütztes-Coding, Integration
categories: de posts
author: "Marcel"
featured: false
---

In den vorherigen Artikeln habe ich unterschiedliche Aspekte moderner IT-Modernisierung beleuchtet. Ausgangspunkt war die Erkenntnis, dass viele Systeme nicht an ihrer Technologie scheitern, sondern an fehlender Klarheit über ihre fachliche Struktur. Domain-Driven Design schafft hier die Grundlage, um Systeme überhaupt verstehen und sinnvoll schneiden zu können.  

Darauf aufbauend wurde gezeigt, wie aus diesem Verständnis konkrete Entscheidungen entstehen – von der Priorisierung einzelner Domänen über Migrationsstrategien bis hin zu einer belastbaren Roadmap. Ergänzend dazu spielen Ansätze wie Golden Master Testing und das Strangler Fig Pattern eine zentrale Rolle, um Veränderungen kontrolliert umzusetzen und Risiken zu reduzieren.  

Diese Perspektive ist bewusst ganzheitlich angelegt. IT-Modernisierung ist kein einzelnes Architekturthema, sondern ein Zusammenspiel aus Struktur, Entscheidungen, Umsetzung und Absicherung.  

Was dabei häufig unterschätzt wird: Dieses Zusammenspiel endet nicht auf Systemebene. Es wirkt direkt auf die Organisation zurück, die diese Systeme entwickelt und betreibt.  

Genau an dieser Stelle wird sichtbar, dass IT-Modernisierung mehr ist als ein technisches Vorhaben.

## System und Organisation sind untrennbar verbunden  

Ein zentraler Zusammenhang, der in der Modernisierung häufig unterschätzt wird, ist die enge Kopplung zwischen Systemstruktur und Organisationsstruktur.  

Systeme entstehen nicht im luftleeren Raum. Sie spiegeln die Art wider, wie Teams zusammenarbeiten, wie Entscheidungen getroffen werden und wie Verantwortung verteilt ist.  

Diese Beobachtung ist nicht neu. Sie wird oft unter dem Begriff Conway’s Law beschrieben: Systeme tendieren dazu, die Kommunikationsstrukturen der Organisation abzubilden, die sie entwickelt.  

In der Praxis bedeutet das:  

Eine fragmentierte Organisation führt zu fragmentierten Systemen.  
Unklare Verantwortlichkeiten führen zu unklaren Systemgrenzen.  
Lokale Optimierung führt zu globaler Komplexität.  

Wenn sich diese Strukturen nicht verändern, reproduzieren sie sich auch in neuen Systemen.  

## Warum technische Modernisierung allein nicht ausreicht  

Viele Modernisierungsansätze fokussieren stark auf Architektur und Technologie. Neue Plattformen werden eingeführt, Services neu geschnitten und Zielbilder definiert.  

Gleichzeitig bleiben die zugrunde liegenden Arbeitsweisen oft unverändert. Teams arbeiten weiterhin entlang historischer Strukturen, Verantwortung ist nicht klar zugeordnet, und Entscheidungen werden weiterhin lokal getroffen.  

Das Ergebnis ist vorhersehbar:  

Die neue Architektur wird durch die bestehende Organisation „überformt“.  
Grenzen verschwimmen, Abhängigkeiten entstehen erneut, und die Komplexität kehrt zurück.  

Modernisierung wird so zu einem technischen Projekt mit organisatorischen Nebenwirkungen – statt zu einer echten Transformation.  

## Domain-Driven Design als strukturelle Grundlage  

Domain-Driven Design bietet in diesem Kontext mehr als einen Ansatz zur Systemmodellierung. Es liefert eine Struktur, die sich direkt auf die Organisation übertragen lässt.  

Domänen sind nicht nur technische Einheiten. Sie repräsentieren fachliche Verantwortungsbereiche. Sie beschreiben, wo Entscheidungen getroffen werden, wo Wissen entsteht und wo Veränderungen stattfinden.  

Wird ein System entlang von Domänen strukturiert, stellt sich zwangsläufig auch die Frage nach der Organisation:  

Wer ist für eine Domäne verantwortlich?  
Wie werden Entscheidungen innerhalb dieser Domäne getroffen?  
Wie werden Abhängigkeiten zwischen Domänen koordiniert?  

DDD macht diese Fragen sichtbar – und zwingt dazu, sie zu beantworten.  

## Agile Transformation jenseits von Prozessen  

Ähnlich verhält es sich mit Agilität. In vielen Organisationen wird Agile Transformation primär über Prozesse, Rollen und Meetings verstanden. Scrum Events werden eingeführt, Boards aufgebaut und neue Begriffe etabliert.  

Der eigentliche Kern von Agilität liegt jedoch an anderer Stelle.  

Agilität bedeutet, Entscheidungen dort zu treffen, wo das relevante Wissen vorhanden ist. Sie bedeutet, Feedback schnell zu integrieren, Verantwortung zu übernehmen und mit Unsicherheit umzugehen.  

In diesem Sinne ist Agilität kein Prozess, sondern ein Organisationsprinzip.  

## Die Verbindung: Struktur trifft Arbeitsweise  

Die Verbindung zwischen Domain-Driven Design und Agilität wird besonders deutlich, wenn beide konsequent zusammengedacht werden.  

DDD definiert sinnvolle fachliche Grenzen und Verantwortungsbereiche.  
Agilität beschreibt, wie innerhalb dieser Grenzen gearbeitet und entschieden wird.  

Erst durch diese Kombination entsteht ein konsistentes Gesamtbild:  

Teams sind entlang fachlicher Domänen organisiert.  
Verantwortung ist klar zugeordnet.  
Entscheidungen werden dort getroffen, wo das Wissen vorhanden ist.  
Abhängigkeiten werden bewusst gestaltet und nicht zufällig erzeugt.  

Modernisierung wird damit nicht nur technisch, sondern auch organisatorisch greifbar.  

## Typische Anti-Patterns in der Praxis  

In vielen Organisationen lassen sich wiederkehrende Muster beobachten, die genau dieser Logik entgegenstehen.  

Feature-Teams arbeiten quer durch alle Systembereiche, ohne ein tiefes Verständnis einzelner Domänen zu entwickeln. Architekturentscheidungen werden zentral getroffen, während die Umsetzung dezentral erfolgt. Teams optimieren lokal ihre Ergebnisse, ohne die Auswirkungen auf das Gesamtsystem zu berücksichtigen.  

Diese Strukturen führen zwangsläufig zu Systemen, die schwer verständlich, schwer veränderbar und stark voneinander abhängig sind.  

## Konsequenzen für IT-Modernisierung  

Wenn System und Organisation so eng miteinander verbunden sind, ergibt sich eine klare Konsequenz:  

IT-Modernisierung kann nicht isoliert als technisches Vorhaben betrachtet werden.  

Jede Veränderung an der Systemstruktur hat Auswirkungen auf die Organisation – und umgekehrt.  

Das bedeutet nicht, dass Organisationen vollständig neu aufgebaut werden müssen. Es bedeutet jedoch, dass strukturelle Fragen bewusst adressiert werden müssen:  

* Wie sind Teams geschnitten?  
* Wo liegt Verantwortung?  
* Wie werden Entscheidungen getroffen?  

Ohne Antworten auf diese Fragen bleibt Modernisierung unvollständig.  

## Fazit  

IT-Modernisierung ist mehr als ein Architekturprojekt. Sie ist immer auch ein Prozess der Organisationsentwicklung.  

Domain-Driven Design und agile Prinzipien bieten gemeinsam einen Ansatz, um diese beiden Ebenen miteinander zu verbinden.  

DDD schafft die strukturelle Grundlage.  
Agilität definiert die Art der Zusammenarbeit.  

Erst wenn beide Aspekte zusammengedacht werden, entsteht eine Umgebung, in der nachhaltige Veränderung möglich ist.  

Modernisierung bedeutet dann nicht nur, Systeme zu verändern.  
Sondern auch die Art und Weise, wie Entscheidungen getroffen und Verantwortung übernommen wird.  