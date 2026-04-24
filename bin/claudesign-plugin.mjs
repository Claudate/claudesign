#!/usr/bin/env node

import { execFileSync } from "node:child_process";
import { existsSync } from "node:fs";
import os from "node:os";
import path from "node:path";
import { fileURLToPath } from "node:url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const repoRoot = path.resolve(__dirname, "..");
const installScript = path.join(repoRoot, "install.sh");
const designmdScript = path.join(repoRoot, "scripts", "designmd.mjs");
const capabilityScript = path.join(repoRoot, "scripts", "capability.mjs");
const supportedAdapters = ["generic", "claude", "openai"];

function printHelp() {
  console.log(`claudesign-plugin

Usage:
  npx claudesign-plugin list
  npx claudesign-plugin install [--adapter <generic|claude|openai>] [--platform <generic|claude|openai>] [--target <dir>]
  npx claudesign-plugin designmd <lint|diff|export|spec> [args...]
  npx claudesign-plugin capability <list|spec-template|web-template|contract>
  npx claudesign-plugin help

Examples:
  npx claudesign-plugin list
  npx claudesign-plugin install
  npx claudesign-plugin install --adapter claude
  npx claudesign-plugin install --adapter openai --target ~/.claudesign/plugins/openai
  npx claudesign-plugin install --platform claude
  npx claudesign-plugin designmd lint ./skills/visual-style/DESIGN.md
  npx claudesign-plugin capability list
`);
}

function expandHome(inputPath) {
  if (!inputPath) return inputPath;
  if (inputPath === "~") return os.homedir();
  if (inputPath.startsWith("~/")) return path.join(os.homedir(), inputPath.slice(2));
  return inputPath;
}

function parseArgs(argv) {
  const [first = "help", ...rest] = argv;
  const command = first === "--help" || first === "-h" ? "help" : first;
  if (command === "designmd" || command === "capability") {
    return { command, options: {}, passthrough: rest };
  }

  const options = {};

  for (let index = 0; index < rest.length; index += 1) {
    const token = rest[index];

    if (token === "--adapter") {
      options.adapter = rest[index + 1];
      index += 1;
      continue;
    }

    if (token === "--target") {
      options.target = rest[index + 1];
      index += 1;
      continue;
    }

    if (token === "--platform") {
      options.adapter = rest[index + 1];
      index += 1;
      continue;
    }

    if (token === "--help" || token === "-h") {
      options.help = true;
      continue;
    }

    throw new Error(`Unknown argument: ${token}`);
  }

  return { command, options, passthrough: [] };
}

function runInstall(adapter, target) {
  if (!supportedAdapters.includes(adapter)) {
    throw new Error(`Unsupported adapter: ${adapter}`);
  }

  if (!existsSync(installScript)) {
    throw new Error("install.sh is missing from the package.");
  }

  const resolvedTarget =
    expandHome(target) || path.join(os.homedir(), ".claudesign", "plugins", adapter);

  execFileSync("sh", [installScript, adapter, resolvedTarget], {
    cwd: repoRoot,
    stdio: "inherit"
  });

  console.log(`\nInstalled '${adapter}' bundle to: ${resolvedTarget}`);
}

function runDesignmd(args) {
  if (!existsSync(designmdScript)) {
    throw new Error("scripts/designmd.mjs is missing from the package.");
  }

  try {
    execFileSync("node", [designmdScript, ...args], {
      cwd: repoRoot,
      stdio: "inherit"
    });
  } catch (error) {
    process.exit(error.status ?? 1);
  }
}

function runCapability(args) {
  if (!existsSync(capabilityScript)) {
    throw new Error("scripts/capability.mjs is missing from the package.");
  }

  try {
    execFileSync("node", [capabilityScript, ...args], {
      cwd: repoRoot,
      stdio: "inherit"
    });
  } catch (error) {
    process.exit(error.status ?? 1);
  }
}

function main() {
  let parsed;

  try {
    parsed = parseArgs(process.argv.slice(2));
  } catch (error) {
    console.error(error.message);
    console.error("");
    printHelp();
    process.exit(1);
  }

  const { command, options, passthrough } = parsed;

  if (options.help || command === "help") {
    printHelp();
    return;
  }

  if (command === "list") {
    console.log(supportedAdapters.join("\n"));
    return;
  }

  if (command === "install") {
    runInstall(options.adapter || "generic", options.target);
    return;
  }

  if (command === "designmd") {
    runDesignmd(passthrough);
    return;
  }

  if (command === "capability") {
    runCapability(passthrough);
    return;
  }

  console.error(`Unknown command: ${command}`);
  console.error("");
  printHelp();
  process.exit(1);
}

main();
