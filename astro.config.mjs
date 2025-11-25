// @ts-check
import { defineConfig } from 'astro/config';

// https://astro.build/config
export default defineConfig({
  preview: {
    host: true, // Permite cualquier host
    port: 4321
  },
  server: {
    host: true, // Permite cualquier host
    port: 4321
  }
});
