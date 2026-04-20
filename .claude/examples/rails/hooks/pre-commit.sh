#!/bin/bash
set -e

echo "=== Rails Pre-commit ==="

echo "Running Rubocop..."
bundle exec rubocop --force-exclusion --parallel --format quiet
echo "✅ Rubocop passed"

echo "Running Brakeman (security scan)..."
bundle exec brakeman --quiet --no-pager --exit-on-warn
echo "✅ Brakeman passed"

echo "Running RSpec (changed files only)..."
CHANGED=$(git diff --cached --name-only --diff-filter=ACM | grep '_spec.rb$' | head -30)
if [ -n "$CHANGED" ]; then
  bundle exec rspec $CHANGED --format progress --order random
else
  bundle exec rspec --format progress --order random --only-failures 2>/dev/null \
    || bundle exec rspec spec/models spec/services --format progress --order random
fi
echo "✅ RSpec passed"

echo "=== All checks passed. Committing. ==="
