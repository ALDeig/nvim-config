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
					prev = "<M-k>",
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

		-- Настройка цветовой схемы для подсветки предложений
		vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#888888" })
	end,
}
