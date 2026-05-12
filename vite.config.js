import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react-swc'

export default defineConfig({
  plugins: [react()],
  server: {
    proxy: {
      // Configuración para Despachos (Puerto 8080)
      '/api/v1/despachos': {
        target: 'http://100.26.205.247:8080',
        changeOrigin: true,
        secure: false,
      },
      // Configuración para Ventas (Puerto 8081)
      '/api/v1/ventas': {
        target: 'http://100.26.205.247:8081',
        changeOrigin: true,
        secure: false,
      }
    }
  }
})