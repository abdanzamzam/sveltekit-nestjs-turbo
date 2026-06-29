# AI Coding Assistant Configuration Summary

This starter kit includes configuration files for popular AI coding assistants.

## Available Configurations

### 1. `.cursorrules` - Cursor AI
Full project context and coding guidelines for Cursor IDE.

**Features:**
- Project structure overview
- Development commands
- Code style guidelines
- Common patterns
- Security best practices

### 2. `.clinerules` - Cline
Concise rules for Cline AI assistant.

**Features:**
- Stack overview
- Key commands
- Naming conventions
- Common tasks
- Quick reference

### 3. `.windsurfrules` - Windsurf
Configuration for Windsurf AI coding assistant.

**Features:**
- Project overview
- Development workflow
- Coding standards
- Security checklist
- Component libraries

### 4. `.aider.conf.yml` - Aider
YAML configuration for Aider CLI tool.

**Features:**
- Model settings
- Git integration
- File watching
- Lint/test commands
- Project instructions

### 5. `.editorconfig` - Editor Config
Universal editor configuration.

**Features:**
- Consistent formatting
- Line endings (LF)
- Tab/space settings
- File-specific rules

### 6. `.vscode/` - VS Code
VS Code workspace settings and extensions.

**Files:**
- `settings.json` - Editor settings, formatters, linters
- `extensions.json` - Recommended extensions

### 7. `prompts/` - Prompt Templates
Ready-to-use prompts for common coding tasks.

**Files:**
- `templates.md` - Detailed prompt templates
- `quick.md` - Quick one-liner prompts

### 8. `.github/workflows/` - CI/CD
GitHub Actions workflows for automation.

**Files:**
- `ci.yml` - Continuous Integration (lint, test, build)

---

## How to Use

### With Cursor
1. Open project in Cursor
2. `.cursorrules` is automatically loaded
3. Start coding with AI assistance

### With Cline (VS Code Extension)
1. Install Cline extension
2. `.clinerules` is automatically detected
3. Use Cline chat for assistance

### With Windsurf
1. Open project in Windsurf IDE
2. `.windsurfrules` provides context
3. Use AI features

### With Aider (CLI)
```bash
# Install aider
pip install aider-chat

# Run in project directory
cd ~/Documents/app-dev/sveltekit-nestjs-turbo
aider

# Configuration is auto-loaded from .aider.conf.yml
```

### With Any AI Assistant
Use prompt templates from `prompts/` folder:

```bash
# Example: Adding new API endpoint
cat prompts/templates.md
# Copy relevant template and fill in details
```

---

## Quick Start Prompts

### Frontend
```
Create a new page at /about that shows company info. Use TailwindCSS.
```

### Backend
```
Create POST /api/users endpoint with email/name validation and Swagger docs.
```

### Full Stack
```
Implement user profile feature:
- Frontend: Profile page with edit form
- Backend: GET/PUT /api/profile endpoints
- Use shared types from @repo/types
```

### Bug Fix
```
Fix the form validation bug in apps/web/src/routes/contact/+page.svelte
```

---

## Best Practices

### When Starting a Task
1. Read `.cursorrules` or `.clinerules` for context
2. Use prompt templates from `prompts/`
3. Reference existing patterns in codebase
4. Specify constraints (what NOT to change)

### When Reviewing AI Code
1. Check TypeScript types
2. Verify follows project patterns
3. Test locally
4. Run linter: `npm run lint`
5. Run tests: `npm run test`

### When Stuck
1. Check `prompts/quick.md` for common tasks
2. Reference `CONTRIBUTING.md` for guidelines
3. Look at existing code for patterns
4. Ask AI to explain before generating

---

## Configuration Maintenance

### Update Rules
When project structure or conventions change:
1. Update `.cursorrules`, `.clinerules`, `.windsurfrules`
2. Update `prompts/templates.md`
3. Commit changes with descriptive message

### Extend Prompts
Add new templates to `prompts/templates.md`:
1. Document the task pattern
2. Include requirements
3. Show example usage
4. Add to `prompts/quick.md` for quick reference

---

## Tips for Better AI Assistance

1. **Be Specific**
   - ❌ "Add a user page"
   - ✅ "Create /users/[id] page showing user profile with avatar, name, email, and edit button"

2. **Reference Files**
   - ❌ "Update the API"
   - ✅ "Update apps/api/src/app.controller.ts to add health check endpoint"

3. **Follow Patterns**
   - "Follow the pattern in apps/web/src/routes/about/+page.svelte"
   - "Use the same DTO structure as CreateUserDto"

4. **Set Constraints**
   - "Don't change the database schema"
   - "Keep existing API endpoints unchanged"
   - "Use only TailwindCSS, no custom CSS"

5. **Request Explanations**
   - "Explain the approach before implementing"
   - "Show me the changes you'll make first"

---

## Troubleshooting

### AI Not Following Rules
1. Check if rules file exists and is readable
2. Explicitly reference rules in your prompt: "Follow the patterns in .cursorrules"
3. Provide more specific instructions

### Inconsistent Code Style
1. Run `npm run format` to auto-format
2. Check `.editorconfig` is being respected
3. Reference specific style guide in prompt

### Wrong Dependencies
1. Specify exact package names in prompt
2. Reference `package.json` to see what's already installed
3. Ask AI to check existing deps first

---

## Additional Resources

- **CONTRIBUTING.md** - Full contribution guidelines
- **README.md** - Project overview and setup
- **QUICKSTART.md** - Fast setup guide
- **PROJECT-SUMMARY.md** - Architecture overview

---

**Remember:** AI assistants are tools. Review their output, test thoroughly, and maintain code quality standards!
