vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

--vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
-- vim.opt.so = 999 --курсор в центре экрана

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80"
--vim.opt.clipboard = unnamedplus

vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.opt.foldcolumn = "1"

vim.opt.cursorline = true        -- Подсветка строки с курсором
vim.opt.splitright = true        -- vertical split вправо
vim.opt.splitbelow = true        -- horizontal split вниз
vim.g.netrw_sort_sequence = "\\/"
vim.g.mapleader = " "


-- Подсвечивает на доли секунды скопированную часть текста
vim.api.nvim_exec2([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=300}
augroup end]], {output = false})

