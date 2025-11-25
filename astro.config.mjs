// @ts-check
import { defineConfig } from 'astro/config';

// https://astro.build/config
export default defineConfig({
  security: {
    // Example: Allow any subdomain of example.com on https
    allowedDomains: [
      {
        hostname: '**.alvaroavila.dev',
        protocol: 'https'
      }
    ]
  }
});
