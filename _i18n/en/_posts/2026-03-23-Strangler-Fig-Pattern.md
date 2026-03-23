---
layout: post
title: Ensuring Quality During Modernization – with Golden Master Testing  
cover: cover.jpg
type: "Artikel"
datum:  "23.03.2026"
post_image: "/assets/images/blog/2026-12-18-mehrwiki.jpg"
tags: Modernisierung, Softwareentwicklung, Ressourceneffizienz, Toolkritik, KI-gestütztes-Coding, Integration
categories: de posts
author: "Marcel"
featured: false
---

# Modernizing Systems Step by Step – The Strangler Fig Pattern  

One of the most difficult questions in IT modernization is:  

How do you replace an existing system without putting ongoing operations at risk?  

The classic approach is well known:  
a complete rebuild, often executed as a “big bang.”  

In reality, these projects are risky, expensive, and rarely successful.  

## A different approach  

The **Strangler Fig Pattern** follows a fundamentally different strategy.  

Instead of replacing the system all at once, it transforms it incrementally.  

New functionality is built outside the existing system and gradually integrated.  
The old system is replaced step by step – similar to how a strangler fig grows around a tree.  

## The principle  

The approach can be summarized in a few core ideas:  

- The existing system remains in place initially  
- New functionality is developed separately  
- Requests are gradually redirected  
- Old components are removed step by step  

The key advantage:  

Risk is distributed – not concentrated.  

## Getting started  

A typical starting point is defining clear interfaces.  

These act as the boundary between legacy and new systems.  

From there, individual parts can be extracted step by step:  

- Identify a clearly bounded domain  
- Build a new implementation  
- Redirect traffic to the new system  
- Decommission the old functionality  

This process is repeated iteratively.  

## Connection to Domain-Driven Design  

The Strangler Fig Pattern becomes most effective when combined with Domain-Driven Design.  

DDD helps to:  
- Identify meaningful domain boundaries  
- Define clear responsibilities  
- Understand dependencies  

Without this foundation, there is a risk of merely moving technical pieces –  
instead of actually reducing complexity.  

## Ensuring quality during transformation  

During incremental migration, a key question arises:  

How do we ensure that behavior does not change unintentionally?  

This is where **Golden Master Testing** can be applied.  

Existing behavior is preserved while new components are introduced.  
This allows changes to be implemented in a controlled and transparent way.  

## Typical challenges  

This approach is not without its challenges.  

Common issues include:  

- Unclear interfaces in the legacy system  
- Hidden dependencies  
- Data migration and synchronization  
- Running legacy and new systems in parallel  

These aspects must be actively managed.  

## Why it is worth it  

Despite these challenges, the Strangler Fig Pattern offers significant advantages:  

- Reduced risk through incremental change  
- Early visible results  
- Better control of the transformation  
- Ability to adapt continuously  

Modernization becomes not a one-time project, but a manageable process.  

## Conclusion  

The Strangler Fig Pattern is not a technical trick.  
It is a strategic approach to handling complexity.  

Combined with Domain-Driven Design and proper quality assurance, it provides a solid foundation for sustainable IT modernization.  

Not through radical disruption.  
But through controlled, continuous change.  