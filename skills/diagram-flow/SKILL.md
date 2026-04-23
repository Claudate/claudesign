---
name: diagram-flow
description: Create and refine process diagrams, user flows, and decision trees with clear structure and readable presentation.
---

# Diagram and Flow Skill

## Purpose
Create clear diagrams and flow structures for communicating systems, decisions, and user journeys.

## Skill Pack

### 1) `flow-skeleton`
#### Inputs
- Problem statement or process description
- Audience and output format
- Required level of detail

#### Workflow
1. Extract entities, decisions, and transitions.
2. Define start and end conditions.
3. Draft baseline node and connector skeleton.
4. Return a minimal valid flow structure.

#### Output Contract
- Diagram nodes and connectors
- Core sequence and entry/exit points
- Initial scope boundary notes

### 2) `branch-logic-normalize`
#### Inputs
- Existing flow skeleton
- Decision rules and business constraints
- Exception paths

#### Workflow
1. Validate each branch against explicit decision criteria.
2. Remove ambiguous or duplicate branch logic.
3. Normalize branching labels and direction conventions.
4. Return a cleaned decision-flow structure.

#### Output Contract
- Branching rules and decision labels
- Normalized path structure
- Conflict notes for unresolved logic

### 3) `diagram-clarity-check`
#### Inputs
- Diagram draft
- Target audience context
- Display medium constraints

#### Workflow
1. Check reading order, grouping, and hierarchy consistency.
2. Reduce visual noise and label ambiguity.
3. Flag readability risks by severity.
4. Return final clarity improvements before handoff.

#### Output Contract
- Labeling and readability guidance
- Clarity issues by severity
- Final polish checklist

## Shared In Scope
- Flowcharts, process diagrams, architecture communication
- Diagram simplification and clarity improvements

## Shared Out of Scope
- Runtime system implementation
- Non-diagram product development tasks

## Source Mapping
- Source repo: https://github.com/cathrynlavery/diagram-design
- Retention mode: keep
- Last reviewed: 2026-04-21
