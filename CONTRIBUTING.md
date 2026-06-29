# Contributing Guide

Guidelines for extending and customizing your starter kit.

## 🏗️ Architecture Decisions

### Why Turborepo?
- Fast incremental builds
- Shared caching across team
- Simple monorepo management
- Better than Lerna/Nx for this scale

### Why SvelteKit over Next.js?
- Smaller bundle sizes
- Better performance out-of-the-box
- Simpler mental model
- Great DX with Vite

### Why NestJS over Express?
- Better structure for scaling
- Built-in TypeScript
- Dependency injection
- Easy testing
- Microservices-ready

### Why TypeORM over Prisma?
- More mature for PostgreSQL
- Better raw SQL support
- Decorator-based (fits NestJS)
- More flexible for complex queries

## 📝 Code Style

### General
- Use TypeScript strict mode
- Prefer `const` over `let`
- Use async/await over Promises
- Write self-documenting code
- Keep functions small (<50 lines)

### Naming Conventions
- **Files:** `kebab-case.ts`
- **Components:** `PascalCase.svelte`
- **Functions:** `camelCase()`
- **Constants:** `UPPER_SNAKE_CASE`
- **Interfaces:** `PascalCase` (no `I` prefix)
- **Types:** `PascalCase`

### Svelte
```svelte
<script lang="ts">
  // Imports first
  import { onMount } from 'svelte';
  import Component from '$lib/components/Component.svelte';
  
  // Props
  export let title: string;
  
  // State
  let count = 0;
  
  // Reactive statements
  $: doubled = count * 2;
  
  // Functions
  function increment() {
    count += 1;
  }
  
  // Lifecycle
  onMount(() => {
    console.log('mounted');
  });
</script>

<!-- Markup -->
<div class="container">
  <h1>{title}</h1>
  <p>{doubled}</p>
  <button on:click={increment}>+1</button>
</div>

<!-- Styles (scoped) -->
<style>
  .container {
    /* Prefer Tailwind classes in markup */
  }
</style>
```

### NestJS
```typescript
// Use decorators consistently
@Injectable()
export class UserService {
  constructor(
    @InjectRepository(User)
    private userRepository: Repository<User>,
  ) {}

  async findAll(): Promise<User[]> {
    return this.userRepository.find();
  }
}

// Controller
@Controller('users')
@ApiTags('users')
export class UserController {
  constructor(private readonly userService: UserService) {}

  @Get()
  @ApiOperation({ summary: 'Get all users' })
  async findAll(): Promise<User[]> {
    return this.userService.findAll();
  }
}
```

## 🧩 Adding Features

### New API Endpoint

```bash
cd apps/api
npx nest g module modules/posts
npx nest g controller modules/posts
npx nest g service modules/posts
```

Then:
1. Create entity in `modules/posts/entities/post.entity.ts`
2. Add TypeORM repository
3. Implement CRUD in service
4. Add Swagger decorators
5. Add validation DTOs

### New Svelte Page

```bash
# Create route
touch apps/web/src/routes/about/+page.svelte
touch apps/web/src/routes/about/+page.ts  # Optional: load data
```

### Shared Component

```bash
# Create in packages/ui
mkdir -p packages/ui/src/components
touch packages/ui/src/components/Button.svelte
```

Update `packages/ui/package.json`:
```json
{
  "name": "@repo/ui",
  "exports": {
    "./Button": "./src/components/Button.svelte"
  }
}
```

Use in apps:
```svelte
<script>
  import Button from '@repo/ui/Button';
</script>
```

### Database Migration

```bash
cd apps/api
npm run typeorm migration:create -- src/migrations/AddUserTable
```

Edit migration, then:
```bash
npm run typeorm migration:run
```

## 🧪 Testing

### Unit Tests (Vitest)

