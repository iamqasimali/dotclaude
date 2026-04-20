# Rule: API

paths:
  - "app/controllers/**/*"
  - "src/api/**/*"
  - "routes/**/*"
  - "controllers/**/*"

## General API Rules

### Input Validation
- Validate all incoming data at the controller/handler boundary
- Reject unknown fields – never pass raw params to the database
- Use allow-lists, not block-lists for field filtering

### Authentication & Authorization
- Every non-public endpoint must verify identity
- Authorization check must happen per-request, not just at login
- Never trust client-supplied IDs – resolve from the authenticated user's context

### Response Standards
- Use consistent response shape: `{ data, error, meta }`
- Always return meaningful HTTP status codes
- Never expose stack traces or internal error messages to clients

### Security
- Rate-limit auth endpoints (login, signup, password reset)
- Log all auth events (success and failure)
- Set `Content-Type: application/json` on all JSON responses
- Use HTTPS only – reject plaintext HTTP in production
- Set explicit CORS `allowedOrigins` – never use `*` in production
- Return `Content-Security-Policy` header on all HTML responses
- Set `X-Content-Type-Options: nosniff` and `X-Frame-Options: DENY`
