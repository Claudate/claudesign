# Space Exploration Museum Homepage Implementation Plan

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a React-based immersive homepage for a fictional Space Exploration Museum online exhibition.

**Architecture:** Use a lightweight React SPA with section-based composition in a single `App` component and data-driven arrays for exhibition cards and timeline events. Use a dedicated CSS file with layered backgrounds, gradients, glow effects, and responsive layout rules to create a deep-space atmosphere while preserving readability.

**Tech Stack:** React (ESM in browser), HTML5, CSS3

---

### Task 1: Scaffold Page Entrypoint

**Files:**
- Create: `docs/space-museum-react/index.html`

- [ ] **Step 1: Create HTML shell with root node and module entry**

```html
<div id="root"></div>
<script type="module" src="./main.jsx"></script>
```

- [ ] **Step 2: Verify structure**

Run: `ls docs/space-museum-react`
Expected: `index.html` exists.

### Task 2: Implement React Homepage Content

**Files:**
- Create: `docs/space-museum-react/main.jsx`

- [ ] **Step 1: Build sectioned React layout**

```jsx
function App() {
  return (
    <>
      <header>Hero</header>
      <section>Exhibitions</section>
      <section>Timeline</section>
      <section>CTA</section>
      <footer>Footer</footer>
    </>
  );
}
```

- [ ] **Step 2: Add data-driven content**

```jsx
const exhibitions = [/* 4 items */];
const timeline = [/* >= 6 items */];
```

- [ ] **Step 3: Render lists with semantic elements**

```jsx
{exhibitions.map(...) }
{timeline.map(...) }
```

### Task 3: Build Immersive Visual Style

**Files:**
- Create: `docs/space-museum-react/styles.css`

- [ ] **Step 1: Add cosmic background and visual layers**

```css
body { background: radial-gradient(...), ...; }
```

- [ ] **Step 2: Style hero, cards, timeline, CTA, footer**

```css
.hero { min-height: 100vh; }
.exhibit-card { ... }
.timeline-item { ... }
```

- [ ] **Step 3: Add responsive rules for mobile and desktop**

```css
@media (max-width: 900px) { ... }
```

### Task 4: Smoke Validation

**Files:**
- Modify: `docs/space-museum-react/main.jsx`
- Modify: `docs/space-museum-react/styles.css`

- [ ] **Step 1: Validate required sections are present**

Run: `rg "登月时代|空间站生活|火星计划|深空探索" docs/space-museum-react/main.jsx`
Expected: all four exhibition names found.

- [ ] **Step 2: Validate timeline count**

Run: `rg "year:" docs/space-museum-react/main.jsx | wc -l`
Expected: 6 or more.

- [ ] **Step 3: Final pass for tone and anti-template feel**

Run: manual review of typography, spacing, accents, and composition diversity.
Expected: less generic, stronger visual hierarchy and immersive direction.
