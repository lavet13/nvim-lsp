#!/usr/bin/env bash

set -euo pipefail

OUTPUT_FILE="nvim-full.md"
HEADER="Repository: lavet13/nvim-lsp - ($(date '+%Y-%m-%d'))"

echo "📦 Running Repomix..."

repomix \
  --style markdown \
  --ignore "*.md" \
  --output "$OUTPUT_FILE" \
  --parsable-style \
  --header-text "$HEADER" \
  "$@"

echo "✅ Successfully created $OUTPUT_FILE ($(du -h "$OUTPUT_FILE" | cut -f1))"
echo "💡 You can now feed this file to any AI (Claude, Grok, etc.)"
