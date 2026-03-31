return {
	{
		"echasnovski/mini.indentscope",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		lazy = false,
		-- event = "VeryLazy",
		opts = {
			-- symbol = "▏",
			-- symbol = "│",
			symbol = "┊",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"alpha",
					"dashboard",
					"fzf",
					"help",
					"lazy",
					"lazyterm",
					"mason",
					"notify",
					"toggleterm",
					"Trouble",
					"trouble",
					"terminal",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
			vim.api.nvim_create_autocmd("TermOpen", {
				pattern = "*",
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		lazy = false,
		main = "ibl",
		opts = {
			indent = {
				highlight = { "CursorColumn", "Whitespace" },
				char = "┊",
				-- char = "│",
				-- tab_char = { "a", "b", "c" },
				-- highlight = { "Function", "Label" },
				smart_indent_cap = true,
			},
			scope = {
				enabled = false,
				show_end = false,
				show_exact_scope = true,
			},
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"terminal",
				},
				callback = function()
					require("ibl").setup_buffer(0, { enabled = false })
				end,
			})
		end,
	},
}
