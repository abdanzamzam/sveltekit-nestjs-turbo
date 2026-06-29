# 🚀 Quick Start Guide

Get up and running in 5 minutes!

## ⚡ Fast Start (Development)

```bash
# 1. Start databases (PostgreSQL + Redis)
docker-compose -f docker-compose.dev.yml up -d

# 2. Install dependencies (if not done)
npm install

# 3. Setup environment
cp apps/api/.env.example apps/api/.env

# 4. Start everything
npm run dev
```

**Done!** 🎉

- Frontend: http://localhost:3000
- Backend API: http://localhost:3001
- API Docs: http://localhost:3001/api/docs

## 📋 What's Running?

### Frontend (Port 3000)
- SvelteKit with hot reload
- TailwindCSS with JIT
- TypeScript strict mode

### Backend (Port 3001)
- NestJS with watch mode
- Auto-reload on changes
- Swagger docs at `/api/docs`

### Databases
- PostgreSQL: `localhost:5432`
- Redis: `localhost:6379`

## 🛑 Stop Everything

```bash
# Stop dev servers (Ctrl+C in terminal)

# Stop databases
docker-compose -f docker-compose.dev.yml down
```

## 🔧 Common Tasks

### Add API Endpoint
```bash
cd apps/api
npx nest g resource modules/users
```

### Add Svelte Component
```bash
# Create in apps/web/src/lib/components/
# Import with: import Component from '$lib/components/Component.svelte'
```

### Check Database
```bash
# Connect to PostgreSQL
docker exec -it sveltekit-nestjs-turbo-db-dev psql -U postgres -d sveltekit_nestjs_turbo
```

### View Logs
```bash
# Database logs
docker logs sveltekit-nestjs-turbo-db-dev -f

# Redis logs
docker logs sveltekit-nestjs-turbo-redis-dev -f
```

## 🐛 Troubleshooting

### Port Already in Use
```bash
# Check what's using the port
lsof -i :3000
lsof -i :3001
lsof -i :5432

# Kill the process or change ports in configs
```

### Database Connection Failed
```bash
# Restart databases
docker-compose -f docker-compose.dev.yml restart

# Check if running
docker ps
```

### Dependencies Issues
```bash
# Clean install
rm -rf node_modules apps/*/node_modules packages/*/node_modules
npm install
```

## 📚 Next Steps

1. **Read the README.md** for full documentation
2. **Explore the code** - start with `apps/web/src/routes/+page.svelte`
3. **Add features** - check the main README for guides
4. **Customize** - make it yours!

## 🎨 Useful Resources

- [SvelteKit Docs](https://kit.svelte.dev/docs)
- [NestJS Docs](https://docs.nestjs.com)
- [Shadcn-Svelte](https://shadcn-svelte.com)
- [Melt UI](https://melt-ui.com)
- [TailwindCSS](https://tailwindcss.com)

---

**Happy Hacking! 🚀**
