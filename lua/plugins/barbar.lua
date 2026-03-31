-- Файл конфигурации для плагина barbar.nvim
-- Этот плагин добавляет стильные вкладки буферов в Neovim

return {
	{
		"romgrk/barbar.nvim", -- Основной плагин для управления вкладками буферов
		dependencies = {
			"lewis6991/gitsigns.nvim", -- ОПЦИОНАЛЬНО: для отображения статуса git
			"echasnovski/mini.icons",
		},
		init = function()
			-- Отключаем автоматическую настройку, чтобы использовать наши параметры
			vim.g.barbar_auto_setup = false
		end,
		version = "^1.0.0", -- Фиксируем версию плагина для совместимости
		opts = {
			icons = {
				-- Настройка иконок для диагностики
				--   error = '󰅚 ',
				diagnostics = {
					-- Иконки для различных уровней диагностики
					[vim.diagnostic.severity.ERROR] = { enabled = true }, -- Иконка для ошибок
					[vim.diagnostic.severity.WARN] = { enabled = true }, -- Включаем отображение предупреждений
					[vim.diagnostic.severity.INFO] = { enabled = true }, -- Включаем отображение информационных сообщений
					[vim.diagnostic.severity.HINT] = { enabled = true }, -- Включаем отображение подсказок
				},
				-- gitsigns = {
				-- 	added = { enabled = true, icon = "+" },
				-- 	changed = { enabled = true, icon = "~" },
				-- 	deleted = { enabled = true, icon = "-" },
				-- },
				-- separator = { left = "▎", right = "" },
				-- Настройка поведения с файловыми менеджерами и деревьями
				sidebar_filetypes = {
					-- Настройка поведения с различными боковыми панелями

					-- Настройка для плагина undotree
					undotree = {
						text = "undotree", -- Текст для отображения в вкладке
						align = "center", -- Выравнивание текста (можно использовать 'left', 'center', или 'right')
					},

					-- Настройка для плагина symbols-outline
					Outline = { event = "BufWinLeave", text = "symbols-outline", align = "right" },
				},
			},
			-- lazy.nvim автоматически вызовет setup для вас
			-- Дополнительные настройки:
			animation = true, -- Включить анимацию
			insert_at_start = true, -- Вставлять новые буферы в начало списка
			-- Другие параметры можно добавить по необходимости
		},
	},
}
