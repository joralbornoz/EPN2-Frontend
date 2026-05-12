# ETAPA 1: Construcción (Node)
FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# ETAPA 2: Servidor de Producción (Nginx)
FROM nginx:stable-alpine
# RÚBRICA: Uso de Nginx para mejor rendimiento que el modo dev
COPY --from=build /app/dist /usr/share/nginx/html

# Configuración para que las rutas de React (SPA) funcionen en Nginx
RUN echo 'server { listen 80; location / { root /usr/share/nginx/html; index index.html; try_files $uri $uri/ /index.html; } }' > /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]