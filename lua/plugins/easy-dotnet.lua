return {
	"GustavEikaas/easy-dotnet.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	config = function()
		local dotnet = require("easy-dotnet")
		dotnet.setup({
			lsp = {
				enabled = true, -- Enable builtin roslyn lsp
				preload_roslyn = true,
				config = {
					settings = {
						["csharp|background_analysis"] = {
							dotnet_compiler_diagnostics_scope = "fullSolution",
						},
						["csharp|inlay_hints"] = {
							csharp_enable_inlay_hints_for_implicit_object_creation = true,
						},
						["csharp|code_lens"] = {
							dotnet_enable_references_code_lens = false,
						},
						fileExcludes = {
							"**/Migrations/**",
						},
					},
				},
				picker = "telescope",
			},
		})
	end,
}
