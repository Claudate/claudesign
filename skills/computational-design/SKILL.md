---
name: computational-design
description: Support concept-stage design decisions with calculation-oriented climate, solar, load, and sustainability analysis workflows.
---

# Computational Design Skill

## Purpose
Support design decisions with calculation-oriented methods and architecture-performance reasoning.

## Skill Pack

### 1) `workflow-calculator`
#### Inputs
- Design stage and deliverable type
- Team size and role assumptions
- Timeline constraints

#### Workflow
1. Define workload assumptions.
2. Estimate effort by phase.
3. Compare timeline options and constraints.
4. Return planning-ready effort guidance.

#### Output Contract
- Input assumptions
- Estimated effort and timeline ranges
- Risk flags and adjustment suggestions

### 2) `climate-analysis`
#### Inputs
- Climate zone or location proxy
- Seasonal design priorities
- Envelope assumptions

#### Workflow
1. Select relevant climate indicators.
2. Map seasonal constraints to design decisions.
3. Evaluate high-level performance implications.
4. Return climate-driven design guidance.

#### Output Contract
- Climate indicators used
- Design implications by season
- Suggested envelope and orientation adjustments

### 3) `site-solar-analysis`
#### Inputs
- Site orientation and context
- Massing assumptions
- Target daylight or solar control goals

#### Workflow
1. Declare site and massing assumptions.
2. Evaluate solar exposure windows.
3. Identify shading and daylight tradeoffs.
4. Return siting and facade adjustment options.

#### Output Contract
- Solar exposure findings
- Shading/daylight tradeoff notes
- Recommended siting or facade moves

### 4) `building-load-calculations`
#### Inputs
- Program and occupancy assumptions
- Geometry and envelope assumptions
- Equipment and schedule assumptions

#### Workflow
1. Define simplified load model boundaries.
2. Run early-stage load estimates.
3. Compare options with major load drivers.
4. Return decision support for concept stage.

#### Output Contract
- Load estimate summary
- Key drivers and sensitivities
- Caveats for non-stamped use

### 5) `lifecycle-sustainability`
#### Inputs
- Material/system options
- Lifecycle boundary assumptions
- Sustainability targets

#### Workflow
1. Define lifecycle boundary and baseline case.
2. Compare options on impact indicators.
3. Highlight tradeoffs and uncertainty.
4. Return recommendation with assumptions.

#### Output Contract
- Lifecycle comparison table
- Tradeoff summary
- Next-step validation checklist

### 6) `accessibility-code-compliance`
#### Inputs
- Plan/layout assumptions
- Accessibility and code targets
- Jurisdiction context (if known)

#### Workflow
1. Run rule-aware design checks at concept level.
2. Flag potential accessibility and code risks.
3. Prioritize issues by severity and rework cost.
4. Return mitigation-first recommendations.

#### Output Contract
- Risk findings list
- Mitigation suggestions
- Explicit caveat: not formal approval

## Shared In Scope
- Design calculators and performance-oriented design checks
- Early-stage quantitative decision support

## Shared Out of Scope
- Structural certification or compliance sign-off
- Non-design business analytics

## Source Mapping
- Source repo: https://github.com/Amanbh997/Claude-skills-for-Computational-Designers
- Retention mode: keep-exception-full
- Last reviewed: 2026-04-21
