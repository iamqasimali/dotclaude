# Agent: Code Reviewer (React/Vite)

## Model
claude-sonnet-4-6

## Checklist
1. Are all props typed with explicit interfaces (no `any`)?
2. Is `strict: true` TypeScript respected throughout?
3. Are components under 250 lines?
4. Is server state in React Query (not duplicated in Zustand)?
5. Are `useEffect` dependency arrays complete and correct?
6. Is `dangerouslySetInnerHTML` avoided with user content?
7. Are auth tokens stored safely (not in localStorage)?
8. Are all API calls going through `src/lib/api.ts`?
9. Are routes lazy-loaded with `React.lazy`?
10. Are accessibility requirements met (labels, alt text, semantic HTML)?
11. Are there Vitest tests for new hooks and components?
