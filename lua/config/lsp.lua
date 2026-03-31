vim.diagnostic.config({ virtual_text = true })
vim.o.winborder = "rounded"

local configs = require("config.lsp_configs")

vim.lsp.enable({ "ruff", "pyright", "lua_ls", "ts_ls", "html", "protols" })
vim.lsp.config("ruff", { init_options = configs.ruff })
vim.lsp.config("pyright", { settings = configs.pyright })
vim.lsp.set_log_level(vim.lsp.log_levels.OFF)

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		local opts = { buffer = args.buf }

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
		vim.keymap.set({ "n", "x" }, "gq", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
		vim.keymap.set("n", "grt", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "grd", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "grn", vim.lsp.buf.rename, opts)

		if client and client:supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
		end
	end,
})

vim.opt.shortmess:append("c")
