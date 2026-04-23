#!/usr/bin/env node

import { spawnSync } from "node:child_process";
import { existsSync } from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const repoRoot = path.resolve(__dirname, "..");
const supportedCommands = new Set(["lint", "diff", "export", "spec"]);

function printHelp() {
  console.log(`claudesign DESIGN.md helper

Usage:
  node ./scripts/designmd.mjs <lint|diff|export|spec> [args...]

Options:
  --no-install   Do not fall back to npx when no local/global designmd binary exists.
  -h, --help     Show this help text.

Examples:
  node ./scripts/designmd.mjs lint skills/visual-style/DESIGN.md
  node ./scripts/designmd.mjs diff before.md after.md
  node ./scripts/designmd.mjs export --format tailwind skills/visual-style/DESIGN.md
  node ./scripts/designmd.mjs spec --rules
`);
}

function run(command, args) {
  const result = spawnSync(command, args, {
    cwd: repoRoot,
    stdio: "inherit"
  });

  if (result.error) {
    return { ok: false, error: result.error };
  }

  return { ok: true, status: result.status ?? 0 };
}

function probe(command, args) {
  const result = spawnSync(command, args, {
    cwd: repoRoot,
    stdio: "ignore"
  });

  return !result.error && (result.status ?? 0) === 0;
}

function localBinaryPath() {
  const extension = process.platform === "win32" ? ".cmd" : "";
  return path.join(repoRoot, "node_modules", ".bin", `designmd${extension}`);
}

function resolveInvocation(noInstall) {
  const localBinary = localBinaryPath();
  if (existsSync(localBinary)) {
    return { command: localBinary, prefixArgs: [] };
  }

  if (probe("designmd", ["--help"])) {
    return { command: "designmd", prefixArgs: [] };
  }

  if (noInstall) {
    console.error("No local or global `designmd` binary was found.");
    console.error("Install `@google/design.md` locally/globally, or rerun without `--no-install`.");
    process.exit(1);
  }

  return { command: "npx", prefixArgs: ["--yes", "@google/design.md"] };
}

function main() {
  const rawArgs = process.argv.slice(2);
  if (rawArgs.length === 0 || rawArgs.includes("-h") || rawArgs.includes("--help")) {
    printHelp();
    return;
  }

  const noInstall = rawArgs.includes("--no-install");
  const args = rawArgs.filter((arg) => arg !== "--no-install");
  const [subcommand, ...subcommandArgs] = args;

  if (!supportedCommands.has(subcommand)) {
    console.error(`Unsupported DESIGN.md command: ${subcommand ?? "(missing)"}`);
    console.error("");
    printHelp();
    process.exit(1);
  }

  const invocation = resolveInvocation(noInstall);
  const result = run(invocation.command, [...invocation.prefixArgs, subcommand, ...subcommandArgs]);

  if (!result.ok) {
    console.error(`Failed to execute DESIGN.md command via \`${invocation.command}\`.`);
    console.error(result.error.message);
    process.exit(1);
  }

  process.exit(result.status);
}

main();
