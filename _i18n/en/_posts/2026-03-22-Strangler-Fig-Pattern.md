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

One of the most challenging aspects of IT modernization is not defining the target architecture, but managing the transition toward it. Existing systems cannot simply be replaced in isolation. They are deeply embedded in business processes, support ongoing operations, and cannot be switched off without significant risk.  

This creates a fundamental tension: change is necessary, but stability must be preserved.  

## Why the “big bang” approach rarely works  

A common approach to modernization is to rebuild the system entirely and replace it at a specific point in time. On the surface, this seems logical. It promises a clean cut, a well-defined target state, and a clear separation between old and new.  

In practice, however, this approach introduces significant risks.  

During the development phase, both existing and new requirements must be handled in parallel. The legacy system continues to evolve, while the new system is being built. By the time the new system is ready, the two have often diverged to a point where synchronization becomes difficult or even impossible.  

In addition, the final switch-over becomes a critical moment. Any missing functionality or unforeseen issues must be resolved under time pressure, often without the possibility of controlled rollback.  

The attempt to eliminate complexity in a single step often results in that complexity reappearing elsewhere.  

## The core idea of the Strangler Fig Pattern  

The Strangler Fig Pattern follows a fundamentally different approach. Instead of replacing the system in one step, it transforms it incrementally. New functionality is developed outside of the existing system and gradually takes over specific responsibilities.  

Over time, the legacy system is reduced piece by piece until it can be retired entirely.  

The key idea is not a specific technical solution, but a different way of thinking about change:  

Transformation is incremental, controlled, and aligned with business boundaries.  

## How the approach works in practice  

In practice, the Strangler Fig Pattern is often implemented by introducing a routing or integration layer that controls how requests are handled. This layer determines whether a request is processed by the legacy system or by a newly implemented component.  

At the beginning, most functionality still resides in the legacy system. As new components are introduced, specific parts of the functionality are redirected to the new system. Over time, the balance shifts until the legacy system becomes obsolete.  

This approach allows changes to be introduced gradually, without requiring a disruptive system-wide replacement. It also makes it possible to adjust or even revert decisions if unexpected issues arise.  

## A concrete example from practice  

In the project, this approach became particularly relevant in areas with frequent customer-specific adaptations. New requirements had to be implemented regularly, while existing functionality needed to remain stable.  

A full replacement of these areas would have been highly risky, as many dependencies were not fully visible.  

Instead, a clearly defined functional area was identified and implemented as a separate component. Access to this functionality was controlled through a routing layer, allowing requests to be directed either to the legacy system or to the new implementation.  

New features were developed exclusively in the new component, while existing functionality remained in the legacy system for the time being. Over time, more and more functionality was migrated until the entire domain was handled by the new system.  

This approach made it possible to evolve the system without disrupting ongoing operations.  

## The connection to Domain-Driven Design  

The effectiveness of the Strangler Fig Pattern depends heavily on how system boundaries are defined. This is where Domain-Driven Design plays a critical role.  

The question is not which technical components should be replaced, but which business domains can be meaningfully separated.  

Domain-Driven Design provides the necessary structure by defining clear boundaries, responsibilities, and relationships between different parts of the system.  

Without this foundation, there is a risk of simply moving technical components around, while the underlying complexity remains unchanged.  

With a clear domain model, transformation becomes focused and aligned with business needs.  

## Managing quality and risk during the transition  

A key aspect of the Strangler Fig Pattern is the parallel operation of legacy and new systems. During this transition phase, both systems are active, which introduces additional complexity.  

Ensuring consistent behavior across both systems becomes critical.  

Approaches such as Golden Master Testing can play an important role here. By capturing and comparing system behavior, it becomes possible to detect unintended changes and maintain stability while introducing new components.  

At the same time, challenges such as data consistency, synchronization, and monitoring must be addressed explicitly. The advantage of the incremental approach is that these challenges can be tackled step by step, rather than all at once.  

## Typical challenges and trade-offs  

The Strangler Fig Pattern reduces risk, but it does not eliminate it.  

Common challenges include:  

* Unclear or missing interfaces in the legacy system  
* Hidden dependencies between system components  
* Data synchronization between legacy and new systems  
* Increased operational complexity due to running systems in parallel  

These are not side effects, but inherent aspects of the approach.  

The central trade-off is accepting short-term operational complexity in order to reduce long-term system complexity.  

## Conclusion  

The Strangler Fig Pattern is not a technical trick, but a strategic approach to dealing with complex, long-lived systems.  

It shifts the focus from large, high-risk transformation projects to controlled, incremental change.  

Combined with Domain-Driven Design and appropriate quality assurance practices, it provides a structured path for evolving systems without compromising stability.  

Not through radical disruption.  
But through continuous, deliberate transformation.  