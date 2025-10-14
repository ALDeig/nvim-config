return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  opts = {
    close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
    source_selector = {
      winbar = false,
      statusline = false,
    },
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
}
