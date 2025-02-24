local plugins = {
	{ import = "plugins.init" },
	{ import = "plugins.catppuccin" },
	{ import = "plugins.treesitter" },
	{ import = "plugins.mason" },
	{ import = "plugins.snacks-nvim" },
	{ import = "plugins.tmux-nvim" },
	{ import = "plugins.blink-cmp" },
	{ import = "plugins.harpoon" },
	{ import = "plugins.roslyn" },
	{ import = "plugins.rainbow-delimiters" },
	{ import = "plugins.overseer" },
	{ import = "plugins.conform" },
	{ import = "plugins.mini-pairs" },
	{ import = "plugins.which-key" },
	{ import = "plugins.grug-far" },
	{ import = "plugins.nvim-lspconfig" },
}

require("lazy").setup(plugins)
