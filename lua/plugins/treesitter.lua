return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
		"nvim-treesitter/nvim-treesitter-textobjects",
		{ "nushell/tree-sitter-nu", build = ":TSUpdate nu" },
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true,
			},
			indent = { enable = true },
			autotag = {
				enable = true,
			},
			ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
			auto_install = true,
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<Leader>ss",
					node_incremental = "<Leader>si",
					scope_incremental = "<Leader>sc",
					node_decremental = "<Leader>sd",
				},
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
					},
				},
				-- move = {
				-- 	enable = true,
				-- 	set_jumps = true,
				-- 	goto_next_start = {
				-- 		["]]"] = "@function.outer",
				-- 		["]["] = "@class.outer",
				-- 	},
				-- 	goto_next_end = {
				-- 		["[]"] = "@function.outer",
				-- 		["[["] = "@class.outer",
				-- 	},
				-- 	goto_previous_start = {
				-- 		["[["] = "@function.outer",
				-- 		["[]"] = "@class.outer",
				-- 	},
				-- 	goto_previous_end = {
				-- 		["]]"] = "@function.outer",
				-- 		["]["] = "@class.outer",
				-- 	},
				-- },
			},
		})
	end,
}
