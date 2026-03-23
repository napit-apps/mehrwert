---
layout: post
title: Ensuring Quality During Modernization – with Golden Master Testing  
cover: cover.jpg
type: "Artikel"
datum:  "22.03.2026"
post_image: "/assets/images/blog/2026-12-18-mehrwiki.jpg"
tags: Modernisierung, Softwareentwicklung, Ressourceneffizienz, Toolkritik, KI-gestütztes-Coding, Integration
categories: de posts
author: "Marcel"
featured: false
---

IT modernization means change.  
And every change introduces risk:  

Will the system still behave the same afterward?  

In legacy systems, this question is difficult to answer.  
Too many edge cases, too many implicit rules, and too little documentation.  

This is one of the biggest risks in any modernization effort.  

## The real problem  

In many legacy systems, business logic is not only in the code – it has evolved over years through continuous changes and adaptations.  

Often, the reality is:  
The system works – but no one fully understands why.  

A typical approach would be to write comprehensive tests.  
In practice, this is rarely feasible:  

- The full business logic is unknown  
- Requirements are incomplete or inconsistent  
- The effort for traditional test coverage is extremely high  

The result:  
Modernization becomes guesswork.  

## The idea of Golden Master Testing  

Golden Master Testing (also known as **Characterization Testing**) takes a different approach.  

Instead of defining how a system *should behave*, it captures how it *actually behaves*.  

The principle is simple:  

1. Execute existing functionality with realistic inputs  
2. Record the outputs (“Golden Master”)  
3. Compare future changes against this reference  

The goal is not perfection.  
The goal is stability.  

## Why this is valuable in modernization  

Golden Master Testing allows teams to safeguard existing behavior – without fully understanding it.  

This is especially important in early stages:  

- Refactoring existing components  
- Extracting domains  
- Building new services alongside legacy systems  

The key benefit:  

The risk of unintended changes is significantly reduced.  

## A pragmatic approach  

In practice, an iterative approach works best:  

- Select critical use cases  
- Capture inputs and outputs  
- Build automated comparison logic  
- Gradually extend test coverage  

The key principle:  

You don’t need to test everything.  
But you need to test the right things.  

## Limitations of the approach  

Golden Master Testing is not a replacement for business-driven tests.  

It shows whether behavior has changed –  
not whether it is correct.  

In legacy systems, it is often necessary to intentionally change existing behavior.  

Therefore:  

Golden Master Tests preserve the current state.  
Business improvements remain a conscious decision.  

## Combined with Domain-Driven Design  

In combination with Domain-Driven Design, a powerful approach emerges:  

- DDD provides structure and understanding  
- Golden Master Testing provides safety during change  

While domains are identified and reshaped, Golden Master Testing ensures that existing behavior remains stable.  

This makes modernization not only possible – but controllable.  

## Conclusion  

Modernization without safeguards is risky.  
Traditional testing approaches often reach their limits in complex legacy systems.  

Golden Master Testing offers a pragmatic way to preserve behavior and enable controlled change.  

Not perfect.  
But effective.  