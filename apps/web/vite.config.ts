import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig } from 'vite';

export default defineConfig({
	plugins: [sveltekit()],
	server: {
		port: 3000,
		host: '0.0.0.0',
		hmr: {
			clientPort: 443
		},
		strictPort: false,
		allowedHosts: [
			'localhost',
			'christ-coral-london-surrey.trycloudflare.com',
			'.trycloudflare.com'
		]
	},
	preview: {
		host: '0.0.0.0',
		port: 3000,
		strictPort: false
	}
});
