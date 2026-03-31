return {
	{
		"nvim-telescope/telescope.nvim",
		-- tag = "*",
		-- or                              , branch = '0.1.x'
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",

		config = function()
			local options = {
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			}
			require("telescope").setup(options)
			require("telescope").load_extension("fzf")
		end,
	},
}
