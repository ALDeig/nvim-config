vim.opt.encoding = "utf-8"
vim.opt.wrap = false

-- Отключить неиспользуемые провайдеры
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0

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

-- Fold Settings (treesitter-based)
vim.opt.fillchars = { fold = " " }
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldenable = false
vim.opt.foldlevel = 99
vim.g.markdown_folding = 1 -- enable markdown folding

vim.opt.updatetime = 50

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "python" },
	callback = function()
		vim.opt_local.colorcolumn = "88"
	end,
})

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
-- Python покрыт глобальным дефолтом (4)
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "lua", "javascript", "typescript", "html", "css", "json", "yaml" },
	callback = function()
		vim.bo.tabstop = 2
		vim.bo.shiftwidth = 2
		vim.bo.softtabstop = 2
	end,
})
