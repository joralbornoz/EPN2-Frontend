# 💻 EPN2 - Frontend (React + Nginx)

Este repositorio contiene la interfaz de usuario para el sistema de gestión de ventas y despachos. La aplicación está construida con **React** y optimizada para producción utilizando **Nginx**.

## 🚀 Características Principales
* **Framework:** React 18 con Vite.
* **Estilos:** Tailwind CSS / CSS Modules.
* **Comunicación:** Axios con configuración de rutas relativas para integración mediante Proxy.
* **Servidor de Producción:** Nginx configurado para manejo de Single Page Application (SPA).

## 🐳 Contenedorización (IE1)
Se utiliza un **Dockerfile Multi-stage** para optimizar el peso de la imagen y la seguridad:
1. **Stage 1 (Build):** Entorno Node.js para compilar y minificar el código fuente.
2. **Stage 2 (Production):** Servidor Nginx estable-alpine que sirve solo los archivos estáticos generados.

## 🔗 Integración y Proxy (IE7)
Para evitar problemas de CORS y facilitar la comunicación en AWS, el servidor Nginx actúa como **Proxy Inverso**:
* Las peticiones a `/api/v1/despachos` se redirigen internamente al microservicio correspondiente en el puerto 8080.
* Las peticiones a `/api/v1/ventas` se redirigen al puerto 8081.

## 🛠️ Instalación Local
1. Instalar dependencias: `npm install`
2. Ejecutar en modo desarrollo: `npm run dev`
3. Construir para producción: `npm run build`

---
> **Nota:** Este repositorio requiere del [Repositorio de Backend](https://github.com/joralbornoz/EPN2-Backend) para funcionar correctamente en un entorno de producción.