```typescript
// apps/api/src/user/user.service.spec.ts
import { Test } from '@nestjs/testing';
import { UserService } from './user.service';

describe('UserService', () => {
  let service: UserService;

  beforeEach(async () => {
    const module = await Test.createTestingModule({
      providers: [UserService],
    }).compile();

    service = module.get<UserService>(UserService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
```

### E2E Tests (Playwright)

```typescript
// apps/web/tests/home.spec.ts
import { expect, test } from '@playwright/test';

test('homepage has title', async ({ page }) => {
  await page.goto('/');
  await expect(page.getByRole('heading')).toContainText('Welcome');
});
```

## 🎨 Styling Guidelines

### Tailwind First
Use Tailwind utility classes for 90% of styling:

```svelte
<div class="flex items-center gap-4 p-4 bg-white rounded-lg shadow">
  <h2 class="text-2xl font-bold">Title</h2>
</div>
```

### Component Classes
For reusable patterns, use `cn()` utility:

```svelte
<script>
  import { cn } from '$lib/utils';
  export let variant: 'primary' | 'secondary' = 'primary';
</script>

<button class={cn(
  "px-4 py-2 rounded font-medium transition",
  variant === 'primary' && "bg-blue-600 text-white hover:bg-blue-700",
  variant === 'secondary' && "bg-gray-200 text-gray-800 hover:bg-gray-300"
)}>
  <slot />
</button>
```

### Design Tokens
Extend in `tailwind.config.js`:

```javascript
theme: {
  extend: {
    colors: {
      brand: {
        50: '#f0f9ff',
        // ... your palette
      }
    }
  }
}
```

## 🔒 Security Best Practices

### API
- Always validate input (use DTOs)
- Use parameterized queries (TypeORM does this)
- Enable CORS selectively
- Rate limit endpoints
- Use helmet.js
- Sanitize error messages in production

### Frontend
- Never store secrets in frontend code
- Use environment variables for API URLs
- Validate user input
- Use CSP headers
- Keep dependencies updated

## 📦 Dependencies

### Adding Dependencies

```bash
# Root (tools only)
npm install -D prettier --workspace-root

# Specific app
npm install zod --workspace=api

# Shared package
npm install clsx --workspace=@repo/ui
```

### Dependency Rules
- Use exact versions for production deps
- Use `^` for dev dependencies
- Keep dependencies minimal
- Audit regularly: `npm audit`

## 🚀 Deployment

### Environment Variables
Never commit:
- Database credentials
- API keys
- JWT secrets
- Third-party tokens

Use `.env.example` for documentation.

### Docker Production
```bash
docker compose up --build
```

### Manual Deploy
```bash
# Build
npm run build

# Start API
cd apps/api && node dist/main.js

# Start Web
cd apps/web && node build
```

## 📚 Documentation

### Code Comments
- Use JSDoc for public APIs
- Explain "why", not "what"
- Keep comments updated

### README Updates
Update when you:
- Add new features
- Change configuration
- Add dependencies
- Change deployment process

## 🐛 Debugging

### Backend
```bash
# Enable debug logs
DEBUG=* npm run dev --workspace=api

# Or use NestJS logger
this.logger.debug('Debug message');
```

### Frontend
```bash
# Vite debug
DEBUG=vite:* npm run dev --workspace=web
```

## 🎯 Performance

### Backend
- Use database indexes
- Implement caching (Redis)
- Use pagination
- Avoid N+1 queries
- Profile slow endpoints

### Frontend
- Code split routes
- Lazy load components
- Optimize images
- Use Svelte stores wisely
- Minimize bundle size

## 🤝 Git Workflow

### Commit Messages
```
feat: add user authentication
fix: resolve database connection issue
docs: update README with new commands
refactor: simplify user service logic
test: add unit tests for auth module
chore: update dependencies
```

### Branch Naming
- `feature/user-auth`
- `fix/database-connection`
- `refactor/user-service`

---

**Happy coding! Build something awesome! 🚀**
