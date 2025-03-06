---
layout: post
title: Embodied Carbon - Umweltbelastung durch Produktion und Entsorgung von Hardware
cover: cover.jpg
type: "Blog-Post"
datum:  "27.02.2025"
post_image: "/assets/images/blog/2023-11-13-nachhaltige-softwareentwicklung.jpg"
tags: "#green-coding, #nachhaltigkeit"
categories: de posts
author: "Alina, Marcel"
featured: false
---

Ob Smartphone, Laptop oder Server – jedes IT-Gerät beginnt seinen Lebenszyklus mit einem massiven Ressourcenverbrauch. Noch bevor wir ein Gerät zum ersten Mal einschalten, hat es bereits einen erheblichen ökologischen Fußabdruck hinterlassen. Vom Rohstoffabbau über energieintensive Fertigungsprozesse bis hin zur wachsenden Elektroschrott-Problematik: Die unsichtbaren Umweltkosten der IT sind enorm. Dieser Artikel beleuchtet die Schattenseiten der Hardwareproduktion. Wir zeigen, wie Rohstoffabbau, energieintensive Fertigungsprozesse und Elektroschrott die Umwelt belasten. Außerdem stellen wir Strategien vor, um den ökologischen Fußabdruck der IT-Branche zu verringern. Den ersten Teil der Serie zu Embodied Carbon findest du [hier](https://mehrwert.tech/embodied-carbon-1).

## **Rohstoffgewinnung: Ein ökologischer und sozialer Brennpunkt**

<img class="img-fluid w-100" src="/assets/images/blog/smartphone_resources.jpg" alt="Rohstoffe aus denen ein Smartphone besteht">
<small>Quelle: [OroVerde - Die Tropenwaldstiftung](https://www.regenwald-schuetzen.org/regenwald-wissen/faszination-regenwald/haeufige-fragen/welche-rohstoffe-gibt-es)</small>


IT-Geräte bestehen aus einer Vielzahl von Materialien wie Silizium, Kupfer, Gold und Seltenen Erden. Deren Gewinnung ist jedoch mit gravierenden Folgen für Mensch und Umwelt verbunden:

<ul>
<li><b>Habitatzerstörung:</b> Der Abbau von Gold, Lithium und Kobalt führt zur Rodung von Regenwäldern, Bodenverseuchung und Verlust natürlicher Lebensräume. Der Kobaltabbau in der Demokratischen Republik Kongo hat bereits über <b>500.000 Hektar Regenwald</b> zerstört (Quelle: Global Forest Watch, 2023).</li>
<li><b>Wasserverbrauch und -verschmutzung:</b> Die Lithium-Gewinnung in der Atacama-Wüste benötigt bis zu <b>2 Millionen Liter Wasser pro Tonne Lithium</b> <a href="https://www.fr.de/wirtschaft/konflikte-wasser-10968084.html">[Quelle: Friends of the Earth, 2022]</a>. Dies führt zur Austrocknung lokaler Ökosysteme und gefährdet indigene Gemeinschaften.</li>
<li><b>Soziale Probleme:</b> Bis zu <b>40.000 Kinder arbeiten unter anderem in Kobaltminen</b> in der Demokratischen Republik Kongo unter gefährlichen Bedingungen <a href="https://www.amnesty.de/informieren/aktuell/demokratische-republik-kongo-grosskonzerne-tun-zu-wenig-gegen-kinderarbeit">[Quelle: Amnesty International, 2023]</a>. Rohstofferlöse finanzieren zudem bewaffnete Konflikte und destabilisieren ganze Regionen.</li>
</ul>

Die Nachfrage nach diesen Rohstoffen wird sich laut der International Energy Agency (IEA) bis **2040 mehr als verdoppeln**, was die negativen Folgen weiter verschärft. [Quelle: Internationale Energieagentur, 2024](https://www.iea.org/news/sharp-declines-in-critical-mineral-prices-mask-risks-of-future-supply-strains-as-energy-transitions-advance)

<img class="img-fluid w-100" src="/assets/images/blog/Smartphone_resources_map.jpg" alt="Karte - Wo werden welche Rohstoffe abgebaut">
<small>Quelle: [everphone](https://everphone.com/de/blog/oekologische-handys/)</small>

## **Energieintensive Produktion: Der versteckte CO₂-Treiber**

Nach der Rohstoffgewinnung folgt ein energieintensiver Herstellungsprozess, der enorme Mengen an CO₂-Emissionen verursacht:

<ul>
<li><b>Halbleiterfertigung:</b> Die Herstellung von Mikrochips erfordert extrem hohe Reinheitsgrade und ist mit einem hohen Wasser- und Chemikalienverbrauch verbunden. Besonders problematisch ist die Produktion in Taiwan, wo sich über <b>90 % der weltweiten High-End-Chipfertigung</b> konzentriert <a href="https://www.economist.com/special-report/2023/03/06/taiwans-dominance-of-the-chip-industry-makes-it-more-important">[Quelle: The Economist, 2023]</a>. Der Herstellungsprozess eines einzelnen 30 cm Silizium-Wafers verbraucht <b>bis zu 8.000 Liter Wasser</b> – eine enorme Belastung für wasserarme Regionen wie Taiwan. <a href="https://www.globalwaterintel.com">[Quelle: Global Water Intelligence (2009) Pure Water, Semiconductors and The Recession]</a></li>
<li><b>Leiterplattenherstellung:</b> Beim Ätzen von Kupferbahnen entstehen giftige Chemikalien, die oft nicht ordnungsgemäß entsorgt werden. In China, wo ein großer Teil der globalen Leiterplattenproduktion stattfindet, gelangen jährlich <b>Tausende Tonnen Schwermetalle und Säuren</b> in die Umwelt, wodurch landwirtschaftliche Flächen und Wasserquellen verseucht werden. <a href="https://www.fraunhofer-zukunftsfabrik.de/?p=4256">[Quelle: Fraunhofer Institut, 2023]</a> Einige Hersteller setzen inzwischen auf alternative Fertigungsverfahren mit reduzierter Chemikaliennutzung, doch die Umsetzung ist bislang begrenzt.</li>
<li><b>Akkuproduktion:</b> Lithium-Ionen-Batterien benötigen Metalle wie Nickel, Kobalt und Lithium, deren Förderung umweltschädlich ist. Allein die <b>Gewinnung von einer Tonne Nickel verursacht 14 Tonnen CO₂-Emissionen.</b> <a href="https://www.mpg.de/23849692/metall-stahl-produktion-co2-neutral-energieeffizient">[Quelle: Max-Planck-Gesellschaft, 2024]</a></li>
</ul>

Transportwege: Ein oft übersehener Faktor

<img class="img-fluid w-100" src="/assets/images/blog/smartphone_supply_chain.png" alt="Produktionsschnitte der Smartphone Herstellung">
<small>Quelle: [Bild](https://www.bild.de/bild-plus/digital/smartphone-und-tablet/smartphone/langer-weg-eines-handys-53442300.bild.html)</small>

Neben der Rohstoffgewinnung und Produktion trägt auch der globale Transport erheblich zum CO₂-Fußabdruck der IT-Branche bei. Viele Bauteile werden in verschiedenen Ländern gefertigt, bevor sie schließlich in Endmontagewerken zu einem fertigen Produkt zusammengefügt werden. Ein Laptop beispielsweise enthält Rohstoffe aus Afrika, verarbeitet in Asien, und wird dann in Europa oder Nordamerika verkauft. Diese komplexen Lieferketten führen zu enormen Transportemissionen:

<ul>
<li><b>Schiffsverkehr:</b> Containerschiffe, die auch IT-Bauteile über die Weltmeere transportieren, stießen im Jahr 2015 <b>932 Millionen Tonnen CO₂</b> aus. <a href="https://www.umweltbundesamt.de/themen/wasser/gewaesser/meere/nutzung-belastungen/schifffahrt#fakten-zur-seeschifffahrt-und-zu-ihren-auswirkungen-auf-die-umwelt">[Quelle: Umweltbundesamt, 2023]</a></li>
<li><b>Luftfracht:</b> Besonders schnelle Lieferungen per Flugzeug sind noch klimaschädlicher – der Lufttransport verursacht pro Tonne Fracht etwa <b>180-mal mehr CO₂-Emissionen als der Seeverkehr</b>. <a href="https://www.itf-oecd.org/sites/default/files/docs/dp201421.pdf">[Quelle: International Transport Forum, 2014]</a></li>
<li><b>Letzte Meile:</b> Auch die Lieferung an Endkunden per Lkw oder Kurierdienst trägt erheblich zum CO₂-Fußabdruck bei, insbesondere durch den steigenden Onlinehandel.</li>
</ul>

Maßnahmen wie die Verkürzung von Lieferketten, die Nutzung von energieeffizienteren Transportmitteln und regionale Produktionsstandorte könnten diese Emissionen erheblich reduzieren.

## **Elektroschrott: Das ungelöste Entsorgungsproblem**

Jedes Jahr entstehen weltweit über **50 Millionen Tonnen Elektroschrott** – weniger als 20 % werden recycelt. Dabei enthalten IT-Geräte wertvolle Rohstoffe wie Gold, Kupfer und Kobalt, aber auch gefährliche Substanzen, die umweltgerecht entsorgt werden müssen:

<ul>
<li><b>Gold, Kupfer und Kobalt:</b> Durch Recycling könnten diese Materialien wiedergewonnen und für neue Produkte genutzt werden. Beispielsweise wird recyceltes Gold bereits in Smartphones wiederverwendet, wodurch der Bedarf an neuem Goldabbau reduziert werden kann. <a href="https://globalewastemonitor.org/">[Quelle: Global e-Waste Monitor, 2022]</a></li>
<li><b>Giftstoffe:</b> Viele Geräte enthalten Blei, Quecksilber und Flammschutzmittel, die Umwelt und Gesundheit gefährden. In unsachgemäß entsorgten Geräten können diese Stoffe ins Grundwasser gelangen und langfristige Schäden in Ökosystemen verursachen. <a href="https://wedocs.unep.org/xmlui/bitstream/handle/20.500.11822/35364/CoCL.pdf">[Quelle: UNEP, 2020]</a></li>
<li><b>Illegale Müllentsorgung:</b> Alte IT-Hardware wird oft in Entwicklungsländer exportiert, wo sie unter gesundheitsgefährdenden Bedingungen zerlegt wird. Laut einer Untersuchung des Basel Action Network (BAN) werden <b>jährlich etwa 352.474 Tonnen Elektroschrott illegal aus Europa exportiert</b>, oft getarnt als Recycling. In Ländern wie Ghana entstehen riesige Elektroschrott-Deponien, auf denen Arbeiter ohne Schutzmaßnahmen giftige Dämpfe einatmen und schweren Gesundheitsrisiken ausgesetzt sind. <a href="https://wiki.ban.org/images/f/f4/Holes_in_the_Circular_Economy-_WEEE_Leakage_from_Europe.pdf">[Quelle: Basel Action Network, 2019]</a></li>
</ul>


<img class="img-fluid w-100" src="/assets/images/blog/elektroschrott_recycling.jpeg" alt="Elektroschrott nach Kontinenten">
<small>Quelle: [Statista](https://de.statista.com/infografik/33250/elektroabfaelle-nach-regionen/)</small>

## **Refurbished Hardware und Kreislaufwirtschaft: Ressourcen im Kreislauf halten**

Eine der wirkungsvollsten Maßnahmen für eine nachhaltigere IT ist die **Verlängerung der Lebensdauer von Geräten**. Anstatt Hardware nach wenigen Jahren auszutauschen, können Unternehmen und Verbraucher auf **Refurbished-Geräte** setzen – professionell aufbereitete Geräte, die technisch modernisiert und erneut genutzt werden. Diese Alternative reduziert nicht nur die Kosten, sondern auch den enormen **Ressourcenverbrauch neuer Produktionen**. Zudem kann die Nutzung von Refurbished-Hardware den **CO₂-Ausstoß, Ressourcenverbrauch, und Elektroschrott um bis zu 80 %** im Vergleich zu neuen Geräten senken. [Quelle: refurbed, 2024](https://www.refurbed.de/a/pressrelease-refurbed-fraunhofer/) Neben wirtschaftlichen Vorteilen trägt die Verlängerung der Gerätelebensdauer auch zur Reduzierung von Elektroschrott bei, da weniger Altgeräte entsorgt werden müssen. Unternehmen, die auf Refurbished-Hardware setzen, profitieren nicht nur von geringeren Anschaffungskosten, sondern auch von positiven Nachhaltigkeitseffekten, die sich in ihrer ESG-Bilanz niederschlagen.

Noch konsequenter ist der Ansatz der **Kreislaufwirtschaft**. Hier geht es darum, **IT-Geräte, ihre Bauteile und Materialien möglichst lange im Nutzungskreislauf zu halten**, anstatt sie nach kurzer Zeit zu entsorgen. Hersteller müssen verstärkt auf **modular aufgebaute, reparierbare Designs** setzen und den Zugang zu **Ersatzteilen erleichtern**. Viele Komponenten, die in der klassischen IT-Wertschöpfungskette als "veraltet" gelten, können in anderen Bereichen noch wertvolle Dienste leisten. Ein Beispiel: **In Rechenzentren ausgemusterte Server** finden oft als günstige, leistungsfähige Maschinen in kleineren Unternehmen eine zweite Verwendung. [Quelle: Ellen MacArthur Foundation, 2023](https://www.ellenmacarthurfoundation.org/circular-economy-diagram)

Zusätzlich kann **Recycling wertvolle Rohstoffe wie Gold, Kupfer und Seltene Erden zurückgewinnen**, wodurch die Umweltbelastung durch Neugewinnung sinkt. **Tech-Giganten wie Apple setzen bereits auf recyceltes Aluminium** in ihren MacBooks, während Google anstrebt, bis 2030 in all seinen Hardware-Produkten ausschließlich recycelte Materialien zu verwenden  all seinen Hardware-Produkten **ausschließlich recycelte Materialien** zu verwenden ([Quelle: Apple Environmental Progress Report, 2023(https://www.apple.com/environment/pdf/Apple_Environmental_Progress_Report_2024.pdf)]; [Google Sustainability Report, 2023](https://sustainability.google/reports/google-2023-environmental-report/)). Doch um die volle Wirkung der Kreislaufwirtschaft auszuschöpfen, sind auch **Verbraucher gefragt**: Wer sich bewusst für **langlebige, reparierbare oder generalüberholte Geräte** entscheidet, trägt aktiv zur **Reduzierung von Elektroschrott und CO₂-Emissionen** bei.

## **Wege zu einer nachhaltigeren IT**

Nachhaltigkeit in der IT erfordert ein Umdenken entlang des gesamten Lebenszyklus von Hardware. **Längere Nutzungszeiten, gezieltes Recycling und eine konsequente Kreislaufwirtschaft** sind zentrale Hebel, um Ressourcen zu schonen und Emissionen zu senken. Unternehmen und Verbraucher können gleichermaßen Verantwortung übernehmen – sei es durch den Kauf von langlebiger Hardware, den Einsatz von Refurbished-Geräten oder den bewussten Umgang mit Elektroschrott.

Im nächsten Artikel geht es um den **Lifecycle eines Rechenzentrums**. Wir zeigen, welche Umweltbelastungen von Bau bis Rückbau entstehen und welche nachhaltigen Strategien helfen, den CO₂-Fußabdruck zu minimieren.
