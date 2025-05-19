return {
	"williamboman/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
			registries = {
				"github:mason-org/mason-registry",
				"github:Crashdummyy/mason-registry",
			},
		})
		mason_tool_installer.setup({
			ensure_installed = {
				-------- LIST OF FORMATTERS/DEBUGGERS/LINTERS TO INSTALL -------------
				"stylua",
				-- JSON stuff
				"jsonlint",
				"jq",
				-- YAML stuff
				"yamllint",
				"prettierd",
				-- eslint
				"eslint_d",
				"gotests",
				"gomodifytags",
				"goimports",
				"go-debug-adapter",
				"csharpier",
				------- LANGUAGE SERVERS ----------
				"gopls",
				"bash-language-server",
				"css-lsp",
				"docker-compose-language-service",
				"dockerfile-language-server",
				"dot-language-server",
				"html-lsp",
				"json-lsp",
				"lua-language-server",
				"tailwindcss-language-server",
				"vtsls",
				"yaml-language-server",
			},
			auto_update = true,
			run_on_start = true,
		})
	end,
}
