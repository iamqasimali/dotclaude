# dotclaude

A portable `.claude` folder template that turns Claude Code into a **domain-aware AI teammate** — one that knows your stack, enforces your conventions, and catches security issues before they reach production.

Drop this folder into any project and Claude will read your conventions, follow your rules, and behave like a senior engineer who already knows the codebase.

---

## What's Inside

```text
.claude/
├── CLAUDE.md                        # Project brain – loaded at every conversation start
├── settings.json                    # Permissions, model, and hook configuration
├── agents/                          # Role-specific AI sub-agents
│   ├── code-reviewer.md
│   ├── debugger.md
│   ├── doc-writer.md
│   ├── refactorer.md
│   ├── security-auditor.md
│   └── test-writer.md
├── commands/                        # Slash commands (/deploy, /fix-issue, /pr-review)
│   ├── deploy.md
│   ├── fix-issue.md
│   └── pr-review.md
├── hooks/                           # Shell scripts triggered before/after Claude actions
│   ├── pre-commit.sh
│   └── lint-on-save.sh
├── rules/                           # Guardrails scoped to file path patterns
│   ├── api.md
│   ├── database.md
│   └── frontend.md
├── skills/
│   └── frontend-design/
│       └── SKILL.md                 # Design tokens + component conventions
└── examples/
    ├── rails/                       # Complete Rails 7 configuration
    │   ├── CLAUDE.md
    │   ├── agents/code-reviewer.md
    │   ├── commands/deploy.md
    │   ├── hooks/pre-commit.sh
    │   └── rules/{api,database}.md
    └── react-vite/                  # Complete React 18 + Vite + TypeScript configuration
        ├── CLAUDE.md
        ├── agents/code-reviewer.md
        ├── commands/deploy.md
        ├── hooks/pre-commit.sh
        └── rules/{api,frontend}.md
```

---

## Quick Start

### 1. Copy into your project

```bash
cp -r .claude /path/to/your-project/.claude
```

### 2. Fill in CLAUDE.md

Open `.claude/CLAUDE.md` and replace the bracketed placeholders with your actual stack, folder structure, commands, and conventions. This file is loaded at the start of every Claude conversation.

### 3. Pick a stack example (optional)

If you're on Rails or React/Vite, copy the stack-specific files over the generic ones:

```bash
# Rails
cp .claude/examples/rails/CLAUDE.md           .claude/CLAUDE.md
cp .claude/examples/rails/rules/*.md          .claude/rules/
cp .claude/examples/rails/hooks/pre-commit.sh .claude/hooks/pre-commit.sh
cp .claude/examples/rails/commands/deploy.md  .claude/commands/deploy.md

# React / Vite
cp .claude/examples/react-vite/CLAUDE.md           .claude/CLAUDE.md
cp .claude/examples/react-vite/rules/*.md          .claude/rules/
cp .claude/examples/react-vite/hooks/pre-commit.sh .claude/hooks/pre-commit.sh
cp .claude/examples/react-vite/commands/deploy.md  .claude/commands/deploy.md
```

### 4. Activate the pre-commit hook

Open `.claude/hooks/pre-commit.sh`, uncomment the checks for your stack, and set `CONFIGURED=true`. Then wire it up to git:

```bash
cp .claude/hooks/pre-commit.sh .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
```

### 5. Commit the folder

```bash
git add .claude
git commit -m "chore: add Claude AI configuration"
```

Every developer on the team now gets the same Claude behavior.

---

## File Reference

### `CLAUDE.md` — Project Brain

The most important file. Claude reads it at the start of every conversation. It should contain:

| Section | What to put there |
| --- | --- |
| Tech Stack | Languages, frameworks, database, auth, test runner, linter |
| Folder Structure | Annotated directory tree |
| Common Commands | Dev server, build, test, lint, migrate |
| Coding Conventions | Naming, file length limits, import ordering |
| Security Rules | Input validation, secrets policy, auth patterns |
| Git Workflow | Branch naming, PR policy, merge strategy |
| Secrets & Environment | `.env` policy, logging rules |

---

### `settings.json` — Permissions & Model

Controls which tools Claude can use without prompting, and which are always blocked.

```json
{
  "model": "claude-sonnet-4-6",
  "permissions": {
    "allow": ["Bash(git:*)", "Bash(npm:*)", "..."],
    "deny":  ["Bash(rm -rf:*)", "Bash(sudo:*)", "Bash(curl:*)", "Bash(wget:*)"]
  }
}
```

**Key rules:**

- `deny` entries always win over `allow`
- Use `Bash(command:*)` syntax — not shell glob patterns
- `curl` and `wget` are denied by default to prevent pipe-to-bash attacks
- Change `model` to `claude-opus-4-7` for more complex tasks

---

### `agents/` — Role-Specific Sub-Agents

Each file defines a focused AI persona Claude can adopt:

