#!/bin/bash

# Starter Kit - Setup Verification Script
# Run this after initial installation to verify everything is configured correctly

echo "🔍 Starter Kit - Setup Verification"
echo "===================================="
echo ""

# Color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check Node.js version
echo "📦 Checking Node.js version..."
NODE_VERSION=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -ge 20 ]; then
    echo -e "${GREEN}✓${NC} Node.js $(node -v) is installed (>= 20 required)"
else
    echo -e "${RED}✗${NC} Node.js >= 20 is required (found $(node -v))"
    exit 1
fi

# Check npm
echo "📦 Checking npm..."
if command -v npm &> /dev/null; then
    echo -e "${GREEN}✓${NC} npm $(npm -v) is installed"
else
    echo -e "${RED}✗${NC} npm is not installed"
    exit 1
fi

# Check Docker
echo "🐳 Checking Docker..."
if command -v docker &> /dev/null; then
    echo -e "${GREEN}✓${NC} Docker $(docker -v | cut -d' ' -f3 | cut -d',' -f1) is installed"
else
    echo -e "${YELLOW}⚠${NC} Docker is not installed (optional for development)"
fi

# Check docker-compose
echo "🐳 Checking docker-compose..."
if command -v docker-compose &> /dev/null; then
    echo -e "${GREEN}✓${NC} docker-compose is installed"
else
    echo -e "${YELLOW}⚠${NC} docker-compose is not installed (optional for development)"
fi

# Check project structure
echo ""
echo "📁 Checking project structure..."
REQUIRED_DIRS=("apps/web" "apps/api" "packages/types" "packages/config")
for dir in "${REQUIRED_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        echo -e "${GREEN}✓${NC} $dir exists"
    else
        echo -e "${RED}✗${NC} $dir is missing"
        exit 1
    fi
done

# Check package.json files
echo ""
echo "📄 Checking package.json files..."
REQUIRED_PKGS=("package.json" "apps/web/package.json" "apps/api/package.json" "packages/types/package.json")
for pkg in "${REQUIRED_PKGS[@]}"; do
    if [ -f "$pkg" ]; then
        echo -e "${GREEN}✓${NC} $pkg exists"
    else
        echo -e "${RED}✗${NC} $pkg is missing"
        exit 1
    fi
done

# Check node_modules
echo ""
echo "📦 Checking dependencies..."
if [ -d "node_modules" ]; then
    echo -e "${GREEN}✓${NC} Root node_modules installed"
else
    echo -e "${YELLOW}⚠${NC} Root node_modules not found - run 'npm install'"
fi

# Check config files
echo ""
echo "⚙️ Checking configuration files..."
CONFIG_FILES=("turbo.json" "docker-compose.yml" "docker-compose.dev.yml" ".gitignore")
for file in "${CONFIG_FILES[@]}"; do
    if [ -f "$file" ]; then
        echo -e "${GREEN}✓${NC} $file exists"
    else
        echo -e "${RED}✗${NC} $file is missing"
    fi
done

# Check environment files
echo ""
echo "🔐 Checking environment files..."
if [ -f "apps/api/.env" ]; then
    echo -e "${GREEN}✓${NC} apps/api/.env exists"
else
    echo -e "${YELLOW}⚠${NC} apps/api/.env not found"
    if [ -f "apps/api/.env.example" ]; then
        echo -e "   ${YELLOW}→${NC} Run: cp apps/api/.env.example apps/api/.env"
    fi
fi

# Port availability check
echo ""
echo "🔌 Checking port availability..."
PORTS=(3000 3001 5432 6379)
PORT_NAMES=("Frontend" "Backend API" "PostgreSQL" "Redis")
for i in "${!PORTS[@]}"; do
    if lsof -Pi :${PORTS[$i]} -sTCP:LISTEN -t >/dev/null 2>&1; then
        echo -e "${YELLOW}⚠${NC} Port ${PORTS[$i]} (${PORT_NAMES[$i]}) is already in use"
    else
        echo -e "${GREEN}✓${NC} Port ${PORTS[$i]} (${PORT_NAMES[$i]}) is available"
    fi
done

# Summary
echo ""
echo "===================================="
echo "✨ Verification Complete!"
echo ""
echo "Next steps:"
echo "1. Copy environment file: cp apps/api/.env.example apps/api/.env"
echo "2. Start databases: docker-compose -f docker-compose.dev.yml up -d"
echo "3. Start dev servers: npm run dev"
echo ""
echo "Visit http://localhost:3000 for frontend"
echo "Visit http://localhost:3001/api/docs for API docs"
echo ""
echo "📚 Read QUICKSTART.md for detailed instructions"
