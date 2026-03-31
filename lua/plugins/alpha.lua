return {
	"goolord/alpha-nvim",
	dependencies = { "echasnovski/mini.icons", "nvim-lua/plenary.nvim" },
	config = function()
		local theta = require("alpha.themes.theta")
		local dashboard = require("alpha.themes.dashboard")

		-- Кнопки с актуальными маппингами
		theta.buttons.val = {
			{ type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
			{ type = "padding", val = 1 },
      dashboard.button("e", "󰝒  New file", "<cmd>ene<CR>"),
			dashboard.button(",f", "󰈞  Find file", "<cmd>Telescope find_files<CR>"),
			dashboard.button(",g", "󰊄  Live grep", "<cmd>Telescope live_grep<CR>"),
			dashboard.button(",b", "󰮗  Buffers", "<cmd>Telescope buffers<CR>"),
			dashboard.button("c", "󰢻  Configuration", "<cmd>cd ~/.config/nvim | Telescope find_files<CR>"),
			dashboard.button("q", "󰅚  Quit", "<cmd>qa<CR>"),
		}

		require("alpha").setup(theta.config)
	end,
}
