# ETAPA 1: Construcción (Node)
FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# ETAPA 2: Servidor de Producción (Nginx)
FROM nginx:stable-alpine

# RÚBRICA IE1: Limpieza y permisos
# Borramos la configuración por defecto de Nginx
RUN rm /etc/nginx/conf.d/default.conf

# Copiamos nuestra configuración profesional (IE7 - Integración)
COPY default.conf /etc/nginx/conf.d/default.conf

# Copiamos los archivos construidos de React
COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]