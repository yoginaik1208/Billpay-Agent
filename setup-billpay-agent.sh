#!/bin/bash

echo "🚀 Setting up Bill Pay Agent with PSE Integration..."

# Create directory structure
mkdir -p frontend/src/{components,pages,contexts,utils}
mkdir -p backend/src/{routes,models,middleware,services,utils,database}
mkdir -p .github/workflows
mkdir -p docker
mkdir -p docs

# Create package.json files
cat > package.json << 'EOF'
{
  "name": "billpay-agent-pse",
  "version": "1.0.0",
  "description": "Comprehensive bill tracking and payment agent with PSE integration",
  "main": "index.js",
  "scripts": {
    "dev": "concurrently \"npm run backend:dev\" \"npm run frontend:dev\"",
    "backend:dev": "cd backend && npm run dev",
    "frontend:dev": "cd frontend && npm run dev",
    "build": "npm run frontend:build && npm run backend:build",
    "frontend:build": "cd frontend && npm run build",
    "backend:build": "cd backend && npm run build",
    "start": "cd backend && npm start",
    "install:all": "npm install && cd frontend && npm install && cd ../backend && npm install",
    "lint": "eslint . --ext .ts,.tsx --fix",
    "format": "prettier --write \"**/*.{ts,tsx,js,jsx,json,md}\"",
    "docker:build": "docker-compose build",
    "docker:up": "docker-compose up -d",
    "docker:down": "docker-compose down",
    "test": "cd backend && npm test && cd ../frontend && npm test"
  },
  "keywords": ["bill-tracking", "pse-integration", "payment-agent", "stripe", "email-notifications"],
  "author": "Yogi Naik",
  "license": "MIT",
  "devDependencies": {
    "concurrently": "^8.2.0",
    "@typescript-eslint/eslint-plugin": "^6.0.0",
    "@typescript-eslint/parser": "^6.0.0",
    "eslint": "^8.45.0",
    "prettier": "^3.0.0"
  }
}
EOF

echo "✅ Created root package.json"

# Create frontend package.json
cat > frontend/package.json << 'EOF'
{
  "name": "billpay-agent-frontend",
  "private": true,
  "version": "1.0.0",
  "type": "module",
  "scripts": {
    "dev": "vite --port 3000",
    "build": "tsc && vite build",
    "preview": "vite preview",
    "lint": "eslint . --ext ts,tsx --report-unused-disable-directives --max-warnings 0",
    "test": "vitest"
  },
  "dependencies": {
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "react-router-dom": "^6.14.2",
    "axios": "^1.4.0",
    "react-query": "^3.39.3",
    "react-hook-form": "^7.45.2",
    "@stripe/stripe-js": "^2.1.0",
    "@stripe/react-stripe-js": "^2.1.0",
    "date-fns": "^2.30.0",
    "lucide-react": "^0.263.1",
    "framer-motion": "^10.16.0",
    "react-hot-toast": "^2.4.1",
    "@hookform/resolvers": "^3.3.0",
    "zod": "^3.22.0"
  },
  "devDependencies": {
    "@types/react": "^18.2.15",
    "@types/react-dom": "^18.2.7",
    "@typescript-eslint/eslint-plugin": "^6.0.0",
    "@typescript-eslint/parser": "^6.0.0",
    "@vitejs/plugin-react": "^4.0.3",
    "autoprefixer": "^10.4.14",
    "eslint": "^8.45.0",
    "eslint-plugin-react-hooks": "^4.6.0",
    "eslint-plugin-react-refresh": "^0.4.3",
    "postcss": "^8.4.27",
    "tailwindcss": "^3.3.3",
    "typescript": "^5.0.2",
    "vite": "^4.4.5",
    "vitest": "^0.34.0"
  }
}
EOF

echo "✅ Created frontend package.json"

# Create backend package.json
cat > backend/package.json << 'EOF'
{
  "name": "billpay-agent-backend",
  "version": "1.0.0",
  "description": "Backend API for Bill Pay Agent with PSE integration",
  "main": "dist/server.js",
  "scripts": {
    "dev": "ts-node-dev --respawn --transpile-only src/server.ts",
    "build": "tsc",
    "start": "node dist/server.js",
    "migrate": "ts-node src/database/migrations.ts",
    "seed": "ts-node src/database/seed.ts",
    "test": "jest",
    "docker:build": "docker build -t billpay-backend .",
    "docker:run": "docker run -p 5000:5000 billpay-backend"
  },
  "dependencies": {
    "express": "^4.18.2",
    "cors": "^2.8.5",
    "helmet": "^7.0.0",
    "morgan": "^1.10.0",
    "dotenv": "^16.3.1",
    "bcryptjs": "^2.4.3",
    "jsonwebtoken": "^9.0.2",
    "nodemailer": "^6.9.4",
    "stripe": "^12.18.0",
    "sqlite3": "^5.1.6",
    "pg": "^8.11.2",
    "joi": "^17.9.2",
    "express-rate-limit": "^6.10.0",
    "winston": "^3.10.0",
    "axios": "^1.4.0",
    "cheerio": "^1.0.0-rc.12",
    "puppeteer": "^21.1.0"
  },
  "devDependencies": {
    "@types/express": "^4.17.17",
    "@types/cors": "^2.8.13",
    "@types/morgan": "^1.9.4",
    "@types/bcryptjs": "^2.4.2",
    "@types/jsonwebtoken": "^9.0.2",
    "@types/nodemailer": "^6.4.9",
    "@types/node": "^20.4.5",
    "@types/pg": "^8.10.2",
    "typescript": "^5.1.6",
    "ts-node": "^10.9.1",
    "ts-node-dev": "^2.0.0",
    "jest": "^29.6.2",
    "@types/jest": "^29.5.3"
  }
}
EOF

echo "✅ Created backend package.json"

echo "🎉 Bill Pay Agent setup complete!"
echo "📁 Directory structure created"
echo "📦 Package.json files generated"
echo "🔄 Next steps:"
echo "   1. Run: npm run install:all"
echo "   2. Copy backend/.env.example to backend/.env"
echo "   3. Configure your environment variables"
echo "   4. Run: npm run dev"

echo "✨ Ready for PSE integration and payment processing!"