| Agent | Purpose |
| --- | --- |
| `code-reviewer.md` | Reviews PRs for correctness, security, and conventions |
| `debugger.md` | Diagnoses root causes — never silences errors |
| `test-writer.md` | Writes behaviour-focused tests with edge cases |
| `refactorer.md` | Improves structure without changing behaviour |
| `doc-writer.md` | Writes the WHY, not the WHAT |
| `security-auditor.md` | Audits against OWASP Top 10 (2021) |

Invoke them by telling Claude: *"Act as the security auditor and review this file."*

---

### `commands/` — Slash Commands

| Command | What it does |
| --- | --- |
| `/deploy` | Pre-flight checks → build → deploy → smoke test → rollback on failure |
| `/fix-issue #N` | Reproduce → root cause → failing test → fix → verify no regressions |
| `/pr-review #N` | Code review + security audit → structured findings → LGTM or Needs Changes |

---

### `hooks/` — Automated Quality Gates

| Hook | When it runs | What it does |
| --- | --- | --- |
| `pre-commit.sh` | Before every git commit | Type check → lint → test → secret scan |
| `lint-on-save.sh` | On file save (if wired to editor) | Auto-fix lint for `.ts`, `.rb`, `.py` |

The generic `pre-commit.sh` does nothing until you uncomment and configure checks for your stack. This is intentional — it fails loudly if you forget to configure it.

---

### `rules/` — Claude Guardrails

Rules are scoped to file path patterns. Claude must follow them when editing matching files.

| Rule file | Applies to | Key guardrails |
| --- | --- | --- |
| `api.md` | Controllers, routes | Input validation, auth per-request, no stack traces in responses, CORS policy, security headers |
| `database.md` | Models, migrations | Parameterized queries only, reversible migrations, indexes on FK columns, bcrypt for passwords |
| `frontend.md` | `src/**/*.ts(x)` | No `dangerouslySetInnerHTML` with user content, no `any`, 250-line component limit, semantic HTML |

---

### `skills/frontend-design/SKILL.md` — Design System

Defines the shared design token vocabulary — colors, typography, spacing (8pt grid), and border radii — so Claude generates UI that matches your design system automatically.

---

## Stack Examples

### Rails 7

Located in `.claude/examples/rails/`. Key highlights:

- **Security:** Strong Parameters enforced, `current_user.id` over `params[:user_id]`, Pundit authorization
- **Queries:** Parameterized queries only, `includes()` for eager loading, no string interpolation in SQL
- **Pre-commit:** Rubocop → Brakeman security scan → RSpec (changed files first, then failures, then fast spec dirs)
- **Deploy:** Heroku / Render with `db:migrate` and health check verification

### React 18 + Vite + TypeScript

Located in `.claude/examples/react-vite/`. Key highlights:

- **TypeScript:** `strict: true`, no `any`, explicit prop interfaces
- **State:** React Query for server state, Zustand for client state — never duplicated
- **Auth:** Tokens in memory/httpOnly cookies, event-bus pattern for 401 handling (no `window.location.href` redirect)
- **Pre-commit:** `tsc --noEmit` → ESLint → Vitest
- **Deploy:** Vercel / Netlify with type check, lint, and test gates

---

## Generating for Other Stacks

Use this prompt to generate a full `.claude` configuration for any stack:

```markdown
Generate a complete .claude folder for a [STACK_NAME] project.

Project context:
- Stack: [e.g., MERN / Django + React / Next.js / Laravel]
- Package manager: [npm / yarn / pnpm / bundler / pip / composer]
- Testing: [Jest / Pytest / PHPUnit / Vitest]
- Linting: [ESLint / Ruff / PHP_CodeSniffer]
- Database: [PostgreSQL / MongoDB / MySQL]
- Auth: [JWT / Passport / Sanctum / Auth.js]
- Key libraries: [list important ones]

Requirements:
1. CLAUDE.md covering stack, folder structure, commands, conventions, and security.
2. agents/ – code-reviewer, debugger, test-writer, security-auditor adapted to this stack.
3. commands/ – deploy.md, fix-issue.md, pr-review.md with concrete commands.
4. hooks/pre-commit.sh – type check, lint, test for this stack.
5. rules/ – api.md, database.md, frontend.md with stack-specific guardrails.
6. settings.json – safe allow/deny permissions.

Output the full folder tree and every file's content in code blocks.
```

---

## Security Notes

- **Never put secrets in `.claude/`** — use `.env` files and add them to `.gitignore`
- The `deny` list in `settings.json` blocks destructive commands (`rm -rf`, `sudo`, `curl`, `wget`) regardless of `allow` rules
- The `security-auditor` agent uses the OWASP Top 10 (2021) checklist
- Rules in `rules/api.md` require explicit CORS origins, CSP headers, and `X-Frame-Options` on all responses

---

## Contributing

1. Fork the repo
2. Copy `.claude/examples/rails/` or `.claude/examples/react-vite/` as a starting point for your stack
3. Add your stack under `.claude/examples/<your-stack>/`
4. Open a PR — the `/pr-review` command will run automatically

---

## License

MIT
