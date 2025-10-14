return {
	"zbirenbaum/copilot.lua",
	cmd = { "Copilot" },
	event = { "InsertEnter" },
	lazy = true,
	config = function()
		require("copilot").setup({
			-- Общие настройки
			panel = {
				enabled = true,
				auto_refresh = true,
				keymap = {
					jump_prev = "[[",
					jump_next = "]]",
					accept = "<CR>",
					refresh = "gr",
					open = "<M-p>",
				},
				layout = {
					position = "bottom", -- | top | left | right
					ratio = 0.4,
				},
			},

			-- Настройки предложений (suggestions)
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 75, -- Задержка перед показом предложений (мс)
				keymap = {
					accept = "<C-g>",
					accept_word = "<C-f>",
					accept_line = "<C-l>",
					next = "<C-j>",
					prev = "<C-k>",
					dismiss = "<C-]>",
				},
			},

			-- Настройки метода копирования
			copilot_node_command = "node", -- Путь к Node.js
			server_opts_overrides = {
				trace = "verbose",
				settings = {
					advanced = {
						listCount = 10, -- Количество предложений
						inlineSuggestCount = 3, -- Количество встроенных предложений
					},
				},
			},
		})

		-- Дополнительные настройки для интеграции с LSP
		-- Если используете nvim-cmp, эти строки помогут с интеграцией
		-- Раскомментируйте при необходимости
		-- local has_words_before = function()
		--   if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
		--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		--   return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
		-- end

		-- Пример настройки цветовой схемы для высветки предложений
		vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#888888" })
	end,
}
