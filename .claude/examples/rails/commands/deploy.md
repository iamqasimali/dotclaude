# Command: deploy (Rails)

## Pre-flight
```bash
git status                          # Must be clean
bundle exec rspec                   # All green
bundle exec rubocop --no-color      # No offenses
bundle exec brakeman --quiet        # No warnings
```

## Deploy (Heroku example)
```bash
git push heroku main
heroku run rails db:migrate --app my-app
heroku restart --app my-app
curl https://my-app.herokuapp.com/health
```

## Deploy (Render / Fly.io)
```bash
git push origin main                # CI/CD auto-deploys on merge to main
# Then verify:
curl https://api.myapp.com/health
```

## Rollback
```bash
heroku releases --app my-app        # List releases
heroku rollback v42 --app my-app    # Roll back to specific version
heroku run rails db:rollback --app my-app  # If migration needs reverting
```
