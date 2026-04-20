# Rule: API Client (React/Vite)

paths:
  - "src/lib/api.ts"
  - "src/hooks/use*.ts"

## API Layer
- All HTTP calls go through `src/lib/api.ts` (Axios instance)
- Set `baseURL` from `import.meta.env.VITE_API_URL`
- Attach auth token via request interceptor – never inline in components
- Handle 401 responses in response interceptor (redirect to login)

```ts
// src/lib/api.ts
import axios from 'axios'

export const api = axios.create({
  baseURL: import.meta.env.VITE_API_URL,
  withCredentials: true,
})

// Use an event bus or router ref – hard redirect loses in-memory state
const authListeners: Array<() => void> = []
export const onUnauthorized = (fn: () => void) => authListeners.push(fn)

api.interceptors.response.use(
  res => res,
  err => {
    if (err.response?.status === 401) {
      authListeners.forEach(fn => fn())
    }
    return Promise.reject(err)
  }
)

// In App.tsx: onUnauthorized(() => navigate('/login'))
```

## React Query
- Use `useQuery` for GET requests, `useMutation` for POST/PUT/DELETE
- Always provide a stable `queryKey` array
- Invalidate relevant queries after mutations
- Use `onError` callbacks to surface errors to the user

## Environment Variables
- All client env vars prefixed with `VITE_`
- Never put secrets in `VITE_*` vars – they are bundled into the client
- Keep a `.env.example` committed; `.env.local` in `.gitignore`
