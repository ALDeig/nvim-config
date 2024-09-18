vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    print("LINT")
    require("lint").try_lint()
  end,
})

return {
  "mfussenegger/nvim-lint",
  event = "VeryLazy",
  config = function()
    require("lint").linters_by_ft = {
      -- python = { "" },
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      proto = { "protolint" },
    }
  end,
}
