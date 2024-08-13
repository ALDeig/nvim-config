return {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = function()
            local options = {
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    }
                },
            }
            require("telescope").load_extension("fzf")
            return options
        end,
        keys = {
            { ",f", "<cmd>Telescope find_files<CR>", desc = "Telescope Find files" },
            { ",g", "<cmd>Telescope live_grep<CR>", desc = "Telescope Live grep" },
            { ",b", "<cmd>Telescope buffers<CR>", desc = "Telescope Find buffers" },
            { ",m", "<cmd>Telescope git_commits<CR>", desc = "Telescope Git commits" },
            { ",z", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Telescope Find in current buffer" },
            { ",s", "<cmd>Telescope git_status<CR>", desc = "Telescope Git status" }
        }
    },
}
