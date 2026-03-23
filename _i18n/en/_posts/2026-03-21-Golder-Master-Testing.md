---
layout: post
title: Ensuring Quality During Modernization – with Golden Master Testing  
cover: cover.jpg
type: "Artikel"
datum:  "27.03.2026"
post_image: "/assets/images/blog/2026-12-18-mehrwiki.jpg"
tags: Modernisierung, Softwareentwicklung, Ressourceneffizienz, Toolkritik, KI-gestütztes-Coding, Integration
categories: de posts
author: "Marcel"
featured: false
---

One of the central challenges in IT modernization is not the target architecture, but the path toward it. Existing systems need to be changed, extended, or gradually replaced—while ensuring that their current behavior remains stable.  

This creates a fundamental tension.  

On the one hand, there is pressure to evolve and improve systems.  
On the other, there is the risk of unintentionally breaking or altering existing functionality.  

In long-lived systems, this risk is particularly high.  

## When behavior matters more than understanding  

In many legacy systems, business logic has evolved over years. Requirements have been added, edge cases implemented, and adjustments made—often without comprehensive documentation.  

The result is a system that works reliably, but whose behavior is only partially understood.  

In such situations, traditional testing approaches quickly reach their limits. Writing meaningful tests requires a clear understanding of expected behavior. In practice, this understanding is often incomplete.  

The alternative is not to abandon testing.  
The alternative is to change the approach.  

## Golden Master Testing as a pragmatic starting point  

Golden Master Testing, often referred to as characterization testing, follows a deliberately pragmatic approach.  

Instead of defining how a system should behave, it captures how the system actually behaves. This observed behavior is then used as a reference for future changes.  

The principle is straightforward: existing functionality is executed with realistic inputs, the outputs are recorded, and future executions are compared against this reference.  

The goal is not to validate correctness, but to detect unintended changes.  

## A concrete example from practice  

In the project, this challenge became particularly visible in a component responsible for handling customer-specific configurations.  

New requirements needed to be implemented regularly, while existing functionality had to remain stable. In practice, however, even small changes often led to unexpected side effects in other parts of the system.  

A traditional testing approach was not feasible, as the full business logic was not documented and many edge cases were only implicitly reflected in the system’s behavior.  

The chosen approach was to capture real inputs from existing installations and systematically record the system’s outputs. These outputs formed the “Golden Master.”  

For each change, the system was executed again with the same inputs, and the results were compared automatically. Any deviation became immediately visible and could be analyzed in detail.  

This approach did not create full understanding of the system.  
But it ensured that existing behavior was not changed unintentionally.  

## Where the approach is most effective  

Golden Master Testing is particularly useful in scenarios where systems are changed incrementally.  

Typical use cases include:  

* Refactoring existing components  
* Extracting domains as part of modernization  
* Building new services alongside legacy systems  
* Stabilizing critical areas with frequent changes  

Especially in early transformation phases, this approach provides a crucial foundation: it enables change without compromising system stability.  

## Limitations and conscious trade-offs  

Despite its strengths, Golden Master Testing is not a silver bullet.  

It preserves existing behavior—regardless of whether that behavior is correct or desirable. In legacy systems, this often means that suboptimal behavior is maintained, at least temporarily.  

This limitation is a deliberate trade-off.  

Golden Master Tests answer the question of whether behavior has changed. They do not answer whether the change is correct or necessary. That decision remains a business responsibility.  

Another important aspect is handling deviations. Not every difference indicates an error. In many cases, changes are intentional and part of system evolution. What matters is that these changes are visible and consciously made.  

## Combined with Domain-Driven Design  

In the context of IT modernization, Golden Master Testing is most effective when combined with Domain-Driven Design.  

While DDD helps to identify and structure business domains, Golden Master Testing ensures that changes within these domains can be implemented safely.  

The domain model provides direction.  
Golden Master Testing reduces risk along the way.  

## Conclusion  

In complex legacy systems, full understanding is often unrealistic. At the same time, stability is a prerequisite for any meaningful change.  

Golden Master Testing offers a pragmatic way to navigate this challenge. It enables change without requiring complete knowledge of every detail.  

Not as a replacement for proper business-driven testing.  
But as a foundation for making modernization controllable.  