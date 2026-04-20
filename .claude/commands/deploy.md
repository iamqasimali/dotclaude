# Command: deploy

## Description
Run pre-flight checks and deploy the application.

## Steps
1. Verify working tree is clean: `git status`
2. Run full test suite and fail fast if any test fails
3. Run linter and fail if errors (warnings OK)
4. Build production artifact
5. Deploy to target environment
6. Run smoke test against live URL
7. Report success or rollback on failure

## Usage
```
/deploy [staging|production]
```

## Notes
- Replace the steps below with your actual deploy commands
- Never deploy with a dirty working tree
- Always verify the health endpoint after deploy
