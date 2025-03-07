---
layout: post
title: Embodied carbon - environmental impact of hardware production and disposal
cover: cover.jpg
type: "Blog-Post"
datum:  "07.03.2025"
post_image: "/assets/images/blog/2023-11-13-nachhaltige-softwareentwicklung.jpg"
tags: "#green-coding, #nachhaltigkeit"
categories: de posts
author: "Alina, Marcel"
featured: false
---

Whether smartphone, laptop or server - every IT device begins its life cycle with a massive consumption of resources. Even before we switch on a device for the first time, it has already left a considerable ecological footprint. From the extraction of raw materials and energy-intensive manufacturing processes to the growing problem of electronic waste: the invisible environmental costs of IT are enormous. This article sheds light on the darker side of hardware production. We show how the extraction of raw materials, energy-intensive manufacturing processes and e-waste impact the environment. We also present strategies to reduce the ecological footprint of the IT industry. Den ersten Teil der Serie zu Embodied Carbon findest du [hier](https://mehrwert.tech/embodied-carbon-1).

## **Commodity extraction: an environmental and social hotspot**

<img class="img-fluid w-100" src="/assets/images/blog/smartphone_resources.jpg" alt="Raw materials that make up a smartphone">
<small>Quelle: [OroVerde - Die Tropenwaldstiftung](https://www.regenwald-schuetzen.org/regenwald-wissen/faszination-regenwald/haeufige-fragen/welche-rohstoffe-gibt-es)</small>

IT devices consist of a variety of materials such as silicon, copper, gold and rare earths. However, their extraction has serious consequences for people and the environment:

<ul>
<li><b>Habitat Destruction:</b> The extraction of gold, lithium, and cobalt leads to deforestation of rainforests, soil contamination, and loss of natural habitats. Cobalt mining in the Democratic Republic of the Congo has already destroyed over <b>500,000 hectares of rainforest</b> (Source: Global Forest Watch, 2023).</li>
<li><b>Water Consumption and Pollution:</b> Lithium extraction in the Atacama Desert consumes up to <b>2 million liters of water per ton of lithium</b> <a href="https://www.fr.de/wirtschaft/konflikte-wasser-10968084.html">[Source: Friends of the Earth, 2022]</a>. This leads to the drying out of local ecosystems and endangers indigenous communities.</li>
<li><b>Social Issues:</b> Up to <b>40,000 children work in cobalt mines</b> in the Democratic Republic of the Congo under hazardous conditions <a href="https://www.amnesty.de/informieren/aktuell/demokratische-republik-kongo-grosskonzerne-tun-zu-wenig-gegen-kinderarbeit">[Source: Amnesty International, 2023]</a>. Additionally, profits from raw materials finance armed conflicts and destabilize entire regions.</li>
</ul>

According to the International Energy Agency (IEA), demand for these raw materials will more than double by **2040**, which will further exacerbate the negative consequences. [Source: International Energy Agency, 2024](https://www.iea.org/news/sharp-declines-in-critical-mineral-prices-mask-risks-of-future-supply-strains-as-energy-transitions-advance)

<img class="img-fluid w-100" src="/assets/images/blog/Smartphone_resources_map.jpg" alt="Map - Where which raw materials are mined">
<small>Quelle: [everphone](https://everphone.com/de/blog/oekologische-handys/)</small>

## **Energy-intensive production: the hidden CO₂ driver**

The extraction of raw materials is followed by an energy-intensive manufacturing process that causes enormous amounts of CO₂ emissions:


<ul>
<li><b>Semiconductor Manufacturing:</b> Producing microchips demands extremely high levels of purity, involving significant water and chemical consumption. Particularly problematic is production in Taiwan, which accounts for over <b>90% of global high-end chip manufacturing</b> <a href="https://www.economist.com/special-report/2023/03/06/taiwans-dominance-of-the-chip-industry-makes-it-more-important">[Source: The Economist, 2023]</a>. Manufacturing a single 30 cm silicon wafer consumes <b>up to 8,000 liters of water</b>—an enormous strain for water-scarce regions like Taiwan. <a href="https://www.globalwaterintel.com">[Source: Global Water Intelligence (2009) Pure Water, Semiconductors and The Recession]</a></li>
<li><b>Circuit Board Manufacturing:</b> Etching copper traces produces toxic chemicals, which are often improperly disposed of. In China, where a large share of global circuit board production occurs, <b>thousands of tons of heavy metals and acids</b> contaminate the environment each year, polluting agricultural land and water sources. <a href="https://www.fraunhofer-zukunftsfabrik.de/?p=4256">[Source: Fraunhofer Institute, 2023]</a> Some manufacturers are now adopting alternative processes that reduce chemical use, but widespread implementation remains limited.</li>
<li><b>Battery Production:</b> Lithium-ion batteries require metals such as nickel, cobalt, and lithium, whose extraction is environmentally harmful. The extraction of just <b>one ton of nickel produces 14 tons of CO₂ emissions.</b> <a href="https://www.mpg.de/23849692/metall-stahl-produktion-co2-neutral-energieeffizient">[Source: Max Planck Society, 2024]</a></li>
</ul>

Transportation routes: an often overlooked factor

<img class="img-fluid w-100" src="/assets/images/blog/smartphone_supply_chain.png" alt="Production cuts in smartphone manufacturing">
<small>Quelle: [Bild](https://www.bild.de/bild-plus/digital/smartphone-und-tablet/smartphone/langer-weg-eines-handys-53442300.bild.html)</small>

<ul>
<li><b>Shipping:</b> Container ships, which also transport IT components across the world's oceans, emitted <b>932 million tons of CO₂</b> in 2015. <a href="https://www.umweltbundesamt.de/themen/wasser/gewaesser/meere/nutzung-belastungen/schifffahrt#fakten-zur-seeschifffahrt-und-zu-ihren-auswirkungen-auf-die-umwelt">[Source: German Environment Agency (Umweltbundesamt), 2023]</a></li>
<li><b>Air Freight:</b> Particularly fast deliveries via aircraft are even more harmful to the climate—air transport generates about <b>180 times more CO₂ emissions per ton of freight than sea transport</b>. <a href="https://www.itf-oecd.org/sites/default/files/docs/dp201421.pdf">[Source: International Transport Forum, 2014]</a></li>
<li><b>Last Mile:</b> Delivery to end customers by truck or courier also contributes significantly to the CO₂ footprint, especially due to the growth in online retail.</li>
</ul>

Measures such as shortening supply chains, using more energy-efficient means of transportation and regional production sites could significantly reduce these emissions.

## **Electrical waste: the unsolved disposal problem**

Every year, over **50 million tons of electronic waste** are generated worldwide - less than 20% is recycled. IT devices contain valuable raw materials such as gold, copper and cobalt, but also hazardous substances that need to be disposed of in an environmentally friendly manner:

<ul>
<li><b>Gold, Copper, and Cobalt:</b> Recycling can recover these materials for use in new products. For example, recycled gold is already being reused in smartphones, reducing the demand for newly mined gold. <a href="https://globalewastemonitor.org/">[Source: Global e-Waste Monitor, 2022]</a></li>
<li><b>Toxic Substances:</b> Many devices contain lead, mercury, and flame retardants, posing risks to both the environment and human health. Improperly disposed devices can leak these substances into groundwater, causing long-term damage to ecosystems. <a href="https://wedocs.unep.org/xmlui/bitstream/handle/20.500.11822/35364/CoCL.pdf">[Source: UNEP, 2020]</a></li>
<li><b>Illegal Waste Disposal:</b> Old IT hardware is frequently exported to developing countries, where it is dismantled under hazardous conditions. According to research by the Basel Action Network (BAN), approximately <b>352,474 tons of electronic waste are illegally exported from Europe annually</b>, often disguised as recycling. In countries such as Ghana, massive e-waste dumps have emerged, where workers inhale toxic fumes without protective equipment, exposing them to severe health risks. <a href="https://wiki.ban.org/images/f/f4/Holes_in_the_Circular_Economy-_WEEE_Leakage_from_Europe.pdf">[Source: Basel Action Network, 2019]</a></li>
</ul>

<img class="img-fluid w-100" src="/assets/images/blog/elektroschrott_recycling.jpeg" alt="Electronic waste by continent">
<small>Source: [Statista](https://de.statista.com/infografik/33250/elektroabfaelle-nach-regionen/)</small>

## **Refurbished hardware and the circular economy: keeping resources in circulation**

One of the most effective measures for more sustainable IT is **extending the lifespan of devices**. Instead of replacing hardware after a few years, companies and consumers can rely on **refurbished devices** - professionally refurbished devices that are technically modernized and reused. This alternative not only reduces costs, but also the enormous **resource consumption of new productions**. In addition, the use of refurbished hardware can reduce **CO₂ emissions, resource consumption and electronic waste by up to 80%** compared to new devices. [Source: refurbed, 2024](https://www.refurbed.de/a/pressrelease-refurbed-fraunhofer/) In addition to economic benefits, extending the service life of devices also helps to reduce e-waste, as fewer old devices need to be disposed of. Companies that rely on refurbished hardware not only benefit from lower acquisition costs, but also from positive sustainability effects that are reflected in their ESG balance sheet.

The circular economy** approach is even more consistent. The aim here is to keep **IT devices, their components and materials in the usage cycle for as long as possible** instead of disposing of them after a short time. Manufacturers must increasingly focus on **modular, repairable designs** and facilitate access to **spare parts**. Many components that are considered “obsolete” in the traditional IT value chain can still provide valuable services in other areas. One example: **Servers** decommissioned in data centers often find a second use as inexpensive, powerful machines in smaller companies. [Source: Ellen MacArthur Foundation, 2023](https://www.ellenmacarthurfoundation.org/circular-economy-diagram)

In addition, **recycling can recover valuable raw materials such as gold, copper and rare earths**, reducing the environmental impact of new extraction. **Tech giants like Apple are already using recycled aluminum** in their MacBooks, while Google aims to use only recycled materials in all of its hardware products by 2030 ([Source: Apple Environmental Progress Report, 2023(https://www.apple.com/environment/pdf/Apple_Environmental_Progress_Report_2024.pdf)]; [Google Sustainability Report, 2023](https://sustainability.google/reports/google-2023-environmental-report/)). However, **consumers are also called upon** to exploit the full impact of the circular economy: Those who consciously opt for **long-lasting, repairable or refurbished devices** actively contribute to the **reduction of electronic waste and CO₂ emissions**.

## **Ways to a more sustainable IT**

Sustainability in IT requires a rethink along the entire life cycle of hardware. **Longer usage times, targeted recycling and a consistent circular economy** are key levers for conserving resources and reducing emissions. Companies and consumers alike can take responsibility - be it by purchasing long-lasting hardware, using refurbished devices or consciously handling electronic waste.

The next article is about the **lifecycle of a data center**. We show what environmental impacts arise from construction to dismantling and which sustainable strategies help to minimize the carbon footprint.


