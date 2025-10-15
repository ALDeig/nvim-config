-- require("tokyonight").setup({
-- 	on_colors = function(colors)
-- 		colors.hint = colors.orange
-- 		colors.error = "#ff0000"
-- 	end,
-- 	on_highlights = function(hl, c)
-- 		local prompt = "#2d3149"
-- 		hl.TelescopeNormal = {
-- 			bg = c.bg_dark,
-- 			fg = c.fg_dark,
-- 		}
-- 		hl.TelescopeBorder = {
-- 			bg = c.bg_dark,
-- 			fg = c.bg_dark,
-- 		}
-- 		hl.TelescopePromptNormal = {
-- 			bg = prompt,
-- 		}
-- 		hl.TelescopePromptBorder = {
-- 			bg = prompt,
-- 			fg = prompt,
-- 		}
-- 		hl.TelescopePromptTitle = {
-- 			bg = prompt,
-- 			fg = prompt,
-- 		}
-- 		hl.TelescopePreviewTitle = {
-- 			bg = c.bg_dark,
-- 			fg = c.bg_dark,
-- 		}
-- 		hl.TelescopeResultsTitle = {
-- 			bg = c.bg_dark,
-- 			fg = c.bg_dark,
-- 		}
-- 	end,
-- })
--
require("kanagawa").setup({
	colors = {
		theme = {
			all = {
				ui = {
					bg_gutter = "none",
				},
			},
		},
	},
	overrides = function(colors)
		local theme = colors.theme
		local makeDiagnosticColor = function(color)
			local c = require("kanagawa.lib.color")
			return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
		end
		return {
			NormalFloat = { bg = "none" },
			FloatBorder = { bg = "none" },
			FloatTitle = { bg = "none" },

			-- Save an hlgroup with dark background and dimmed foreground
			-- so that you can use it where your still want darker windows.
			-- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
			NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

			-- Popular plugins that open floats will link to NormalFloat by default;
			-- set their background accordingly if you wish to keep them dark and borderless
			LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
			MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
			TelescopeTitle = { fg = theme.ui.special, bold = true },
			TelescopePromptNormal = { bg = theme.ui.bg_p1 },
			TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
			TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
			TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
			TelescopePreviewNormal = { bg = theme.ui.bg_dim },
			TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
			DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
			DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
			DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
			DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
			Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
			PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
			PmenuSbar = { bg = theme.ui.bg_m1 },
			PmenuThumb = { bg = theme.ui.bg_p2 },
		}
		-- return {
		-- 	-- Assign a static color to strings
		-- 	String = { fg = colors.palette.carpYellow, italic = true },
		-- 	-- theme colors will update dynamically when you change theme!
		-- 	SomePluginHl = { fg = colors.theme.syn.type, bold = true },
		-- }
	end,
})

-- vim.cmd([[colorscheme tokyonight-moon]])
vim.cmd("colorscheme kanagawa-dragon")
