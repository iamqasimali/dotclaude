# Rule: Frontend

paths:
  - "src/**/*.tsx"
  - "src/**/*.ts"
  - "src/**/*.jsx"
  - "src/**/*.js"
  - "app/javascript/**/*"

## Security
- Never use `dangerouslySetInnerHTML` with user-controlled content
- Sanitize HTML strings with DOMPurify before rendering
- Never store auth tokens in localStorage – use httpOnly cookies or memory
- Validate all form input on the client AND the server

## Components
- Max 250 lines per component file – extract if larger
- Props must have explicit type definitions
- No `any` type – use `unknown` with type guards
- Prefer composition over prop drilling deeper than 2 levels

## State Management
- Local UI state → component state
- Shared cross-component state → global store (Zustand / Redux)
- Server state → query library (React Query / SWR) – do not duplicate in store
- Never store derived data – compute it

## Performance
- Lazy-load routes and heavy components
- Memoize only when profiling shows a measurable benefit
- Avoid creating new objects/functions inside JSX unless memoized

## Accessibility
- All interactive elements must be keyboard-navigable
- Buttons use `<button>`, links use `<a href>`
- Images have descriptive `alt` text
- Forms have associated `<label>` elements
