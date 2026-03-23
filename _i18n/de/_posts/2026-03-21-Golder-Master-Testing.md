---
layout: post
title: Qualität sichern während der Modernisierung – mit Golden Master Testing
cover: cover.jpg
type: "Artikel"
datum:  "21.03.2026"
post_image: "/assets/images/blog/2026-12-18-mehrwiki.jpg"
tags: Modernisierung, Softwareentwicklung, Ressourceneffizienz, Toolkritik, KI-gestütztes-Coding, Integration
categories: de posts
author: "Marcel"
featured: false
---

Eine der zentralen Herausforderungen in der IT-Modernisierung ist nicht die Zielarchitektur, sondern der Weg dorthin. Bestehende Systeme müssen verändert, erweitert oder schrittweise ersetzt werden – und gleichzeitig muss sichergestellt werden, dass das bestehende Verhalten stabil bleibt.  

Genau hier entsteht ein Spannungsfeld:  

Auf der einen Seite besteht der Druck, Systeme zu verändern und weiterzuentwickeln.  
Auf der anderen Seite steht das Risiko, bestehende Funktionalität unbeabsichtigt zu verändern oder zu verlieren.  

In gewachsenen Systemen ist dieses Risiko besonders hoch.  

## Wenn Verhalten wichtiger ist als Verständnis  

In vielen Legacy-Systemen ist die fachliche Logik über Jahre hinweg gewachsen. Anforderungen wurden ergänzt, Sonderfälle implementiert und Anpassungen vorgenommen, oft ohne vollständige Dokumentation.  

Das Ergebnis ist ein System, das zuverlässig funktioniert – dessen Verhalten jedoch nur noch in Teilen verstanden wird.  

In solchen Situationen stößt ein klassischer Testansatz schnell an Grenzen. Um fachlich korrekte Tests zu schreiben, müsste das Verhalten des Systems vollständig bekannt sein. Genau dieses Wissen fehlt jedoch häufig.  

Die Alternative ist nicht, auf Tests zu verzichten.  
Die Alternative ist, den Ansatz zu verändern.  

## Golden Master Testing als pragmatischer Einstieg  

Golden Master Testing, häufig auch als Characterization Testing bezeichnet, verfolgt einen bewusst pragmatischen Ansatz.  

Anstatt zu definieren, wie ein System funktionieren sollte, wird zunächst erfasst, wie es sich tatsächlich verhält. Dieses Verhalten wird dokumentiert und dient als Referenz für zukünftige Änderungen.  

Das Prinzip ist dabei einfach: Bestehende Funktionalität wird mit realistischen Eingaben ausgeführt, die Ergebnisse werden aufgezeichnet und später bei Änderungen erneut erzeugt und verglichen.  

Ziel ist nicht, fachliche Korrektheit zu validieren, sondern unbeabsichtigte Veränderungen sichtbar zu machen.  

## Ein konkretes Beispiel aus der Praxis  

Im Projekt zeigte sich diese Herausforderung besonders deutlich in einem Bereich, der für kundenspezifische Anpassungen zuständig war.  

Neue Anforderungen mussten regelmäßig umgesetzt werden, gleichzeitig durfte bestehende Funktionalität nicht beeinträchtigt werden. Genau hier kam es jedoch immer wieder zu Problemen. Änderungen an scheinbar isolierten Stellen führten zu unerwarteten Seiteneffekten in anderen Bereichen des Systems.  

Ein klassischer Testansatz war in diesem Fall nicht realistisch, da die vollständige fachliche Logik nicht dokumentiert war und sich viele Sonderfälle nur implizit im Systemverhalten widerspiegelten.  

Der gewählte Ansatz bestand darin, typische Eingaben aus bestehenden Installationen zu nutzen und das aktuelle Verhalten des Systems systematisch aufzuzeichnen. Diese Daten bildeten den sogenannten „Golden Master“.  

Bei jeder Änderung wurde das System erneut mit denselben Eingaben ausgeführt und die Ergebnisse automatisiert verglichen. Abweichungen wurden sichtbar gemacht und konnten gezielt analysiert werden.  

Dieser Ansatz führte nicht dazu, dass das System vollständig verstanden wurde.  
Er stellte jedoch sicher, dass bestehendes Verhalten nicht unbemerkt verändert wurde.  

## Wo der Ansatz besonders wirksam ist  

Golden Master Testing entfaltet seine Stärke vor allem in Situationen, in denen Systeme schrittweise verändert werden.  

Typische Einsatzfelder sind:  

* Refactoring bestehender Komponenten  
* Herauslösen einzelner Domänen im Zuge einer Modernisierung  
* Aufbau neuer Services parallel zum bestehenden System  
* Stabilisierung kritischer Bereiche mit hoher Änderungsrate  

Gerade in frühen Phasen einer Transformation schafft dieser Ansatz eine wichtige Grundlage: Veränderungen werden möglich, ohne die Stabilität des Gesamtsystems zu gefährden.  

## Grenzen und bewusste Entscheidungen  

Trotz seiner Vorteile ist Golden Master Testing kein Allheilmittel.  

Der Ansatz sichert bestehendes Verhalten – unabhängig davon, ob dieses fachlich korrekt oder optimal ist. In gewachsenen Systemen bedeutet das häufig, dass auch unerwünschtes Verhalten zunächst konserviert wird.  

Diese Einschränkung ist bewusst in Kauf zu nehmen.  

Golden Master Tests beantworten die Frage, ob sich etwas verändert hat. Sie beantworten nicht, ob diese Veränderung sinnvoll oder notwendig ist. Diese Entscheidung bleibt weiterhin eine fachliche.  

Ein weiterer Aspekt ist der Umgang mit Änderungen. Nicht jede Abweichung ist ein Fehler. In vielen Fällen sind Anpassungen gewollt und Teil der Weiterentwicklung. Entscheidend ist, dass diese Veränderungen bewusst erfolgen und nachvollziehbar sind.  

## Zusammenspiel mit Domain-Driven Design  

Im Kontext von IT-Modernisierung entfaltet Golden Master Testing seine volle Wirkung in Kombination mit Domain-Driven Design.  

Während DDD dabei hilft, fachliche Strukturen sichtbar zu machen und sinnvolle Schnitte im System zu definieren, sorgt Golden Master Testing dafür, dass diese Veränderungen kontrolliert umgesetzt werden können.  

Das Domänenmodell gibt die Richtung vor.  
Golden Master Testing reduziert das Risiko auf dem Weg dorthin.  

## Fazit  

In komplexen Legacy-Systemen ist vollständiges Verständnis oft nicht realistisch. Gleichzeitig ist Stabilität eine zwingende Voraussetzung für jede Form der Weiterentwicklung.  

Golden Master Testing bietet einen pragmatischen Weg, mit dieser Situation umzugehen. Es ermöglicht Veränderungen, ohne vollständige Sicherheit über alle fachlichen Details zu benötigen.  

Nicht als Ersatz für saubere fachliche Tests.  
Sondern als Grundlage, um Modernisierung überhaupt erst kontrollierbar zu machen.  