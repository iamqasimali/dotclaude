# Project Brain – React 18 + Vite + TypeScript

## Tech Stack
- React 18, TypeScript 5 (strict mode)
- Vite for build tooling
- React Router v6 for routing
- Zustand for global state
- React Query (TanStack Query) for server state
- Tailwind CSS + shadcn/ui for styling
- Axios for HTTP
- Vitest + React Testing Library for unit/integration tests
- Playwright for E2E tests
- ESLint + Prettier for linting

## Folder Structure
```
src/
├── components/       # Shared/reusable UI components
│   └── ui/           # shadcn/ui primitives
├── pages/            # Route-level components
├── store/            # Zustand slices
├── hooks/            # Custom React hooks
├── lib/              # API client, utility functions
├── types/            # Shared TypeScript interfaces
└── main.tsx
tests/
├── unit/
└── e2e/              # Playwright specs
```

## Common Commands
```bash
npm run dev           # Start dev server (http://localhost:5173)
npm run build         # Production build
npm run preview       # Preview production build locally
npm test              # Run Vitest (watch mode)
npm run test:run      # Run Vitest once (CI)
npm run test:e2e      # Run Playwright E2E tests
npm run lint          # ESLint
npm run lint:fix      # ESLint with auto-fix
npx tsc --noEmit      # Type check without building
```

## Conventions
- Functional components only – no class components
- Every component props type defined as `interface ComponentNameProps`
- No `any` – use `unknown` with type guards
- Custom hooks start with `use` and live in `src/hooks/`
- All icons from `lucide-react`
- API calls go through `src/lib/api.ts` – no raw `fetch` in components
- Route-level code splitting with `React.lazy` + `Suspense`

## State Management Rules
- Local UI state → `useState` / `useReducer`
- Server state → React Query (do NOT duplicate in Zustand)
- Global client state → Zustand
- Never store derived data – compute it

## Security
- Never use `dangerouslySetInnerHTML` with user input
- Sanitize with DOMPurify if HTML rendering is required
- Store auth tokens in memory or httpOnly cookies – not localStorage
- Never log tokens or sensitive user data to the console
