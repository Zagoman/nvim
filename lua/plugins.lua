local plugins = {
	{ import = "plugins.catppuccin" },
	{ import = "plugins.treesitter" },
	{ import = "plugins.mason" },
	{ import = "plugins.snacks-nvim" },
	{ import = "plugins.blink-cmp" },
	{ import = "plugins.harpoon" },
	{ import = "plugins.roslyn" },
	{ import = "plugins.overseer" },
	{ import = "plugins.conform" },
	{ import = "plugins.nvim-lspconfig" },
}

require("lazy").setup(plugins)
