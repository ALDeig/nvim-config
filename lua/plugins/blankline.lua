return {
  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = false,
    main = "ibl",
    opts = {
      indent = {
        highlight = { "CursorColumn", "Whitespace" },
        char = "┊",
        -- char = "│",
        -- tab_char = { "a", "b", "c" },
        -- highlight = { "Function", "Label" },
        smart_indent_cap = true,
      },
      scope = {
        enabled = false,
        show_end = false,
        show_exact_scope = true,
      },
    },
  },
}
