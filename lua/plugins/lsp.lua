return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "hrsh7th/nvim-cmp" },
		-- { 'neovim/nvim-lspconfig'}
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-cmdline" },

		-- " For vsnip users.
		-- Plug 'hrsh7th/cmp-vsnip'
		-- Plug 'hrsh7th/vim-vsnip'

		-- " For luasnip users.
		-- { "L3MON4D3/LuaSnip" },
		{
			"L3MON4D3/LuaSnip",
			-- follow latest release.
			version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			-- install jsregexp (optional!).
			build = "make install_jsregexp",
		},
		{ "saadparwaiz1/cmp_luasnip" },
		{
			"williamboman/mason.nvim",
			lazy = false,
			opts = {
				ui = {
					icons = {
						package_pending = " ",
						package_installed = " ",
						package_uninstalled = " ",
					},
				},
			},
			config = true,
		},

		{ "mason-org/mason-lspconfig.nvim" },
	},
}
