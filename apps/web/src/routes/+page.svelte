<script lang="ts">
	let count = 0;

	function increment() {
		count += 1;
	}
</script>

<svelte:head>
	<title>SvelteKit-NestJS-Turbo</title>
	<meta name="description" content="Production-ready full-stack boilerplate" />
</svelte:head>

<div class="min-h-screen flex items-center justify-center bg-gradient-to-br from-blue-50 to-indigo-100 dark:from-gray-900 dark:to-gray-800">
	<div class="text-center space-y-8 p-8">
		<div class="space-y-4">
			<h1 class="text-6xl font-bold bg-gradient-to-r from-blue-600 to-indigo-600 bg-clip-text text-transparent">
				Welcome to SvelteKit-NestJS-Turbo
			</h1>
			<p class="text-xl text-gray-600 dark:text-gray-300">
				Production-ready boilerplate with SvelteKit, NestJS, TypeORM & PostgreSQL
			</p>
		</div>

		<div class="flex flex-col items-center space-y-4">
			<div class="bg-white dark:bg-gray-800 rounded-lg shadow-lg p-8 space-y-4">
				<p class="text-4xl font-bold text-gray-800 dark:text-white">{count}</p>
				<button
					on:click={increment}
					class="px-6 py-3 bg-blue-600 hover:bg-blue-700 text-white font-semibold rounded-lg shadow-md transition-colors duration-200"
				>
					Increment
				</button>
			</div>

			<div class="grid grid-cols-2 gap-4 mt-8">
				<a
					href="http://localhost:3001/api/docs"
					target="_blank"
					class="px-6 py-3 bg-white dark:bg-gray-800 hover:bg-gray-50 dark:hover:bg-gray-700 text-gray-800 dark:text-white font-medium rounded-lg shadow-md transition-colors duration-200"
				>
					📚 API Docs
				</a>
				<a
					href="https://kit.svelte.dev"
					target="_blank"
					class="px-6 py-3 bg-white dark:bg-gray-800 hover:bg-gray-50 dark:hover:bg-gray-700 text-gray-800 dark:text-white font-medium rounded-lg shadow-md transition-colors duration-200"
				>
					📖 SvelteKit Docs
				</a>
			</div>
		</div>

		<div class="text-sm text-gray-500 dark:text-gray-400 space-y-2">
			<p>Stack: SvelteKit + NestJS + TypeORM + PostgreSQL + TailwindCSS</p>
			<p>Monorepo powered by Turborepo</p>
		</div>
	</div>
</div>
