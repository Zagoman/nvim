return {
	"zbirenbaum/copilot.lua",
	lazy = false,
	dependency = { "copilotlsp-nvim/copilot-lsp" },
	config = function()
		require("copilot").setup({
			panel = {
				enabled = true,
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 100,
				keymap = {
					accept = "<M-y>",
					accept_word = false,
					accept_line = false,
					next = "<M-n>",
					prev = "<M-p>",
					dismiss = "<M-q>",
				},
			},
			filetypes = {
				help = false,
				gitcommit = false,
				gitrebase = false,
				hgcommit = false,
				svn = false,
				cvs = false,
				terraform = false, -- disallow specific filetype
				json = false, -- disallow specific filetype
				jsonc = false, -- disallow specific filetype
				[".env"] = false, -- disallow specific filetype
				[".env.*"] = false, -- disallow specific filetype
				sh = function()
					if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.env.*") then
						-- disable for .env files
						return false
					end
					return true
				end,
			},
			copilot_node_command = "node", -- Node.js version must be > 18.x
			server_opts_overrides = {},
		})
	end,
}
