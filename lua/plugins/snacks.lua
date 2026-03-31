return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@diagnostic disable-next-line: undefined-doc-name
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		-- bigfile = { enabled = true },
		-- dashboard = { enabled = true },
		explorer = { enabled = true },
		-- indent = { enabled = true },
		input = {},
		picker = {},
		notifier = {},
		terminal = {},
		-- quickfile = { enabled = true },
		-- scope = { enabled = true },
		-- scroll = { enabled = true },
		-- statuscolumn = { enabled = true },
		-- words = { enabled = true },
	},
	keys = {
		{
			"<leader>e",
			function()
				-- ---@param opts? snacks.picker.explorer.Config|{}
				-- Snacks.explorer.open(opts)
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},
		{
			"<leader>tg",
			function()
				Snacks.terminal.toggle()
			end,
			desc = "Toggle Float Terminal",
		},
		{
			"<leader>tv",
			function()
				Snacks.terminal.toggle(nil, { win = { position = "right" } })
			end,
			desc = "Toggle Split Terminal",
		},
	},
}
