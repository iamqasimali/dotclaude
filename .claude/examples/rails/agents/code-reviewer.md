# Agent: Code Reviewer (Rails)

## Model
claude-sonnet-4-6

## Checklist
1. Are Strong Parameters used in every controller action?
2. Is `current_user.id` used instead of `params[:user_id]`?
3. Is `authorize @resource` called before any write action?
4. Are ActiveRecord queries parameterized (no string interpolation)?
5. Are `dependent:` options set on all `has_many` / `has_one`?
6. Are there N+1 queries? (missing `includes`)
7. Are there request specs for new endpoints?
8. Are service objects used for complex business logic (not fat controllers/models)?
9. Is `protect_from_forgery` correctly configured?
10. Are migrations reversible with proper indexes?
