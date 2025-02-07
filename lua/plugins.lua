local plugins = {
  { import = "plugins.catppuccin" },
  { import = "plugins.treesitter" },
  { import = "plugins.mason" },
}

require("lazy").setup(plugins) 
