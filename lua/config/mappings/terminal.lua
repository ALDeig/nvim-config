-- Terminal management configuration for Neovim
-- Add this to your init.lua or create a separate file in lua/config/mappings/terminal.lua

local M = {}

-- Store terminal buffers and windows
M.terminals = {
	split = { buf = nil, win = nil },
	float = { buf = nil, win = nil },
	tab = { buf = nil, win = nil },
}

-- Create terminal in new tab
M.open_tab_terminal = function()
	vim.cmd("tabnew")
	vim.cmd("terminal")
	vim.cmd("startinsert")
	M.terminals.tab.buf = vim.api.nvim_get_current_buf()
	M.terminals.tab.win = vim.api.nvim_get_current_win()
end

-- Create terminal in vertical split
M.open_split_terminal = function()
	-- Check if terminal already exists
	if M.terminals.split.buf and vim.api.nvim_buf_is_valid(M.terminals.split.buf) then
		-- If window exists, focus it
		if M.terminals.split.win and vim.api.nvim_win_is_valid(M.terminals.split.win) then
			vim.api.nvim_set_current_win(M.terminals.split.win)
		else
			-- Create new split with existing buffer
			vim.cmd("vsplit")
			vim.api.nvim_win_set_buf(0, M.terminals.split.buf)
			M.terminals.split.win = vim.api.nvim_get_current_win()
		end
	else
		-- Create new terminal
		vim.cmd("vsplit | terminal")
		M.terminals.split.buf = vim.api.nvim_get_current_buf()
		M.terminals.split.win = vim.api.nvim_get_current_win()
	end
	vim.cmd("startinsert")
end

-- Create floating terminal
M.open_float_terminal = function()
	-- Check if floating terminal already exists
	if M.terminals.float.win and vim.api.nvim_win_is_valid(M.terminals.float.win) then
		vim.api.nvim_set_current_win(M.terminals.float.win)
		vim.cmd("startinsert")
		return
	end

	-- Calculate window size (80% of editor size)
	local width = math.floor(vim.o.columns * 0.8)
	local height = math.floor(vim.o.lines * 0.8)

	-- Calculate starting position (centered)
	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	-- Create buffer for terminal if it doesn't exist
	if not M.terminals.float.buf or not vim.api.nvim_buf_is_valid(M.terminals.float.buf) then
		M.terminals.float.buf = vim.api.nvim_create_buf(false, true)
	end

	-- Window configuration
	local opts = {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		style = "minimal",
		border = "rounded",
		title = " Terminal ",
		title_pos = "center",
	}

	-- Create floating window
	M.terminals.float.win = vim.api.nvim_open_win(M.terminals.float.buf, true, opts)

	-- Start terminal in buffer if it's empty
	if vim.api.nvim_buf_get_name(M.terminals.float.buf) == "" then
		vim.cmd("terminal")
		M.terminals.float.buf = vim.api.nvim_get_current_buf()
	end

	vim.cmd("startinsert")
end

-- Toggle floating terminal (show/hide)
M.toggle_float_terminal = function()
	if M.terminals.float.win and vim.api.nvim_win_is_valid(M.terminals.float.win) then
		vim.api.nvim_win_hide(M.terminals.float.win)
		M.terminals.float.win = nil
	else
		M.open_float_terminal()
	end
end

-- Close current terminal
M.close_terminal = function()
	local buf = vim.api.nvim_get_current_buf()
	local win = vim.api.nvim_get_current_win()

	-- Check if current buffer is a terminal
	if vim.bo[buf].buftype == "terminal" then
		-- Update stored references
		for _, term in pairs(M.terminals) do
			if term.buf == buf then
				term.buf = nil
			end
			if term.win == win then
				term.win = nil
			end
		end

		-- Close window
		vim.cmd("close!")
	end
end

-- Hide terminal (keep it running in background)
M.hide_terminal = function()
	local win = vim.api.nvim_get_current_win()
	local buf = vim.api.nvim_get_current_buf()

	if vim.bo[buf].buftype == "terminal" then
		-- For floating windows, just hide
		for _, term in pairs(M.terminals) do
			if term.win == win then
				vim.cmd("hide")
				return
			end
		end
		-- For split windows, move to previous window
		vim.cmd("wincmd p")
	end
