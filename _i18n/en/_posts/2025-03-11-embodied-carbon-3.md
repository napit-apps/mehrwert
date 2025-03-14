---
layout: post
title: Embodied carbon - the lifecycle of a data center and its carbon footprint
cover: cover.jpg
type: "Blog-Post"
datum:  "14.03.2025"
post_image: "/assets/images/blog/2023-11-13-nachhaltige-softwareentwicklung.jpg"
tags: "#green-coding, #nachhaltigkeit"
categories: en posts
author: "Alina"
featured: false
---

In this third and final edition of our article series on *Embodied Carbon*, we turn our focus to an often overlooked aspect of digital infrastructure: **the CO₂ emissions of an entire data center over its lifecycle**. While many sustainability efforts concentrate on the **operational phase**, significant emissions arise **already during the construction phase** and through hardware production. You can find the second part of the series on embodied carbon [here](https://mehrwert.tech/embodied-carbon-2).

## **Construction Phase: A Frequently Underestimated Emission Factor**

The **construction of a data center** is one of the most emission-intensive phases of its lifecycle. Materials such as **steel, concrete, and aluminum** cause high **CO₂ emissions during production and transportation**. The main environmental impacts stem from:

- **Concrete Production:** Concrete is responsible for **about 8% of global CO₂ emissions**, primarily due to the **energy-intensive cement production process**. [[Andrew, R. M., 2019]](https://essd.copernicus.org/articles/11/1675/2019/) The construction of a medium-sized data center can require several thousand tons of concrete, depending on the size and construction method. Since the production of one ton of cement generates an average of 0.6 to 0.9 tons of CO₂, this results in CO₂ emissions of several thousand tons. 
- **Steel Production:** Producing **one ton of steel emits roughly 1.5 tons of CO₂**. [[acatech, 2024]](https://dechema.de/Themen/Studien%2Bund%2BPositionspapiere/2024%2B03%2BH2%2BKompass/_/H2K_IND_Stahl.pdf) Data centers use **large quantities of steel** for both the building structure and **server racks**. For example, there are approximately **266,000 server racks** in German data centers. [[Umweltbundesamt, 2010]](https://www.umweltbundesamt.de/sites/default/files/medien/461/publikationen/4037.pdf) The **CO₂ emissions per ton of steel** vary considerably depending on the **production method**. While traditional methods generate high emissions, new technologies such as the **use of green hydrogen** could significantly improve the balance. These approaches, however, are still in the **development phase** and require **high energy input**. [[DWV, 2021]](https://dwv-info.de/wp-content/uploads/2023/04/20210616-EP-Gruener-Stahl-min-1.pdf)
- **Aluminum Processing:** **Aluminum has a high energy density** during production but is widely used in data centers due to its **light weight** and **corrosion resistance**. **Producing one ton of primary aluminum emits on average 11.5 tons of CO₂.** The exact figure may vary depending on the **production method** and **energy source**. Aluminum production is particularly energy-intensive, as the **extraction from bauxite** requires vast amounts of electricity. [[International Aluminium Institute, 2018]](https://international-aluminium.org/wp-content/uploads/2021/08/CF-Good-Guidance-v1-2018.pdf)
- **Energy Consumption During Construction:** The **construction phase** demands **large quantities of electrical energy** for machinery, transportation, and the assembly of IT infrastructure. Since most **construction equipment runs on fossil fuels**, significant **CO₂ emissions** are generated – especially from **diesel-powered excavators, cranes, and concrete mixers**.

## **Operational Phase: The Main Contributor to CO₂ Emissions**

After completion, the **operation of a data center** continuously generates emissions, primarily due to the **power consumption for IT hardware, cooling, and supporting infrastructure**. The key factors include:

- **Server Power Consumption:** **Data centers worldwide consumed around 360 TWh of electricity in 2022**, which is about **1.7% of the global energy demand**. [[Gewinn, 2024]](https://www.gewinn.com/artikel/rechenzentren-sind-wachstumstreiber-der-stromnachfrage), [[Statista, 2024]](https://de.statista.com/statistik/daten/studie/239764/umfrage/weltweiter-stromverbrauch/) The actual **emissions depend heavily on the energy mix** – while **renewable energy sources can minimize the CO₂ footprint**, fossil fuels lead to significant emissions.
- **Cooling:** Cooling can account for up to **40% of the total energy consumption**. [[Wikipedia]](https://de.wikipedia.org/wiki/Green_IT) **Efficient cooling methods**, such as **liquid cooling** or **utilizing outside air**, can considerably reduce emissions.
- **Power Usage Effectiveness (PUE):** **Modern data centers achieve PUE values of 1.2 or lower**, whereas **older facilities may exceed values of 2**, leading to massive energy losses. [[Computer Weekly, 2023]](https://www.computerweekly.com/de/meinung/Energieeffizienz-von-Rechenzentren-aus-alt-mach-nachhaltig) **The PUE value describes the ratio between the total energy consumption of a data center and the energy actually used for IT infrastructure** – the lower the value, the **more efficiently the energy is used**.
- **Backup Systems:** **Diesel generators as backup power units generate significant CO₂ emissions** and air pollution, particularly in **older facilities**. [[Umweltbundesamt, 2022]](https://www.bund-hessen.de/pm/news/bund-klagt-gegen-zu-hohe-emissionen-aus-notstromdieselmotoren-von-rechenzentren/)

## **Decommissioning and Recycling: What Happens After 15–25 Years?**

After approximately **15–25 years**, a **data center is either modernized or decommissioned**. This step also causes **environmental impacts**:

- **Disposal of Building Materials:** Without a **sustainable deconstruction concept**, large amounts of **concrete, steel, and other building materials end up in landfills** rather than being recycled.
- **Electronic Waste:** **Over 60 million tons of electronic waste are generated worldwide each year**, of which **only a fraction is recycled**. [[unitar, 2024]](https://ewastemonitor.info/wp-content/uploads/2024/12/GEM_2024_EN_11_NOV-web.pdf)

You can find out more about the environmental problems associated with the extraction of raw materials and the disposal of IT hardware in our previous article. [Read here](https://mehrwert.tech/embodied-carbon-2)

## **Environmental Impact of Data Centers Over Their Entire Lifecycle**

The **BUND** conducted a study in **2018** to assess the **resource consumption** and **CO₂ emissions** of various data centers over their **entire lifecycle**. [[Bundesumweltamt, 2018]](https://www.umweltbundesamt.de/sites/default/files/medien/1410/publikationen/2018-02-23_texte_19-2018_ressourceneffizienz-rechenzentren.pdf) The environmental impacts were divided into **four phases**: **production** (green), distribution, usage, and disposal.**

The model data centers were:

- **DC1:** A **municipal data center** with an **IT rated capacity of 750 kW**. It is used for **managed services and colocation**.
- **DC2:** A **web hosting data center** with an **IT rated capacity of 83 kW**. It primarily provides **hosting services**.
- **DC3:** An **IT consulting data center** with an **IT rated capacity of 192 kW**. It mainly serves **internal corporate services**.

The environmental impacts of the data centers were analyzed based on various **indicators**:

- **ADP (Abiotic Depletion Potential):** This measures the impact on the availability of **non-renewable resources** such as **metals and fossil fuels**.
- **KEA (Cumulative Energy Demand):** This indicator describes the **total amount of energy** required over the **lifecycle**.
- **GHG (Greenhouse Gas Potential):** This indicator measures the **CO₂ emissions** over the entire **lifecycle**.
- **Water Consumption:** This indicator assesses the **total water usage** throughout the **lifecycle**.

<img class="img-fluid w-100" src="/assets/images/blog/Relative_Umweltauswirkungen_Rechenzentrum.png" alt="Relative distribution of the environmental impacts of data centers by lifecycle phase">
<small> [Bundesumweltamt, 2018](https://www.umweltbundesamt.de/sites/default/files/medien/1410/publikationen/2018-02-23_texte_19-2018_ressourceneffizienz-rechenzentren.pdf)</small>

The analysis clearly shows that across all indicators, **the operational phase is the largest contributor to environmental impact**, particularly in terms of **energy consumption and CO₂ emissions**. However, the **production of hardware** also contributes **significantly** to the environmental impacts, especially regarding the **abiotic depletion potential**. In contrast, the **disposal phase** has a **comparatively low share** of the overall impacts. Although this study was published back in 2018, its findings remain highly relevant, as the fundamental sources of emissions and environmental impacts of data centers have hardly changed since then.

## **Measures Towards Greener Data Centers**

To minimize the **environmental impact** of a data center over its **entire lifecycle**, various approaches are necessary:

- **Sustainable Construction:** Using **CO₂-reduced concrete, recycled steel** and **sustainable materials** can lower emissions during the construction phase.
- **Energy-Efficient Hardware:** **Modern processors and memory technologies** with **lower power consumption** reduce the **CO₂ output** during operation.
- **Green Energy Sources:** Using **renewable energies** such as **wind and solar power** can make a data center’s electricity consumption nearly **climate-neutral**.
- **Waste Heat Recovery:** Through **intelligent heat recovery systems**, data centers can channel their waste heat to **local residential or industrial areas**.
- **Circular Economy:** The **reuse** and **recycling** of **servers, building materials** and other **components** can extend their **lifespan** and **reduce waste**.

## **Conclusion**

**Data centers are the backbone of the digital world, yet they generate significant CO₂ emissions over their entire lifecycle.** While the **ongoing electricity consumption** often takes center stage, the **construction phase** as well as the **disposal of building materials and hardware** must not be neglected.

Through **sustainable construction practices, energy-efficient hardware, renewable energy, waste heat recovery, and a circular economy approach**, companies can significantly reduce their **ecological footprint**.

**It is time to design the IT infrastructure of the future so that it is not only high-performing but also sustainable.**

For more insights into the topic of embodied carbon, it is worth taking a look at the [first](https://mehrwert.tech/embodied-carbon-1) and [second](https://mehrwert.tech/embodied-carbon-2) part of the series. 