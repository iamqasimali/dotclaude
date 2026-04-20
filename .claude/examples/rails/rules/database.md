# Rule: Database (Rails / ActiveRecord)

paths:
  - "db/**/*"
  - "app/models/**/*"

## Queries
- Never use string interpolation in queries: `where("name = '#{params[:name]}'")` is SQL injection
- Use parameterized queries: `where("name = ?", params[:name])` or `where(name: params[:name])`
- Use `.find_by` instead of `.find` when the record might not exist
- Always use `.lean` / `.pluck` for read-only projections

## N+1 Prevention
- Use `includes(:association)` for eager loading
- Use the `bullet` gem in development to detect N+1s
- Never load associations inside a loop

## Migrations
```ruby
# Good – reversible
def change
  add_column :users, :role, :string, null: false, default: "member"
  add_index :users, :role
end
```
- Add `null: false` at the DB level for required fields
- Always add indexes for foreign keys and columns used in `where`/`order`
- Separate data migrations from schema migrations

## Models
- Validate at model level AND enforce constraints at DB level
- `has_many :dependent :destroy` or `:restrict_with_exception` – never leave dangling records
- Keep models thin – move business logic to service objects
