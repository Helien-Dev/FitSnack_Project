# Dockerfile para FitSnack Project - Astro

# Stage 1: Build
FROM node:20-alpine AS builder

# Establecer directorio de trabajo
WORKDIR /app

# Copiar archivos de dependencias
COPY package.json package-lock.json ./

# Instalar dependencias
RUN npm ci

# Copiar el resto de los archivos del proyecto
COPY . .

# Construir la aplicación
RUN npm run build

# Stage 2: Production
FROM node:20-alpine AS runner

WORKDIR /app

# Copiar solo los archivos necesarios para producción
COPY package.json package-lock.json ./
RUN npm ci --only=production

# Copiar los archivos construidos desde el stage de build
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/public ./public

# Exponer el puerto (Astro preview usa 4321 por defecto)
EXPOSE 4321

# Comando para servir la aplicación
CMD ["npx", "astro", "preview", "--host", "0.0.0.0", "--port", "4321"]

