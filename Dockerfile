# Etapa 1: Build (Construcción)
FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Etapa 2: Producción con Nginx
FROM nginx:alpine
# RÚBRICA IE6: Limpieza de archivos por defecto para optimizar capas
RUN rm -rf /usr/share/nginx/html/*
# Copiamos solo lo necesario desde la etapa anterior
COPY --from=build /app/dist /usr/share/nginx/html
# Exponemos el puerto que usará la EC2
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]