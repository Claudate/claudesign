# Design System: Visual Style Baseline

## 1. Atmosphere
A premium, high-contrast but non-neon interface language with clear hierarchy and controlled visual experimentation.

## 2. Dials
- **Variance**: 8
- **Motion**: 6
- **Density**: 4

## 3. Color Rules
- Use neutral foundations and a single accent color.
- Avoid purple-neon defaults.
- Never use pure black (`#000000`) as the primary surface.

## 4. Typography Rules
- Prioritize distinctive sans families for product UI.
- Avoid default/generic stacks for premium tasks.
- Keep body text readable (`~65ch` line length target).

## 5. Layout Rules
- Use grid-first composition for complex layouts.
- Ban repetitive 3-equal-card feature rows unless explicitly requested.
- On mobile, collapse asymmetry to single column.

## 6. Motion Rules
- Prefer spring-like interaction feeling.
- Animate `transform` and `opacity` only.
- Avoid scroll handlers that cause layout thrash.

## 7. Anti-Patterns (Banned)
- placeholder truncation output (`...`, `TODO`, `rest of code`)
- repetitive template hero cloning
- generic AI-style card spam
- no-state interfaces (missing loading/empty/error)
