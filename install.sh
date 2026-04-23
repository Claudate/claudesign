#!/usr/bin/env sh
set -eu

ROOT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"

list_targets() {
  find "$ROOT_DIR/adapters" -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | sort
}

usage() {
  echo "Usage: sh install.sh [target] [output_dir]" >&2
  echo "       sh install.sh --list" >&2
  echo "Example: sh install.sh generic ./dist/generic" >&2
}

if [ "${1:-}" = "--list" ]; then
  list_targets
  exit 0
fi

TARGET="${1:-generic}"
OUTPUT_DIR="${2:-$ROOT_DIR/dist/$TARGET}"
DIST_DIR="$OUTPUT_DIR"
ADAPTER_FILE="$ROOT_DIR/adapters/$TARGET/adapter.yaml"

if [ ! -f "$ADAPTER_FILE" ]; then
  echo "Unknown adapter target: $TARGET" >&2
  echo "Available targets:" >&2
  list_targets >&2
  usage
  exit 1
fi

rm -rf "$DIST_DIR"
mkdir -p "$DIST_DIR"
mkdir -p "$DIST_DIR/core" "$DIST_DIR/adapters/$TARGET" "$DIST_DIR/skills" "$DIST_DIR/agents" "$DIST_DIR/scripts" "$DIST_DIR/docs"

cp "$ROOT_DIR/core/manifest.yaml" "$DIST_DIR/core/manifest.yaml"
cp "$ADAPTER_FILE" "$DIST_DIR/adapters/$TARGET/adapter.yaml"
cp -R "$ROOT_DIR/skills/." "$DIST_DIR/skills/"
cp "$ROOT_DIR/agents/router-map.yaml" "$DIST_DIR/agents/router-map.yaml"
cp "$ROOT_DIR/agents/router-validation-cases.yaml" "$DIST_DIR/agents/router-validation-cases.yaml"
cp "$ROOT_DIR/scripts/validate_router.rb" "$DIST_DIR/scripts/validate_router.rb"
cp "$ROOT_DIR/LICENSE.md" "$DIST_DIR/LICENSE.md"
cp "$ROOT_DIR/README.md" "$DIST_DIR/README.md"
cp "$ROOT_DIR/docs/prompt-mapping-samples.md" "$DIST_DIR/docs/prompt-mapping-samples.md"
cp "$ROOT_DIR/docs/derived-integration-note.md" "$DIST_DIR/docs/derived-integration-note.md"

echo "Built claudesign bundle:"
echo "  target: $TARGET"
echo "  output: $DIST_DIR"
