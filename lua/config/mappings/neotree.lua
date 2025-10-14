local map = vim.api.nvim_set_keymap
-- local opts = { noremap = true, silent = true }

-- Neotree keybindings
map("n", "<C-n>", "<cmd>Neotree toggle<CR>", { noremap = true, silent = true, desc = "Neotree Toggle tree" })
map("n", "<leader>e", "<cmd>Neotree reveal<CR>", { noremap = true, silent = true, desc = "Neotree Focus on Neotree" })
map(
	"n",
	"<leader>B",
	"<cmd>Neotree toggle float buffers<CR>",
	{ noremap = true, silent = true, desc = "Neotree Show buffers" }
)
map(
	"n",
	"<leader>gs",
	"<cmd>Neotree float git_status<CR>",
	{ noremap = true, silent = true, desc = "Neotree Show git status files" }
)

-- Alternative keys configuration format
--[[
  keys = {
    { "<C-n>", "<cmd>Neotree toggle<CR>", mode = "n", desc = "Neotree Toggle tree" },
    { "<leader>e", "<cmd>Neotree reveal<CR>", mode = "n", desc = "Neotree Focus on Neotree" },
    { "<leader>B", "<cmd>Neotree toggle float buffers<cr>", mode = "n", desc = "Neotree Show buffers" },
    { "<leader>gs", "<cmd>Neotree float git_status<cr>", mode = "n", desc = "Neotree Show git status files" },
  },
]]
