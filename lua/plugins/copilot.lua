return {
	"zbirenbaum/copilot.lua",
	lazy = true,
	config = function()
		require("copilot").setup({
			panel = {
				enabled = true,
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 75,
				keymap = {
					accept = "<M-y>",
					accept_word = false,
					accept_line = false,
					next = "<M-n>",
					prev = "<M-p>",
					dismiss = "<C-]>",
				},
			},
			filetypes = {
				help = false,
				gitcommit = false,
				gitrebase = false,
				hgcommit = false,
				svn = false,
				cvs = false,
				["."] = false,
			},
			copilot_node_command = "node", -- Node.js version must be > 18.x
			server_opts_overrides = {},
		})
	end,
}
