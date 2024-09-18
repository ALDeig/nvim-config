return {
  ------------------------------ COLORTHEMES AND DECOR ------------------------------
  { "catppuccin/nvim", lazy = false, name = "catppuccin", priority = 1000 },
  -- lazy.nvim
  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     lsp = {
  --       -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
  --       override = {
  --         ["vim.lsp.buf.code_action"] = false,
  --         ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
  --         ["vim.lsp.util.stylize_markdown"] = true,
  --         ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
  --       },
  --     },
  --     popupmenu = { enabled = false },
  --     -- you can enable a preset for easier configuration
  --     presets = {
  --       bottom_search = true, -- use a classic bottom cmdline for search
  --       command_palette = true, -- position the cmdline and popupmenu together
  --       long_message_to_split = true, -- long messages will be sent to a split
  --       inc_rename = false, -- enables an input dialog for inc-rename.nvim
  --       lsp_doc_border = false, -- add a border to hover docs and signature help
  --     },
  --     -- add any options here
  --   },
  --   dependencies = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to use the notification view.
  --     --   If not available, we use `mini` as the fallback
  --     "rcarriga/nvim-notify",
  --   },
  -- },

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
  -- {
  --   "stevearc/dressing.nvim",
  --   lazy = false,
  --   opts = {},
  -- },
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
  ------------------------------ OUTLINE ------------------------------
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
      -- Your setup opts here
    },
  },
}
