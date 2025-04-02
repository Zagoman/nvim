return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
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
					accept = false,
					accept_word = false,
					accept_line = "<Tab>",
					next = false,
					prev = false,
					dismiss = false,
				},
			},
			filetypes = {
				yaml = false,
				markdown = false,
				help = false,
				gitcommit = false,
				gitrebase = false,
				hgcommit = false,
				svn = false,
				cvs = false,
				["."] = false,
				["*"] = true,
			},
			copilot_node_command = "node",
		})
	end,
}
