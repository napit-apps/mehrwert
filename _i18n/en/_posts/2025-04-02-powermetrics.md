---
layout: post
title: Energieverbrauch bestimmen – mit Bordmitteln - Der Selbsttest zu Videokonferenztools
cover: cover.jpg
type: "Blog-Post"
datum:  "28.03.2025"
post_image: "/assets/images/blog/2023-11-13-nachhaltige-softwareentwicklung.jpg"
tags: "#green-coding, #nachhaltigkeit"
categories: en posts
author: "Alina"
featured: false
---

## Video Conferencing Tools Compared: How Much Energy Do Zoom, Teams, and FaceTime Really Use?

Video conferencing has become a staple of our daily lives. But just how climate-friendly are Zoom, Teams, and FaceTime? In a self-conducted experiment, all three tools were tested under identical conditions – with surprising results.

The focus wasn't only on the tools themselves, but on a central question: Can the energy consumption of digital applications be measured and compared with simple means? The answer: **Yes.** Using the built-in **powermetrics** tool available on every Mac and some scripting in **Python**, a realistic test setup was created. It shows that meaningful energy comparisons can be made without expensive hardware or specialized software. This experiment proves that solid insights into energy efficiency can be gained in an **accessible and reproducible** way – an important factor for IT professionals who take sustainability seriously.

## Setup and Objectives

The experiment was conducted in **June/July 2023** on a **MacBookPro17,1 running macOS Ventura Version 13.3**. The tools tested were the popular video conferencing apps **Zoom**, **Microsoft Teams**, and **FaceTime**. The goal was to evaluate how incoming/outgoing video and screen sharing affect energy consumption – and whether this can inform recommendations for more sustainable use.

At the same time, the experiment aimed to show that even basic tools like **powermetrics**, a **Python script**, and a well-thought-out test arrangement can be enough to draw qualitative conclusions about energy efficiency.

## Methodology

Various scenarios were tested for each tool: **incoming video on/off, outgoing video on/off, and screen sharing on/off**. The **Energy Impact** – a model value provided by powermetrics in a text file – was recorded. A **restart** was performed before each round of measurements to shut down unnecessary background processes. A **baseline** was also established by modeling the Energy Impact after a fresh restart with no programs open.

Each measurement ran in **10-minute blocks**. Every scenario was tested **three times**, and the **average Energy Impact** was calculated.

The evaluation script was written in **Python**: relevant data was extracted using **regex**, loaded into a **Pandas DataFrame**, and then **visualized**.

The test setup was intentionally kept **realistic**: video calls were made between two laptops. An external display played a standardized test video with audio, which was recorded by the MacBook's camera. This ensured that all scenarios were **consistent and reproducible**.

## Summary of Results

The following two charts show the average Energy Impact of the tested video conferencing tools in two scenario groups: with and without screen sharing. This provides a visual comparison of the applications' energy profiles.

The results show clear differences – especially with screen sharing and active video. **Microsoft Teams** performed **worse in almost every scenario** compared to Zoom and FaceTime. Only in the **minimal setup without video or screen sharing** were the values across tools relatively close.

<img class="img-fluid w-100" src="/assets/images/blog/mit-screen-sharing-en.png" alt="Energy impact with screen sharing">

These data make one thing clear: **The choice of tool and video conference configuration directly impact energy consumption.** Especially for regular meetings, it's worth being mindful of camera and screen sharing habits – particularly when using Teams.

One of the most striking comparisons was between the "everything off" and "everything on" scenarios. While FaceTime and Zoom showed nearly identical values between the basic and full-featured modes, Microsoft Teams showed a massive spike: **Energy Impact increased by a factor of 80** when all features – incoming and outgoing video plus screen sharing – were enabled. By contrast, FaceTime's consumption only increased by a factor of about **five**, and Zoom's by **three**. This not only highlights the technical efficiency of each platform, but also the huge potential for optimization through conscious usage.

<img class="img-fluid w-100" src="/assets/images/blog/ohne-screen-sharing-en.png" alt="Energy impact without screen sharing">

In the "**video in/out + screen sharing on**" scenario, **Teams’ Energy Impact was roughly three times higher** than in its minimal mode – a significant difference that adds up over time.

## Conclusion: Sustainability Starts in the Details

This experiment shows just how wide the energy consumption gap between video conferencing tools can be – and how easy it is to run your own comparisons. For IT teams, businesses, and individuals alike, this opens up exciting possibilities: **With the right tool and more conscious usage, even everyday applications can be made more sustainable.**

