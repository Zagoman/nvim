local plugins = {
	{ import = "plugins.init" },
	{ import = "plugins.catppuccin" },
	{ import = "plugins.oil" },
	{ import = "plugins.treesitter" },
	{ import = "plugins.mason" },
	{ import = "plugins.debug-dap" },
	{ import = "plugins.snacks-nvim" },
	{ import = "plugins.tmux-nvim" },
	{ import = "plugins.blink-cmp" },
	{ import = "plugins.trouble" },
	{ import = "plugins.easy-dotnet" },
	{ import = "plugins.roslyn" },
	{ import = "plugins.gopher" },
	{ import = "plugins.overseer" },
	{ import = "plugins.conform" },
	{ import = "plugins.which-key" },
	{ import = "plugins.grug-far" },
	{ import = "plugins.nvim-lspconfig" },
}

require("lazy").setup(plugins)
