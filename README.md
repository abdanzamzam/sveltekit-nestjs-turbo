# SvelteKit-NestJS-Turbo - Production-Ready Boilerplate

Modern full-stack starter kit with SvelteKit, NestJS, TypeORM, PostgreSQL, and TailwindCSS in a Turborepo monorepo.

## 🚀 Features

- **Frontend:** SvelteKit + TailwindCSS + Shadcn-Svelte + Melt UI
- **Backend:** NestJS + TypeORM + PostgreSQL
- **Monorepo:** Turborepo for fast builds
- **Type-safe:** Full TypeScript across stack
- **Styling:** TailwindCSS with custom design system
- **API Docs:** Swagger/OpenAPI auto-generated
- **Docker:** Ready for containerized deployment
- **Testing:** Vitest + Playwright setup ready
- **Linting:** ESLint + Prettier

## 📦 Project Structure

```
.
├── apps/
│   ├── web/          # SvelteKit frontend
│   └── api/          # NestJS backend
├── packages/
│   ├── types/        # Shared TypeScript types
│   ├── config/       # Shared configs (ESLint, Prettier)
│   ├── ui/           # Shared UI components (future)
│   └── database/     # TypeORM entities & migrations (future)
├── docker-compose.yml
├── docker-compose.dev.yml
└── turbo.json
```

## 🛠️ Getting Started

### Prerequisites

- Node.js 20+
- Docker & Docker Compose
- npm 10+

### Installation

1. **Clone and install dependencies:**

```bash
npm install
```

2. **Start databases (PostgreSQL + Redis):**

```bash
docker-compose -f docker-compose.dev.yml up -d
```

3. **Setup environment variables:**

```bash
# Copy example env files
cp apps/api/.env.example apps/api/.env
```

4. **Start development servers:**

```bash
npm run dev
```

This will start:
- Frontend: http://localhost:3000
- Backend API: http://localhost:3001
- API Docs: http://localhost:3001/api/docs

## 📝 Available Scripts

```bash
# Development
npm run dev          # Start all apps in dev mode
npm run build        # Build all apps
npm run lint         # Lint all apps
npm run format       # Format with Prettier
npm run test         # Run tests

# Docker
docker-compose up    # Start production build
docker-compose -f docker-compose.dev.yml up  # Start dev databases only
```

## 🏗️ Tech Stack Details

### Frontend (apps/web)
- **Framework:** SvelteKit 2
- **Styling:** TailwindCSS v3 + custom design tokens
- **Components:** Shadcn-Svelte (copy-paste) + Melt UI (headless)
- **Type Safety:** TypeScript strict mode
- **Build:** Vite

### Backend (apps/api)
- **Framework:** NestJS 10
- **ORM:** TypeORM 0.3
- **Database:** PostgreSQL 16
- **Validation:** class-validator + class-transformer
- **API Docs:** Swagger/OpenAPI
- **Caching:** Redis ready (optional)

### Shared Packages
- **@repo/types:** Shared TypeScript interfaces
- **@repo/config:** ESLint & Prettier configs
- **@repo/ui:** (Future) Shared React/Svelte components
- **@repo/database:** (Future) TypeORM entities & migrations

## 🔧 Configuration

### Database Configuration
Edit `apps/api/.env`:
```env
DB_HOST=localhost
DB_PORT=5432
DB_USERNAME=postgres
DB_PASSWORD=postgres
DB_NAME=sveltekit_nestjs_turbo
```

### API Configuration
```env
PORT=3001
NODE_ENV=development
JWT_SECRET=your-secret-key
```

## 🧪 Testing

```bash
# Unit tests
npm run test --workspace=api
npm run test --workspace=web

# E2E tests (after setup)
npm run test:e2e
```

## 🚢 Deployment

### Docker Production Build

```bash
docker-compose up --build
```

### Manual Deployment

1. Build all apps:
```bash
npm run build
```

2. Start API:
```bash
cd apps/api && npm run start:prod
```

3. Start Web:
```bash
cd apps/web && node build
```

## 📚 Adding Features

### Create New API Endpoint

```bash
cd apps/api
npx nest g resource users
```

### Add Shared Component

```bash
# Create in packages/ui/
# Import in both apps
```

### Add Database Entity

```bash
cd apps/api
npx nest g class entities/user.entity
```

## 🎨 Customization

### Tailwind Theme
Edit `apps/web/tailwind.config.js` for colors, spacing, etc.

### API Swagger
Customize in `apps/api/src/main.ts` DocumentBuilder

## 🤝 Contributing

1. Fork the repo
2. Create feature branch (`git checkout -b feature/amazing`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push branch (`git push origin feature/amazing`)
5. Open Pull Request

## 📄 License

MIT

## 🙏 Acknowledgments

- [SvelteKit](https://kit.svelte.dev/)
- [NestJS](https://nestjs.com/)
- [Shadcn-Svelte](https://shadcn-svelte.com/)
- [Melt UI](https://melt-ui.com/)
- [Turborepo](https://turbo.build/)

---

**Happy coding! 🚀**
