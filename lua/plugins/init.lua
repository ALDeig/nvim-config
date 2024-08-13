return {
  ------------------------------ COLORTHEMES AND DECOR ------------------------------
  { "catppuccin/nvim", lazy = false, name = "catppuccin", priority = 1000 },

  ------------------------------ WORK WITH FILES ------------------------------
  {
    "Pocco81/auto-save.nvim",
    lazy = false,
    -- event = "BufWritePost",
    opts = {},
  },

  ------------------------------ TEXT FORMATTING ------------------------------
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },
  {
    "mbbill/undotree",
    keys = { { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undotree Toggle Change History" } },
  },
  ------------------------------ LSP ------------------------------
  {
    "stevearc/dressing.nvim",
    opts = {},
  },
  ------------------------------ GIT ------------------------------
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    opts = {},
    keys = {
      { "<leader>gf", "<cmd>DiffviewFileHistory<CR>", mode = "n", desc = "Git File History" },
      { "<leader>gc", "<cmd>DiffviewOpen HEAD~1<CR>", mode = "n", desc = "Git Last Commit" },
      { "<leader>gt", "<cmd>DiffviewToggleFile<CR>", mode = "n", desc = "Git File History" },
    },
  },
}
