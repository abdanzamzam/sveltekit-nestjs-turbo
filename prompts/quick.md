# Quick Prompts for Common Tasks

## Frontend

### New Page
```
Create a new page at /[route] that [description]. Use TailwindCSS and follow existing patterns.
```

### New Component
```
Create a reusable [ComponentName] component with props: [list]. Use Shadcn-Svelte style.
```

### Form
```
Create a form for [purpose] with fields: [list]. Add validation and submit to [endpoint].
```

### API Call
```
Add API integration for [endpoint]. Handle loading, success, and error states.
```

## Backend

### New Endpoint
```
Create [METHOD] /api/[path] endpoint that [description]. Add validation and Swagger docs.
```

### CRUD
```
Implement full CRUD for [resource] with pagination, validation, and proper error handling.
```

### Database Entity
```
Create [EntityName] entity with fields: [list]. Generate migration.
```

### Auth Guard
```
Protect [endpoint] with JWT auth guard.
```

## Full Stack

### Feature
```
Implement [feature name]:
- Frontend: [description]
- Backend: [description]
- Database: [schema]
Use shared types from @repo/types.
```

### Integration
```
Connect frontend [component] to backend [endpoint]. Handle all states properly.
```

## Refactoring

### Clean Up
```
Refactor [file] to improve readability and follow project patterns. Extract reusable logic.
```

### Type Safety
```
Add proper TypeScript types to [file]. Remove any types.
```

## Testing

### Unit Test
```
Add unit tests for [file/function]. Cover happy path and edge cases.
```

### E2E Test
```
Add E2E test for [user flow]. Use Playwright.
```

## Quick Fixes

### Bug Fix
```
Fix bug in [location]: [description]. Expected: [expected], Actual: [actual].
```

### Style Fix
```
Update [component] styling to match [design/screenshot]. Use TailwindCSS.
```

### Performance
```
Optimize [area]. Current issue: [description]. Use caching/indexing as needed.
```

## Database

### Migration
```
Create migration to [description]. Update entity [EntityName].
```

### Query Optimization
```
Optimize query in [service/method]. Add proper indexes and select only needed fields.
```

## Deployment

### Docker Build
```
Ensure Docker builds work for production. Test both web and api containers.
```

### CI/CD
```
Add GitHub Actions workflow for [test/build/deploy]. Run on [trigger].
```

---

## Usage Tips

1. Replace `[placeholders]` with your specific values
2. Add more context for complex tasks
3. Reference existing files/patterns when available
4. Specify constraints or what NOT to change
5. Mention any dependencies or requirements
