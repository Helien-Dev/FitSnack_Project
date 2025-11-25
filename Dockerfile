# Dockerfile para FitSnack Project - Astro

# Stage 1: Build
FROM node:20-alpine AS builder

WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Production - Servir el build estático
FROM node:20-alpine AS runner

WORKDIR /app

# Instalar un servidor estático simple
RUN npm install -g serve

# Copiar SOLO los archivos construidos
COPY --from=builder /app/dist ./dist

EXPOSE 4321

# Servir el build estático
CMD ["serve", "-s", "dist", "-l", "4321"]