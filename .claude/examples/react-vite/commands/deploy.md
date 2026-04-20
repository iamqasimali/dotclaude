# Command: deploy (React/Vite)

## Pre-flight
```bash
npx tsc --noEmit                    # No type errors
npm run lint                        # No lint errors
npm run test:run                    # All tests pass
npm run build                       # Build succeeds
```

## Deploy to Vercel
```bash
npx vercel --prod
# Or via Git push if Vercel is connected to the repo:
git push origin main
```

## Deploy to Netlify
```bash
npm run build
npx netlify deploy --prod --dir=dist
```

## Deploy to GitHub Pages
```bash
npm run build
npx gh-pages -d dist
```

## Post-deploy Smoke Test
```bash
curl -I https://my-app.com          # Check 200 OK
curl https://my-app.com/api/health  # Check API connectivity
```

## Rollback
- Vercel: Dashboard → Deployments → "Promote to Production" on previous deploy
- Netlify: Dashboard → Deploys → "Publish deploy" on previous deploy
