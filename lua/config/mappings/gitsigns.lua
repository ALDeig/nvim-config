require("gitsigns").setup({
	on_attach = function(bufnr)
		local gitsigns = require("gitsigns")

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "]c", bang = true })
			else
				gitsigns.nav_hunk("next")
			end
		end, { desc = "GitSigns Next hunk" })

		map("n", "[c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "[c", bang = true })
			else
				gitsigns.nav_hunk("prev")
			end
		end, { desc = "GitSigns Prev hunk" })

		-- Actions
		-- map("n", "<leader>hs", gitsigns.stage_hunk)
		-- map("n", "<leader>hr", gitsigns.reset_hunk)
		--
		-- map("v", "<leader>hs", function()
		-- 	gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		-- end)
		--
		-- map("v", "<leader>hr", function()
		-- 	gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		-- end)
		--
		-- map("n", "<leader>hS", gitsigns.stage_buffer)
		-- map("n", "<leader>hR", gitsigns.reset_buffer)
		map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "GitSigns Preview Hunk" })
		map("n", "<leader>hi", gitsigns.preview_hunk_inline, { desc = "GitSigns Preview Hunk Inline" })

		-- map("n", "<leader>hb", function()
		-- 	gitsigns.blame_line({ full = true })
		-- end)

		map("n", "<leader>hd", gitsigns.diffthis, { desc = "GitSigns Diff this" })

		map("n", "<leader>hD", function()
			gitsigns.diffthis("~")
		end, { desc = "GitSigns Показать diff с предыдущим коммитом" })

		-- map("n", "<leader>hQ", function()
		-- 	gitsigns.setqflist("all")
		-- end)
		-- map("n", "<leader>hq", gitsigns.setqflist)

		-- Toggles
		map("n", "<leader>hb", gitsigns.toggle_current_line_blame, {
			desc = "GitSigns Включить/выключить отображение blame текущей строки",
		})
		map("n", "<leader>hw", gitsigns.toggle_word_diff, {
			desc = "GitSigns Включить/выключить отображение diff на уровне слов",
		})

		-- Text object
		-- map({ "o", "x" }, "ih", gitsigns.select_hunk)
	end,
})
