vim.opt.encoding = "utf-8"
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3

-- Fold Settings
vim.opt.fillchars = { fold = " " }
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.opt.foldlevel = 99
vim.g.markdown_folding = 1 -- enable markdown folding


-- with treesitter
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.cmd([[ set nofoldenable]])
-- vim.opt.foldlevel = 99

vim.opt.updatetime = 50
vim.opt.colorcolumn = "88"

-- Indent Settings
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true

-- Line Numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Mouse
vim.opt.mouse = "a"
vim.opt.mousefocus = true

-- colors
vim.opt.termguicolors = true

-- установка табуляции для разных типов файлов
local function set_tabulation()
    if vim.bo.filetype == "python" then
        vim.opt.tabstop = 4
        vim.opt.shiftwidth = 4
        vim.opt.softtabstop = 4
    else
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
        vim.opt.softtabstop = 2
    end
end
vim.api.nvim_create_autocmd(
    "BufEnter",
    { callback = set_tabulation }
)

-- Fold Settings variants
-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   callback = function()
--     if require("nvim-treesitter.parsers").has_parser() then
--       vim.opt.foldmethod = "expr"
--       vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
--     else
--       vim.opt.foldmethod = "indent"
--     end
--   end,
-- })
-- vim.opt.set("nofoldenable")

