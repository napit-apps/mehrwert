---
layout: post
title: Wie Software die Nutzungsdauer von Hardware beeinflusst
cover: cover.jpg
type: "Blog-Post"
datum:  "14.03.2025"
post_image: "/assets/images/blog/2023-11-13-nachhaltige-softwareentwicklung.jpg"
tags: "#green-coding, #nachhaltigkeit"
categories: de posts
author: "Alina"
featured: false
---

In dieser dritten und letzten Ausgabe unserer Artikelserie über *Embodied Carbon* widmen wir uns einem oft übersehenen Aspekt der digitalen Infrastruktur: den **CO₂-Emissionen eines gesamten Rechenzentrums über seinen Lebenszyklus**. Während sich viele Nachhaltigkeitsbemühungen auf den **laufenden Betrieb** konzentrieren, entstehen erhebliche Emissionen **bereits während der Bauphase** und durch die Produktion der Hardware. Den zweiten Teil der Serie zu Embodied Carbon findest du [hier](https://mehrwert.tech/embodied-carbon-2).

## **Bauphase: Ein oft unterschätzter Emissionsfaktor**

Der **Bau eines Rechenzentrums** ist eine der emissionsintensivsten Phasen seines Lebenszyklus. Materialien wie **Stahl, Beton und Aluminium** verursachen hohe **CO₂-Emissionen in der Produktion und beim Transport**. Die größten Umweltbelastungen entstehen durch:

- **Betonherstellung:** Beton ist für **etwa 8 % der globalen CO₂-Emissionen** verantwortlich, insbesondere durch die **energieintensive Zementproduktion**. [[Andrew, R. M., 2019]](https://essd.copernicus.org/articles/11/1675/2019/) Der Bau eines mittelgroßen Rechenzentrums kann mehrere tausend Tonnen Beton erfordern, abhängig von der Größe und Bauweise. Da die Herstellung von einer Tonne Zement durchschnittlich 0,6 bis 0,9 Tonnen CO₂ verursacht, ergbit dies eine CO₂-Emission von mehreren tausend Tonnen. 
- **Stahlproduktion:** Die Herstellung **einer Tonne Stahl verursacht rund 1,5 Tonnen CO₂**. [[acatech, 2024]](https://dechema.de/Themen/Studien%2Bund%2BPositionspapiere/2024%2B03%2BH2%2BKompass/_/H2K_IND_Stahl.pdf) In einem Rechenzentrum werden **große Mengen Stahl** für die Gebäudestruktur und **Serverracks** verwendet. Beispielsweise gibt es in deutschen Rechenzentren insgesamt etwa **266.000 Serverracks**. [[Umweltbundesamt, 2010]](https://www.umweltbundesamt.de/sites/default/files/medien/461/publikationen/4037.pdf) Die **CO₂-Emissionen pro Tonne Stahl** hängen stark von der **Produktionsmethode** ab. Während klassische Verfahren hohe Emissionen verursachen, könnten neue Technologien wie die **Nutzung von grünem Wasserstoff** die Bilanz deutlich verbessern. Diese Ansätze sind jedoch noch in der **Entwicklungsphase** und mit **hohem Energieaufwand** verbunden. [[DWV, 2021]](https://dwv-info.de/wp-content/uploads/2023/04/20210616-EP-Gruener-Stahl-min-1.pdf)
- **Aluminiumverarbeitung:** **Aluminium hat eine hohe Energiedichte** in der Produktion, wird jedoch aufgrund seines **geringen Gewichts** und der **Korrosionsbeständigkeit** in vielen Rechenzentren eingesetzt. **Die Produktion von einer Tonne Primäraluminium verursacht durchschnittlich 11,5 Tonnen CO₂.** Die genaue Zahl kann je nach **Produktionsmethode** und **Energiequelle** variieren. Die **Aluminiumherstellung** ist besonders energieintensiv, da für die **Gewinnung aus Bauxit** große Mengen an Elektrizität benötigt werden. [[International Aluminium Institute, 2018]](https://international-aluminium.org/wp-content/uploads/2021/08/CF-Good-Guidance-v1-2018.pdf)
- **Energieverbrauch bei der Errichtung:** Die **Bauphase** erfordert **große Mengen an elektrischer Energie** für Maschinen, Transport und die Montage der IT-Infrastruktur. Da die meisten **Baugeräte mit fossilen Brennstoffen betrieben werden**, entstehen erhebliche **CO₂-Emissionen** – insbesondere durch **dieselbetriebene Bagger, Kräne und Betonmischer**.

## **Betriebsphase: Der Hauptverursacher von CO₂-Emissionen**

Nach der Fertigstellung verursacht der **Betrieb eines Rechenzentrums** kontinuierlich Emissionen, vor allem durch den **Stromverbrauch für IT-Hardware, Kühlung und Infrastruktur**. Die wichtigsten Einflussfaktoren sind:

- **Stromverbrauch der Server:** **Rechenzentren weltweit verbrauchten im Jahr 2022 rund 360 TWh Strom**, was etwa **1,7 % des globalen Energiebedarfs** entspricht. [[Gewinn, 2024]](https://www.gewinn.com/artikel/rechenzentren-sind-wachstumstreiber-der-stromnachfrage), [[Statista, 2024]](https://de.statista.com/statistik/daten/studie/239764/umfrage/weltweiter-stromverbrauch/) Die tatsächlichen **Emissionen hängen stark vom Strommix ab** – während **erneuerbare Energien den CO₂-Fußabdruck minimieren können**, führen **fossile Energiequellen zu erheblichen Emissionen**.
- **Kühlung:** Die **Kühlung kann bis zu 40 % des gesamten Energieverbrauchs** ausmachen. [[Wikipedia]](https://de.wikipedia.org/wiki/Green_IT) **Effiziente Kühlmethoden** wie **Flüssigkühlung** oder die **Nutzung von Außenluft** können die Emissionen erheblich reduzieren.
- **Power Usage Effectiveness (PUE):** **Moderne Rechenzentren erreichen PUE-Werte von 1,2 oder niedriger**, während **ältere Anlagen Werte von über 2** haben können, was zu massivem Energieverlust führt. [[Computer Weekly, 2023]](https://www.computerweekly.com/de/meinung/Energieeffizienz-von-Rechenzentren-aus-alt-mach-nachhaltig) **Der PUE-Wert beschreibt das Verhältnis zwischen dem gesamten Energieverbrauch eines Rechenzentrums und der tatsächlich für die IT-Infrastruktur genutzten Energie** – je niedriger der Wert, desto **effizienter wird die eingesetzte Energie genutzt**.
- **Backup-Systeme:** **Dieselgeneratoren als Notstromaggregate erzeugen erhebliche CO₂-Emissionen** und Luftverschmutzung, insbesondere bei **älteren Anlagen**. [[Umweltbundesamt, 2022]](https://www.bund-hessen.de/pm/news/bund-klagt-gegen-zu-hohe-emissionen-aus-notstromdieselmotoren-von-rechenzentren/)

## **Stilllegung und Recycling: Was passiert nach 15–25 Jahren?**

Nach etwa **15–25 Jahren** wird ein **Rechenzentrum entweder modernisiert oder stillgelegt**. Auch dieser Schritt verursacht **Umweltbelastungen**:

- **Entsorgung von Baumaterialien:** Ohne ein **nachhaltiges Rückbaukonzept** landen große Mengen an **Beton, Stahl und anderen Baustoffen auf Deponien**, anstatt recycelt zu werden.
- **Elektroschrott:** **Jedes Jahr entstehen weltweit über 60 Millionen Tonnen Elektroschrott**, von denen **nur ein Bruchteil recycelt wird**. [[unitar, 2024]](https://ewastemonitor.info/wp-content/uploads/2024/12/GEM_2024_EN_11_NOV-web.pdf)

Mehr über die Umweltprobleme beim Rohstoffabbau und der Entsorgung von IT-Hardware findest du in unserem vorherigen Artikel. [Hier lesen](https://mehrwert.tech/embodied-carbon-2)

## **Umweltbilanz von Rechenzentren über den gesamten Lebenszyklus**  

Der **BUND** hat im **2018** im Rahmen einer Studie den **Ressourcenverbrauch** und die **CO₂-Emissionen** verschiedener Rechenzentren über den **gesamten Lifecycle** abgeschätzt. [[Bundesumweltamt, 2018]](https://www.umweltbundesamt.de/sites/default/files/medien/1410/publikationen/2018-02-23_texte_19-2018_ressourceneffizienz-rechenzentren.pdf) Dabei wurden die Umweltwirkungen in **vier Phasen** unterteilt: **Herstellung, Distribution, Nutzung und Entsorgung.**  

Die Modell-Rechenzentren waren:  

- **RZ1:** Ein **kommunales Rechenzentrum** mit einer **IT-Nennleistung von 750 kW**. Es wird für **Managed Services und Colocation** genutzt.  
- **RZ2:** Ein **Webhosting-Rechenzentrum** mit einer **IT-Nennleistung von 83 kW**. Es stellt primär **Hosting-Dienste** bereit.  
- **RZ3:** Ein **IT-Beratungs-Rechenzentrum** mit einer **IT-Nennleistung von 192 kW**. Es dient hauptsächlich **internen Unternehmensdiensten.**  

Die Umweltwirkungen der Rechenzentren wurden anhand verschiedener **Indikatoren** analysiert:  

- **ADP (Abiotic Depletion Potential):** Das **abiotische Ressourcenverbrauchspotential** bewertet die Auswirkungen auf die Verfügbarkeit **nicht erneuerbarer Ressourcen** wie **Metalle und fossile Rohstoffe.**  
- **KEA (Kumulierter Energieaufwand):** Dieser Indikator beschreibt die **gesamte Energiemenge**, die über den **Lebenszyklus** hinweg benötigt wird.  
- **THG (Treibhausgaspotenzial):** Dieser Indikator misst die **CO₂-Emissionen** über den gesamten **Lebenszyklus.**  
- **Wasserverbrauch:** Dieser Indikator bewertet den **gesamten Wasserverbrauch** über den **Lebenszyklus.**  

<img class="img-fluid w-100" src="/assets/images/blog/Relative_Umweltauswirkungen_Rechenzentrum.png" alt="Relative Verteilung der Umweltwirkungen der Rechenzentren nach Lebenszyklusphasen">
<small> [Bundesumweltamt, 2018](https://www.umweltbundesamt.de/sites/default/files/medien/1410/publikationen/2018-02-23_texte_19-2018_ressourceneffizienz-rechenzentren.pdf)</small>

Die Analyse verdeutlicht, dass über alle Indikatoren hinweg **die Nutzungsphase die größte Umweltbelastung verursacht**, insbesondere beim **Energieverbrauch und den CO₂-Emissionen.** Die **Herstellung von Hardware** trägt jedoch ebenfalls **signifikant** zu den Umweltwirkungen bei, insbesondere beim **abiotischen Ressourcenverbrauchspotential**. Die **Entsorgungsphase** hat dagegen einen **vergleichsweise geringen Anteil** an den Gesamtwirkungen. Obwohl diese Studie bereits im Jahr 2018 veröffentlicht wurde, sind ihre Ergebnisse weiterhin von großer Relevanz, da sich die grundlegenden Emissionsquellen und Umweltwirkungen von Rechenzentren seither kaum verändert haben. 

## **Maßnahmen hin zu grüneren Rechenzentren**  

Um die **Umweltbelastung** eines Rechenzentrums über den **gesamten Lebenszyklus** hinweg zu minimieren, sind **verschiedene Ansätze erforderlich**:  

- **Nachhaltige Bauweise:** Der Einsatz von **CO₂-reduziertem Beton, recyceltem Stahl** und **nachhaltigen Materialien** kann die **Emissionen in der Bauphase** senken.  
- **Energieeffiziente Hardware:** **Moderne Prozessoren und Speichertechnologien** mit **niedrigerem Stromverbrauch** reduzieren den **CO₂-Ausstoß** im Betrieb.  
- **Grüne Energiequellen:** Der Einsatz von **erneuerbaren Energien** wie **Wind- und Solarenergie** kann den **Stromverbrauch eines Rechenzentrums** nahezu **klimaneutral** gestalten.  
- **Abwärmenutzung:** Durch **intelligente Wärmerückgewinnung** können **Rechenzentren ihre Abwärme** an **lokale Wohn- oder Industriegebiete** abgeben.  
- **Kreislaufwirtschaft:** Die **Wiederverwendung** und das **Recycling** von **Servern, Baumaterialien** und anderen **Komponenten** verlängern die **Nutzungsdauer** und **reduzieren Abfall.**  

## **Fazit**  

**Rechenzentren sind das Rückgrat der digitalen Welt, verursachen aber über ihren gesamten Lebenszyklus hinweg erhebliche CO₂-Emissionen.** Während der **laufende Stromverbrauch** oft im **Fokus steht**, darf die **Bauphase** sowie die **Entsorgung von Baumaterialien und Hardware** nicht vernachlässigt werden.  

Durch **nachhaltige Bauweisen, energieeffiziente Hardware, erneuerbare Energie, Nutzung der Abwärme und Kreislaufwirtschaft** können Unternehmen ihren **ökologischen Fußabdruck erheblich reduzieren.**  

**Es ist an der Zeit, die IT-Infrastruktur der Zukunft so zu gestalten, dass sie nicht nur leistungsfähig, sondern auch nachhaltig ist.**

Für mehr Einblicke zum Thema Embodied Carbon lohnt sich ein Blick in den [ersten](https://mehrwert.tech/embodied-carbon-1) und [zweiten](https://mehrwert.tech/embodied-carbon-2) Teil der Serie. 
