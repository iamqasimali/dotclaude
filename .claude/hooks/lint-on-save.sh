#!/bin/bash
# Lint a single file on save – called with the file path as $1

FILE="$1"

if [ -z "$FILE" ]; then
  echo "Usage: lint-on-save.sh <file-path>"
  exit 1
fi

EXT="${FILE##*.}"

case "$EXT" in
  ts|tsx|js|jsx)
    npx eslint --fix "$FILE"
    ;;
  rb)
    bundle exec rubocop -a "$FILE"
    ;;
  py)
    ruff check --fix "$FILE"
    ;;
  *)
    echo "No linter configured for .$EXT files"
    ;;
esac
