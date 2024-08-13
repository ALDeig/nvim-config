-- return {
-- 		"stevearc/conform.nvim",
-- 		event = { "BufWritePre" },
-- 		cmd = { "ConformInfo" },
-- 		-- This will provide type hinting with LuaLS
-- 		---@module "conform"
-- 		---@type conform.setupOpts
-- 		opts = {
--             formatters_by_ft = {
--                 lua = { "stylua" },
--                 python = { "isort", "black" },
--                 javascript = { "prettierd", "prettier", stop_after_first = true },
--             },
--
--     },
-- 		init = function()
-- 			-- If you want the formatexpr, here is the place to set it
-- 			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
-- 		end
-- }
return {
  "stevearc/conform.nvim",
  -- event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>ff",
      function()
        require("conform").format({ async = true })
      end,
      mode = {"n", "v"},
      desc = "Format buffer",
    },
  },
  -- This will provide type hinting with LuaLS
  ---@module "conform"
---@diagnostic disable-next-line: undefined-doc-name
  ---@type conform.setupOpts
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_lsp" }, -- "pyright", stop_after_first = true },
      javascript = { "prettierd", "prettier", stop_after_first = true },
    },
    -- Set default options
    default_format_opts = {
      lsp_format = "fallback",
    },
    -- Set up format-on-save
    -- format_on_save = { timeout_ms = 500 },
    -- Customize formatters
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2" },
      },
      stylua = {
        prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
      },
    },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