end

-- Go back to last terminal
M.goto_last_terminal = function()
	-- Try to find any valid terminal window
	---@diagnostic disable-next-line: unused-local
	for name, term in pairs(M.terminals) do
		if term.win and vim.api.nvim_win_is_valid(term.win) then
			vim.api.nvim_set_current_win(term.win)
			vim.cmd("startinsert")
			return
		end
	end

	-- If no window found, try to find terminal buffer and open it
	for name, term in pairs(M.terminals) do
		if term.buf and vim.api.nvim_buf_is_valid(term.buf) then
			if name == "float" then
				M.open_float_terminal()
			else
				vim.cmd("vsplit")
				vim.api.nvim_win_set_buf(0, term.buf)
				term.win = vim.api.nvim_get_current_win()
				vim.cmd("startinsert")
			end
			return
		end
	end

	-- No terminal found, create new one
	M.open_split_terminal()
end

-- Setup keymappings
M.setup = function()
	local opts = { noremap = true, silent = true }

	-- Normal mode mappings
	vim.api.nvim_set_keymap(
		"n",
		"<leader>tt",
		'<cmd>lua require("config.mappings.terminal").open_tab_terminal()<CR>',
		opts
	)
	vim.api.nvim_set_keymap(
		"n",
		"<leader>tv",
		'<cmd>lua require("config.mappings.terminal").open_split_terminal()<CR>',
		opts
	)
	vim.api.nvim_set_keymap(
		"n",
		"<leader>tf",
		'<cmd>lua require("config.mappings.terminal").open_float_terminal()<CR>',
		opts
	)
	vim.api.nvim_set_keymap(
		"n",
		"<leader>tg",
		'<cmd>lua require("config.mappings.terminal").toggle_float_terminal()<CR>',
		opts
	)
	vim.api.nvim_set_keymap("n", "<leader>th", '<cmd>lua require("config.mappings.terminal").hide_terminal()<CR>', opts)
	vim.api.nvim_set_keymap(
		"n",
		"<leader>tc",
		'<cmd>lua require("config.mappings.terminal").close_terminal()<CR>',
		opts
	)
	vim.api.nvim_set_keymap(
		"n",
		"<leader>tb",
		'<cmd>lua require("config.mappings.terminal").goto_last_terminal()<CR>',
		opts
	)

	-- Terminal mode mappings for navigation
	vim.api.nvim_set_keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", opts)
	vim.api.nvim_set_keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", opts)
	vim.api.nvim_set_keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", opts)
	-- vim.api.nvim_set_keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", opts)

	-- Exit terminal mode
	vim.api.nvim_set_keymap("t", "<Esc><Esc>", "<C-\\><C-n>", opts)
	vim.api.nvim_set_keymap("t", "<C-q>", "<C-\\><C-n>", opts)

	-- Quick toggle floating terminal from terminal mode
	vim.api.nvim_set_keymap(
		"t",
		"<C-\\><C-f>",
		'<C-\\><C-n><cmd>lua require("config.mappings.terminal").toggle_float_terminal()<CR>',
		opts
	)

	-- Auto commands for terminal
	vim.api.nvim_create_augroup("TerminalSettings", { clear = true })

	-- Disable line numbers in terminal
	vim.api.nvim_create_autocmd("TermOpen", {
		group = "TerminalSettings",
		pattern = "*",
		callback = function()
			vim.opt_local.number = false
			vim.opt_local.relativenumber = false
			vim.opt_local.signcolumn = "no"
		end,
	})

	-- Start in insert mode when entering terminal buffer
	vim.api.nvim_create_autocmd("BufEnter", {
		group = "TerminalSettings",
		pattern = "term://*",
		callback = function()
			vim.cmd("startinsert")
		end,
	})

	-- Clean up references when terminal is closed
	vim.api.nvim_create_autocmd("TermClose", {
		group = "TerminalSettings",
		pattern = "*",
		callback = function()
			local buf = vim.api.nvim_get_current_buf()
			for _, term in pairs(M.terminals) do
				if term.buf == buf then
					term.buf = nil
					term.win = nil
				end
			end
		end,
	})
end

return M
