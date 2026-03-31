return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"williamboman/mason.nvim",
			lazy = false,
			opts = {
				ui = {
					icons = {
						package_pending = " ",
						package_installed = " ",
						package_uninstalled = " ",
					},
				},
			},
			config = true,
		},

		{
			"mason-org/mason-lspconfig.nvim",
			opts = {
				ensure_installed = { "ruff", "pyright", "lua_ls", "ts_ls", "html", "protols" },
			},
		},
	},
}
