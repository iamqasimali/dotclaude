# Project Brain

## Overview

> Replace this section with your project name, purpose, and a one-line description.

## Tech Stack

- **Language:** [e.g., Ruby 3.2 / TypeScript 5 / Python 3.12]
- **Framework:** [e.g., Rails 7 / React 18 + Vite / FastAPI]
- **Database:** [e.g., PostgreSQL / MongoDB / SQLite]
- **Auth:** [e.g., JWT / Devise / NextAuth / Supabase]
- **Testing:** [e.g., RSpec / Vitest / Jest / Pytest]
- **Linting:** [e.g., Rubocop / ESLint / Ruff]
- **Package manager:** [e.g., bundler / npm / pnpm / uv]

## Folder Structure

```text
project-root/
├── src/          # Main source code
├── tests/        # Test files
├── docs/         # Documentation
└── .claude/      # AI configuration (this folder)
```

> Update with your actual structure.

## Common Commands

```bash
# Development
[start-dev-server-command]

# Testing
[run-tests-command]

# Linting
[run-linter-command]

# Build
[build-command]

# Database
[db-migrate-command]
```

## Coding Conventions

- [Naming conventions]
- [File organization rules]
- [Import ordering]
- [Max file/function length]

## Security Rules

- Never commit secrets – use `.env` files
- Validate all user input at system boundaries
- Sanitize output to prevent XSS
- Use parameterized queries – never string-concatenate SQL

## Testing Policy

- Unit tests for all business logic
- Integration tests for API endpoints
- E2E tests for critical user journeys

## Git Workflow

- Branch naming: `feat/`, `fix/`, `chore/`
- PR must pass CI before merge
- Squash commits on merge to main

## Secrets & Environment

- `.env`, `.env.local`, `.env.*.local` must be in `.gitignore` – never commit
- Commit `.env.example` with placeholder values only
- Never log tokens, passwords, or PII – not even at debug level
