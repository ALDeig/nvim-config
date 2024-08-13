return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  lazy = false,
  keys = {
    { "<C-n>", "<cmd>Neotree toggle<CR>", mode = "n", desc = "Neotree Toggle tree" },
    { "<leader>e", "<cmd>Neotree reveal<CR>", mode = "n", desc = "Neotree Focus on Neotree" },
    { "<leader>B", "<cmd>Neotree toggle float buffers<cr>", mode = "n", desc = "Neotree Show buffers" },
    { "<leader>s", "<cmd>Neotree float git_status<cr>", mode = "n", desc = "Neotree Show git status files" },
  },

  opts = {
    close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
    window = {
      mappings = {
        ["O"] = {
          command = function(state)
            local filepath = state.tree:get_node().path
            vim.ui.open(filepath)
          end,
          desc = "open_with_system_default",
        },
      },
    },
  },
  -- config = function()
  -- 	require("neotree").setup()
  -- end,
}
