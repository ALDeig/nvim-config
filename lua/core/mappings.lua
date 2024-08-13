local map = vim.keymap.set

-------------GLOBAL-------------
vim.g.mapleader = " "

map("i", "jk", "<ESC>")
map("n", "<C-q>", ":q<CR>")
map("n", ";", ":")


-------------COPY-------------
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

-------------SEARCH-------------
map("n", ",<space>", "<cmd>:nohlsearch<CR>")

------------- WINDOWS-------------
map("n", "<C-h>", "<C-w>h", { desc = "Window Switch Window left" })
map("n", "<C-l>", "<C-w>l", { desc = "Window Switch Window right" })
map("n", "<C-j>", "<C-w>j", { desc = "Window Switch Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window Switch Window up" })

