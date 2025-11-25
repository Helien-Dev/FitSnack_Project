// @ts-check
import { defineConfig } from 'astro/config';

// https://astro.build/config
export default defineConfig({
  output: 'static',
  vite: {
    preview: {
      allowedHosts: true
    }
  },
  site: 'https://fitsnack.alvaroavila.dev/'
});
