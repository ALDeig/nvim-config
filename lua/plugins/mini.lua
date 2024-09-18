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
          "neo-tree",
          "notify",
          "toggleterm",
          "Trouble",
          "trouble",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
  {
    "echasnovski/mini.animate",
    version = false,
    event = "VeryLazy",
    opts = { open = { enable = false }, close = { enable = false }, resize = { enable = false } },
  },
  { "echasnovski/mini.cursorword", version = false, event = "VeryLazy", opts = {} },
  --   recommended = true,
  --   lazy = false,
  --   -- event = "VeryLazy",
  --   opts = function()
  --     -- don't use animate when scrolling with the mouse
  --     local mouse_scrolled = false
  --     for _, scroll in ipairs({ "Up", "Down" }) do
  --       local key = "<ScrollWheel" .. scroll .. ">"
  --       vim.keymap.set({ "", "i" }, key, function()
  --         mouse_scrolled = true
  --         return key
  --       end, { expr = true })
  --     end
  --
  --     vim.api.nvim_create_autocmd("FileType", {
  --       pattern = "grug-far",
  --       callback = function()
  --         vim.b.minianimate_disable = true
  --       end,
  --     })
  --
  --     local animate = require("mini.animate")
  --     return {
  --       resize = {
  --         timing = animate.gen_timing.linear({ duration = 50, unit = "total" }),
  --       },
  --       scroll = {
  --         timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
  --         subscroll = animate.gen_subscroll.equal({
  --           predicate = function(total_scroll)
  --             if mouse_scrolled then
  --               mouse_scrolled = false
  --               return false
  --             end
  --             return total_scroll > 1
  --           end,
  --         }),
  --       },
  --     }
  --   end,
  -- },
}
