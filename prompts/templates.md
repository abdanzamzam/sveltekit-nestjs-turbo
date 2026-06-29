# Prompt Templates for Vibe Coding

## Adding New API Endpoint

```
Create a new REST API endpoint in the NestJS backend:

Resource: [name]
HTTP Method: [GET/POST/PUT/DELETE]
Path: /api/[path]
Description: [what it does]

Requirements:
- Create module, controller, service
- Add DTOs with validation
- Add Swagger documentation
- Use TypeORM for database operations
- Follow existing patterns in apps/api
- Add proper error handling
- Return standardized API response format

Example response format:
{
  "success": boolean,
  "data": any,
  "message": string
}
```

## Adding New Frontend Page

```
Create a new page in SvelteKit:

Route: /[route-name]
Purpose: [description]

Requirements:
- Create +page.svelte in apps/web/src/routes/[route-name]/
- Use TailwindCSS for styling
- Follow existing component patterns
- Add TypeScript types
- Use Shadcn-Svelte or Melt UI components if needed
- Ensure responsive design
- Add proper meta tags (title, description)

Style: [modern/minimal/card-based/etc]
```

## Adding Shared Component

```
Create a reusable UI component:

Component name: [PascalCase]
Location: apps/web/src/lib/components/[name].svelte
Purpose: [what it does]

Props:
- [prop1]: type - description
- [prop2]: type - description

Requirements:
- Use TypeScript for props
- Use TailwindCSS for styling
- Follow Shadcn-Svelte patterns
- Make it accessible (ARIA)
- Add documentation comments
- Export from $lib/components/index.ts
```

## Database Entity & Migration

```
Create a new database entity:

Entity name: [PascalCase]
Table name: [snake_case]

Fields:
- id: UUID primary key
- [field1]: type - description
- [field2]: type - description
- createdAt: timestamp
- updatedAt: timestamp

Requirements:
- Create entity in apps/api/src/entities/[name].entity.ts
- Use TypeORM decorators
- Add validation decorators
- Create migration: npm run typeorm migration:create
- Add relationships if needed
- Update shared types in packages/types/
```

## CRUD Implementation

```
Implement full CRUD operations:

Resource: [name]
Entity: [EntityName]

Endpoints needed:
- GET /api/[resource] - List all (with pagination)
- GET /api/[resource]/:id - Get one
- POST /api/[resource] - Create
- PUT /api/[resource]/:id - Update
- DELETE /api/[resource]/:id - Delete

Requirements:
- Create DTOs for create/update
- Add validation (class-validator)
- Add Swagger documentation
- Implement pagination for list endpoint
- Add error handling
- Add unit tests
- Update shared types
```

## Authentication Setup

```
Add authentication to the API:

Strategy: JWT
Requirements:
- Install @nestjs/passport @nestjs/jwt passport passport-jwt
- Create auth module, service, controller
- Implement login endpoint (POST /api/auth/login)
- Implement register endpoint (POST /api/auth/register)
- Create JWT strategy with guards
- Hash passwords with bcrypt
- Add user entity with email/password
- Protect routes with @UseGuards(JwtAuthGuard)
- Add Swagger bearer auth
- Store JWT in frontend (localStorage or cookie)
```

## Form with Validation

```
Create a form in the frontend:

Form purpose: [description]
Submit to: [API endpoint]

Fields:
- [field1]: type, validation rules
- [field2]: type, validation rules

Requirements:
- Use Svelte reactive forms
- Client-side validation
- Display error messages
- Disable submit while loading
- Show success/error toast
- Follow existing form patterns
- Use TailwindCSS for styling
- Make it accessible
```

## API Integration

```
Connect frontend to backend API:

Endpoint: [method] /api/[path]
Purpose: [what it does]

Requirements:
- Create API client function in $lib/api/
- Use fetch with proper error handling
- Add TypeScript types from @repo/types
- Handle loading states
- Handle errors gracefully
- Show user feedback (toast/alert)
- Update UI optimistically if needed
```

## Refactoring Request

```
Refactor this code:

File: [path]
Function/Component: [name]

Issues:
- [list current problems]

Goals:
- Improve readability
- Better TypeScript types
- Extract reusable logic
- Reduce complexity
- Follow project patterns
- Keep existing functionality

Constraints:
- Don't break existing API
- Maintain test coverage
- Keep same behavior
```

## Bug Fix Request

```
Fix this bug:

Location: [file/component]
Issue: [describe the bug]
Expected behavior: [what should happen]
Actual behavior: [what happens instead]

Steps to reproduce:
1. [step 1]
2. [step 2]
3. [step 3]

Requirements:
- Fix the root cause
- Add error handling if needed
- Add tests to prevent regression
- Update documentation if needed
```

## Performance Optimization

```
Optimize performance:

Area: [frontend/backend/database]
Current issue: [describe performance problem]

Requirements:
- Identify bottlenecks
- Implement caching if appropriate (Redis)
- Add database indexes
- Optimize queries (use .select() for specific fields)
- Code split frontend if needed
- Use lazy loading
- Measure before/after performance
```

## Testing Request

```
Add tests for:

File: [path]
Type: [unit/integration/e2e]

Requirements:
- Use Vitest for unit tests
- Use Playwright for E2E
- Cover happy path
- Cover edge cases
- Cover error cases
- Mock external dependencies
- Achieve >80% coverage
```

---

## Tips for Better Prompts

1. **Be specific** - Include exact paths, names, requirements
2. **Show examples** - Reference existing code patterns
3. **Set constraints** - Mention what NOT to change
4. **Define success** - What does "done" look like?
5. **Mention dependencies** - What libraries to use
6. **Include context** - Link to related files/docs
