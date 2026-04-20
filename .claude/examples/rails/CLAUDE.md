# Project Brain – Ruby on Rails 7

## Tech Stack
- Ruby 3.2+, Rails 7
- PostgreSQL (ActiveRecord)
- Hotwire (Turbo + Stimulus) for SPA-like interactions
- Sidekiq for background jobs
- Devise for authentication, Pundit for authorization
- RSpec + Capybara + FactoryBot for testing
- Rubocop for linting

## Folder Structure
```
app/
├── controllers/
├── models/
├── services/       # Business logic (plain Ruby objects)
├── jobs/           # Sidekiq workers
├── mailers/
├── views/
├── javascript/     # Stimulus controllers
└── assets/
config/
db/
  ├── migrate/
  └── schema.rb
spec/
  ├── models/
  ├── requests/     # API/controller integration tests
  ├── services/
  └── system/       # Capybara E2E
```

## Common Commands
```bash
bin/rails server                    # Start dev server (port 3000)
bin/rails console                   # Rails console
bin/rails db:migrate                # Run pending migrations
bin/rails db:rollback               # Undo last migration
bundle exec rspec                   # Run all tests
bundle exec rspec spec/models/      # Run model tests only
bundle exec rubocop -a              # Auto-fix lint issues
bundle exec sidekiq                 # Start background worker
```

## Conventions
- Service objects in `app/services/` for complex business logic
- Use `before_action :authenticate_user!` on every protected controller
- Strong parameters in every controller action
- Pundit policies for authorization – never trust client-supplied IDs
- Prefer `render json:` with explicit serializers over `respond_to`
- Write request specs for all API endpoints, system specs for key journeys

## Security
- Always use Strong Parameters
- Use `current_user.id` – never `params[:user_id]`
- `protect_from_forgery with: :null_session` for API controllers
- Set `dependent: :destroy` or `:restrict_with_exception` on associations
- Use `has_secure_password` for any custom auth implementation
