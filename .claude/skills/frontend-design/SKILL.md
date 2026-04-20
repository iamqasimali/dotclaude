# Skill: Frontend Design

## Purpose
Apply consistent design tokens, spacing, and component patterns across the UI.

## Design Tokens
```css
/* Colors */
--color-primary:    #2563eb;
--color-secondary:  #7c3aed;
--color-success:    #16a34a;
--color-warning:    #d97706;
--color-danger:     #dc2626;
--color-neutral-50: #f9fafb;
--color-neutral-900:#111827;

/* Typography */
--font-sans:   'Inter', system-ui, sans-serif;
--font-mono:   'JetBrains Mono', monospace;
--text-sm:     0.875rem;
--text-base:   1rem;
--text-lg:     1.125rem;
--text-xl:     1.25rem;

/* Spacing (8pt grid) */
--space-1: 0.25rem;   /* 4px  */
--space-2: 0.5rem;    /* 8px  */
--space-3: 0.75rem;   /* 12px */
--space-4: 1rem;      /* 16px */
--space-6: 1.5rem;    /* 24px */
--space-8: 2rem;      /* 32px */

/* Radius */
--radius-sm: 0.25rem;
--radius-md: 0.5rem;
--radius-lg: 1rem;
```

## Component Conventions
- Prefer shadcn/ui primitives when available
- All interactive components must have focus-visible styles
- Use Tailwind utility classes; avoid inline styles
- Dark mode via `dark:` variants – no manual theme switching logic
