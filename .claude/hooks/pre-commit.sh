#!/bin/bash
# Generic pre-commit hook – uncomment the checks for your stack before using.

set -e

echo "=== Pre-commit checks ==="

CONFIGURED=false

# --- Type checking (TypeScript) ---
# CONFIGURED=true
# echo "Type checking..."
# npx tsc --noEmit || { echo "❌ Type errors found."; exit 1; }

# --- Linting ---
# CONFIGURED=true
# echo "Linting..."
# npm run lint || { echo "❌ Lint failed. Run 'npm run lint:fix' to auto-fix."; exit 1; }
# bundle exec rubocop --force-exclusion --parallel || { echo "❌ Rubocop failed."; exit 1; }

# --- Tests ---
# CONFIGURED=true
# echo "Running tests..."
# npm test || { echo "❌ Tests failed."; exit 1; }
# bundle exec rspec --format progress || { echo "❌ RSpec failed."; exit 1; }

# --- Secret scanning (requires git-secrets or trufflehog) ---
# CONFIGURED=true
# git secrets --scan || { echo "❌ Secrets detected in commit."; exit 1; }

if [ "$CONFIGURED" = false ]; then
  echo "⚠️  No checks are active. Edit .claude/hooks/pre-commit.sh and set CONFIGURED=true."
  exit 1
fi

echo "✅ All pre-commit checks passed."
