local map = vim.keymap.set

-------------GLOBAL-------------
-- Устанавливает пробел в качестве лидера команд
vim.g.mapleader = " "

-- В режиме вставки (i) при вводе "jk" происходит выход в нормальный режим
map("i", "jk", "<ESC>", { desc = "Escape" })
-- В нормальном режиме (n) при нажатии Ctrl+q выполняется команда выхода из Vim
map("n", "<C-q>", ":q<CR>", { desc = "Quit" })
-- В нормальном режиме (n) при нажатии ";" вводится двоеточие, переходя в командный режим
-- map("n", ";", ":", {desc = "Command mode"})
-- В режиме вставки (i) при нажатии Ctrl+c происходит выход в нормальный режим
map("i", "<C-c>", "<ESC>", { desc = "Escape" })

-------------COPY-------------
-- В нормальном (n) и визуальном (v) режимах при нажатии <leader>y копируется текст в системный буфер обмена
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to clipboard" })
-- В нормальном режиме (n) при нажатии <leader>Y копируется текущая строка в системный буфер обмена
map("n", "<leader>Y", [["+Y]], { desc = "Copy line to clipboard" })

-------------SEARCH-------------
-- В нормальном режиме (n) при нажатии ", " (запятая + пробел) отключается подсветка поиска
map("n", ",<space>", "<cmd>:nohlsearch<CR>", { desc = "Clear search highlighting" })
-- В нормальном режиме (n) при нажатии "n" переход к следующему результату поиска с центровкой экрана
map("n", "n", "nzzzv", { desc = "Next search result centered" })
-- В нормальном режиме (n) при нажатии "N" переход к предыдущему результату поиска с центровкой экрана
map("n", "N", "Nzzzv", { desc = "Previous search result centered" })

-------------WINDOWS-------------
-- В нормальном режиме (n) при нажатии Ctrl+h происходит переключение на окно слева
map("n", "<C-h>", "<C-w>h", { desc = "Window Switch Window left" })
-- В нормальном режиме (n) при нажатии Ctrl+l происходит переключение на окно справа
map("n", "<C-l>", "<C-w>l", { desc = "Window Switch Window right" })
-- В нормальном режиме (n) при нажатии Ctrl+j происходит переключение на окно снизу
map("n", "<C-j>", "<C-w>j", { desc = "Window Switch Window down" })
-- В нормальном режиме (n) при нажатии Ctrl+k происходит переключение на окно сверху
map("n", "<C-k>", "<C-w>k", { desc = "Window Switch Window up" })

-------------MOVE-------------
-- В визуальном режиме (v) при нажатии ">" выделенные строки сдвигаются вправо, и выделение сохраняется
map("v", ">", ">gv", { desc = "Move V-lines move to right on tab" })
-- В визуальном режиме (v) при нажатии "<" выделенные строки сдвигаются влево, и выделение сохраняется
map("v", "<", "<gv", { desc = "Move V-lines move to left on tab" })
-- В визуальном режиме (v) при нажатии "J" выделенные строки перемещаются вниз, и выделение сохраняется
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line down" })
-- В визуальном режиме (v) при нажатии "K" выделенные строки перемещаются вверх, и выделение сохраняется
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line up" })

-------------QUICKFIX-------------
-- В нормальном режиме (n) при нажатии Ctrl+k переход к следующему элементу quickfix списка с центровкой экрана
-- map("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next quickfix item centered" })
-- В нормальном режиме (n) при нажатии Ctrl+j переход к предыдущему элементу quickfix списка с центровкой экрана
-- map("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Previous quickfix item centered" })
-- В нормальном режиме (n) при нажатии <leader>k переход к следующему элементу списка местоположений с центровкой экрана
map("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next location list item centered" })
-- В нормальном режиме (n) при нажатии <leader>j переход к предыдущему элементу списка местоположений с центровкой экрана
map("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous location list item centered" })

-------------BUFFER-------------
-- В нормальном режиме (n) при нажатии <leader>s замена текущего слова
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace current word" })
-- В нормальном режиме (n) при нажатии <leader><leader> выполнение команды ":so"
map("n", "<leader><leader>", function()
	vim.cmd("so")
end, { desc = "Source file" })

-------------TABS-------------
map("n", "<leader>to", ":tabnew<CR>", { desc = "Tab new" })
map("n", "<leader>tl", ":tabNext<CR>", { desc = "Next tab" })
map("n", "<leader>tc", ":tabclose<CR>", { desc = "Close tab" })

-------------SCROLL-------------
-- В нормальном режиме (n) при нажатии Ctrl+d прокрутка вниз на полстраницы с центровкой экрана
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half page centered" })
-- В нормальном режиме (n) при нажатии Ctrl+u прокрутка вверх на полстраницы с центровкой экрана
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half page centered" })

-------------TEXT-------------
-- В нормальном режиме (n) при нажатии "J" объединение строк с сохранением позиции курсора
map("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })
-- В визуальном режиме (x) при нажатии <leader>p вставка без перезаписи регистра
map("x", "<leader>p", [["_dP]], { desc = "Paste without overwriting register" })
-- В нормальном (n) и визуальном (v) режимах при нажатии <leader>d удаление без перезаписи регистра
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without overwriting register" })

-------------TELESCOPE-------------
map("n", ",f", "<cmd>Telescope find_files<CR>", { desc = "Telescope Find files" })
map("n", ",g", "<cmd>Telescope live_grep<CR>", { desc = "Telescope Live grep" })
map("n", ",b", "<cmd>Telescope buffers<CR>", { desc = "Telescope Find buffers" })
map("n", ",m", "<cmd>Telescope git_commits<CR>", { desc = "Telescope Git commits" })
map("n", ",z", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Telescope Find in current buffer" })
map("n", ",s", "<cmd>Telescope git_status<CR>", { desc = "Telescope Git status" })

-------------BUFFERS-------------
map("n", "H", vim.cmd.BufferPrevious, { desc = "Buffer previous" })
map("n", "L", vim.cmd.BufferNext, { desc = "Buffer next" })
map("n", "<leader>x", vim.cmd.BufferClose, { desc = "Buffer close" })

-------------TERMINAL-------------
map("t", "<C-h>", "<C-\\><C-N>", { desc = "Exit terminal mode" })

require("config.mappings.neotree")
require("config.mappings.gitsigns")
require("config.mappings.terminal").setup()
