local plugins = {
  { import = "plugins.catppuccin" },
  { import = "plugins.treesitter" },
  { import = "plugins.mason" },
  { import = "plugins.snacks-nvim"},
  { import = "plugins.blink-cmp"},
  { import = "plugins.nvim-lspconfig.lua"},
}

require("lazy").setup(plugins) 
