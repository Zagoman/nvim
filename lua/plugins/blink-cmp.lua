return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	-- optional: provides snippets for the snippet source
	dependencies = {
		"rafamadriz/friendly-snippets",
		{
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	version = "*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "none",
			["<C-y>"] = { "select_and_accept" },
			["<C-e>"] = { "hide", "fallback" },
			["<C-p>"] = { "select_prev", "fallback" },
			["<C-n>"] = { "select_next", "fallback" },
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
		},
		signature = { enabled = true },
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- make lazydev completions top priority (see `:h blink.cmp`)
					score_offset = 100,
				},
			},
		},
	},
	opts_extend = { "sources.default" },
}
