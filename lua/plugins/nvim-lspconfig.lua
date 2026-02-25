return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		"saghen/blink.cmp",
	},
	config = function()
		local mason_lspconfig = require("mason-lspconfig")
		local blink_cmp = require("blink.cmp")

		-- 1. Server-specific configs (only vtsls, gopls, lua_ls)
		local servers = {
			vtsls = {
				filetypes = {
					"javascript",
					"javascriptreact",
					"javascript.jsx",
					"typescript",
					"typescriptreact",
					"typescript.tsx",
				},
				settings = {
					complete_function_calls = false,
					vtsls = {
						enableMoveToFileCodeAction = true,
						autoUseWorkspaceTsdk = true,
						experimental = {
							maxInlayHintLength = 30,
							completion = {
								enableServerSideFuzzyMatch = true,
							},
						},
					},
					typescript = {
						updateImportsOnFileMove = { enabled = "always" },
						suggest = {
							completeFunctionCalls = false,
						},
						inlayHints = {
							enumMemberValues = { enabled = true },
							functionLikeReturnTypes = { enabled = true },
							parameterNames = { enabled = "literals" },
							parameterTypes = { enabled = true },
							propertyDeclarationTypes = { enabled = true },
							variableTypes = { enabled = false },
						},
					},
				},
			},

			gopls = {
				settings = {
					gopls = {
						gofumpt = true,
						codelenses = {
							gc_details = false,
							generate = true,
							regenerate_cgo = true,
							run_govulncheck = true,
							test = true,
							tidy = true,
							upgrade_dependency = true,
							vendor = true,
						},
						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							compositeLiteralTypes = true,
							constantValues = true,
							functionTypeParameters = true,
							parameterNames = true,
							rangeVariableTypes = true,
						},
						analyses = {
							nilness = true,
							unusedparams = true,
							unusedwrite = true,
							useany = true,
						},
						usePlaceholders = true,
						completeUnimported = true,
						staticcheck = true,
						directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
						semanticTokens = true,
					},
				},
			},

			lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
							-- Make the language server recognize "vim" global
							globals = { "vim" },
						},
						completion = {
							callSnippet = "Replace",
						},
						hint = {
							enable = true,
						},
						workspace = {
							checkThirdParty = false,
						},
					},
				},
			},
		}

		-- 2. Capabilities from blink.cmp
		local capabilities = blink_cmp.get_lsp_capabilities(nil, true)

		-- 3. Configure servers + collect names for Mason
		local ensure_installed_servers = {}
		for server_name, config in pairs(servers) do
			if config ~= false then
				config.capabilities = vim.tbl_deep_extend("force", {}, capabilities, config.capabilities or {})
				vim.lsp.config(server_name, config)
				table.insert(ensure_installed_servers, server_name)
			end
		end

		-- 4. Setup Mason-LSPconfig
		mason_lspconfig.setup({
			ensure_installed = ensure_installed_servers,
			automatic_enable = true,
		})

		-- 5. Diagnostics (same style as your modern config)
		local signs = { Error = " ", Warn = " ", Hint = "💡", Info = " " }
		vim.fn.sign_define("DiagnosticSignError", { text = signs.Error, texthl = "DiagnosticSignError" })
		vim.fn.sign_define("DiagnosticSignWarn", { text = signs.Warn, texthl = "DiagnosticSignWarn" })
		vim.fn.sign_define("DiagnosticSignInfo", { text = signs.Info, texthl = "DiagnosticSignInfo" })
		vim.fn.sign_define("DiagnosticSignHint", { text = signs.Hint, texthl = "DiagnosticSignHint" })

		vim.diagnostic.config({
			virtual_text = {
				severity = { min = vim.diagnostic.severity.WARN },
				source = "if_many",
				spacing = 4,
				prefix = "●",
			},
			virtual_lines = false,
			signs = { active = signs },
			update_in_insert = false,
			underline = true,
			severity_sort = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "if_many",
				header = "",
				prefix = "",
			},
		})

		vim.lsp.set_log_level("off")
	end,
}
