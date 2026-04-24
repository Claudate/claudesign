#!/usr/bin/env node

const commands = new Set(["list", "spec-template", "web-template", "contract"]);

function printHelp() {
  console.log(`claudesign capability helper

Usage:
  npx claudesign-plugin capability <list|spec-template|web-template|contract>

Commands:
  list           Print the two public capabilities.
  spec-template  Print prompt template for generating DESIGN.md.
  web-template   Print prompt template for building website from DESIGN.md.
  contract       Print bridge contract between the two capabilities.
`);
}

function printList() {
  console.log(`Public capabilities:
1) Generate DESIGN.md
   Goal: produce high-quality design spec with dynamic roles, six-step workflow, and validation closure.

2) Build Website from DESIGN.md
   Goal: produce implementation-ready website code from the validated design spec.`);
}

function printSpecTemplate() {
  console.log(`Generate a structured DESIGN.md for the following project.

Role contract:
- You are the expert designer; I am the product manager and final decision owner.
- Switch role by task: motion tasks = motion designer, prototype tasks = UX designer, presentation tasks = deck designer, system tasks = design-system designer.

Project type:
Target users:
Brand keywords:
Reference products / visual references:
Main pages:
Core components:
Mobile support needed:
Styles to avoid:

Please include at least:
1. Basic metadata (name / description)
2. colors
3. typography
4. spacing / rounded
5. components
6. layout guidance
7. interaction states
8. do / don't

Requirements:
- Be specific rather than generic
- Use clear token names
- Do not rely on vague marketing adjectives
- Make component rules implementable
- Explicitly call out visual patterns that should be avoided
- Follow a six-step workflow: understand request -> explore references -> plan -> build structure/interactions -> validate -> minimal summary
- Prefer OKLCH when expanding palettes so hue changes keep perceptual lightness/chroma consistency
- Before final output, run a proactive error check and call out at least one risk or assumption`);
}

function printWebTemplate() {
  console.log(`Build an implementation-ready website from the DESIGN.md below.

DESIGN.md path or content:

Tech stack:
- Framework (React/Vue/Vanilla):
- Styling (CSS Modules/Tailwind/plain CSS):
- Build tool:

Scope:
- Pages to implement:
- Components to implement:
- Required interactions:
- Responsive breakpoints:

Output requirements:
- Produce complete runnable code, no placeholders and no TODO blocks
- Implement loading/empty/error/focus/active states for interactive components
- Follow DESIGN.md tokens and rules as source of truth (colors/type/spacing/radius/components/do-don't)
- Keep hierarchy and visual rhythm consistent with the spec
- Include a concise verification checklist at the end`);
}

function printContract() {
  console.log(`Bridge contract:

Capability A: Generate DESIGN.md
- Output must include implementable tokens, component rules, layout guidance, interaction states, and do/don't constraints.
- Output must include assumptions and at least one explicit risk note from validation.

Capability B: Build Website from DESIGN.md
- Must implement from DESIGN.md as source of truth.
- Must not silently override design tokens or forbidden patterns.
- Must return complete code with responsive behavior and state coverage.

Hand-off checklist:
1) DESIGN.md passes lint.
2) Required pages/components are present in the spec.
3) Website output maps every implemented component back to DESIGN.md rules.`);
}

function main() {
  const [command, ...rest] = process.argv.slice(2);

  if (!command || command === "-h" || command === "--help" || command === "help") {
    printHelp();
    return;
  }

  if (!commands.has(command)) {
    console.error(`Unknown capability command: ${command}`);
    console.error("");
    printHelp();
    process.exit(1);
  }

  if (rest.length > 0) {
    console.error(`Unexpected arguments: ${rest.join(" ")}`);
    process.exit(1);
  }

  if (command === "list") {
    printList();
    return;
  }

  if (command === "spec-template") {
    printSpecTemplate();
    return;
  }

  if (command === "web-template") {
    printWebTemplate();
    return;
  }

  printContract();
}

main();
