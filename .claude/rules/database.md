# Rule: Database

paths:
  - "db/**/*"
  - "migrations/**/*"
  - "models/**/*"
  - "src/models/**/*"

## Query Safety
- Never concatenate user input into raw SQL strings
- Use parameterized queries or ORM query builders at all times
- Never use `eval` or dynamic query construction from untrusted input

## Migrations
- Migrations must be reversible (provide both `up` and `down`)
- Never delete a column in the same migration that removes code using it
- Add indexes for all foreign keys and frequently queried columns
- Test migrations on a copy of production data before deploying

## Performance
- Avoid N+1 queries – use eager loading for associations
- Use `.lean()` / `.select()` / `pluck` for read-only projections
- Paginate large result sets – never return unbounded queries

## Data Integrity
- Set NOT NULL constraints at the database level, not just in code
- Use database-level foreign key constraints
- Never store passwords in plain text – always hash with bcrypt (cost ≥ 12)
- Encrypt sensitive PII columns at rest
