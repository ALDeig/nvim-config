return {
  "akinsho/bufferline.nvim",
  event = "BufNew",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        separator_style = "slant",
        style_preset = require("bufferline").style_preset.italic,
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },
        indicator = {
          icon = "▎", -- this should be omitted if indicator style is not 'icon'
          style = "icon", -- | 'underline' | 'none',
        },
        numbers = function(opts)
          return string.format("%s·%s", opts.raise(opts.id), opts.lower(opts.ordinal))
        end,
      },
    })
  end,

  keys = {
    { "H", "<cmd>BufferLineCyclePrev<cr>", mode = "n", desc = "Bufferline move left" },
    { "L", "<cmd>BufferLineCycleNext<cr>", mode = "n", desc = "Bufferline move right" },
    { "<leader>x", ":bd<cr>", mode = "n", desc = "Bufferline buffer close" },
    { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", mode = "n", desc = "Bufferline close others" },
  },
}
