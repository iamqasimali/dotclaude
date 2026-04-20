#!/bin/bash
set -e

echo "=== React/Vite Pre-commit ==="

echo "Type checking..."
npx tsc --noEmit
echo "✅ No type errors"

echo "Linting..."
npm run lint
echo "✅ ESLint passed"

echo "Running unit tests..."
npm run test:run
echo "✅ Tests passed"

echo "=== All checks passed. Committing. ==="
