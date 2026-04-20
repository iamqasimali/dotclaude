# Rule: Frontend (React/Vite/TypeScript)

paths:
  - "src/**/*.tsx"
  - "src/**/*.ts"

## TypeScript
- `strict: true` in tsconfig – no exceptions
- No `any` – use `unknown` + type guards or proper generics
- Define prop interfaces above the component: `interface ButtonProps { ... }`
- Use `satisfies` operator for config objects instead of casting

## Components
- Max 250 lines – extract sub-components if larger
- One component per file
- Use `React.memo` only after profiling shows a bottleneck
- No logic inside JSX – extract to variables or hooks above the return

```tsx
// Bad
{users.filter(u => u.active).map(u => <UserCard key={u.id} user={u} />)}

// Good
const activeUsers = users.filter(u => u.active)
{activeUsers.map(u => <UserCard key={u.id} user={u} />)}
```

## Hooks
- Custom hooks start with `use`
- Return plain values, not JSX
- List all dependencies in `useEffect` / `useCallback` / `useMemo` deps arrays

## Performance
- Lazy-load all route components: `const Dashboard = React.lazy(() => import('./pages/Dashboard'))`
- Wrap lazy routes in `<Suspense fallback={<Spinner />}>`
- Avoid inline object/function creation in JSX props (causes re-renders)

## Accessibility
- Use semantic HTML: `<button>`, `<nav>`, `<main>`, `<aside>`
- Every `<img>` has meaningful `alt` text
- Forms: `<label htmlFor="id">` paired with `<input id="id">`
- Focus management after modal open/close

## Testing
- Test behaviour, not implementation: `getByRole`, `getByLabelText` over `getByTestId`
- Wrap async actions: `await userEvent.click(...)` then `await screen.findBy...`
- Mock only at the network boundary (MSW) – do not mock React components
