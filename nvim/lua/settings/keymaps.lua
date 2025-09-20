-- vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--vim.keymap.set("n", "<leader>vwm", function()
--    require("vim-with-me").StartVimWithMe()
--end)
--vim.keymap.set("n", "<leader>svwm", function()
--    require("vim-with-me").StopVimWithMe()
--end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("n", "<M-r>", [[viw"_dP]])
vim.keymap.set("n", "*", "*N")
--vim.keymap.set("v", "*", "<cmd>:let @/=@\"<CR><cmd>set hlsearch<CR>")

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<M-e>", "<Esc>")
vim.keymap.set("v", "<M-e>", "<Esc>")
vim.keymap.set("n", "<M-w>", "<C-w>o")
-- vim.keymap.set("i", "jk", "<Esc>")

--vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

--vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
--vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
--vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
--vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")


-- vim.keymap.set("n", "Left", "h")
-- vim.keymap.set("n", "Down", "j")
-- vim.keymap.set("n", "Up", "k")
-- vim.keymap.set("n", "Right", "l")
-- vim.keymap.set("v", "Left", "h")
-- vim.keymap.set("v", "Down", "j")
-- vim.keymap.set("v", "Up", "k")
-- vim.keymap.set("v", "Right", "l")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("v", "<leader>s", [[:s//<C-r><S-">/g<Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>*", function()
    vim.cmd("nohlsearch")
end)
-- vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/lt/packer.lua<CR>")
vim.keymap.set("n", "<F8>", vim.cmd.TagbarToggle)
-- vim.keymap.set("n", "<leader><leader>", function()
--     vim.cmd("so")
-- end)


vim.keymap.set("n", "<F7>", function()
    vim.cmd("w")
    vim.cmd("!python %")
end)

vim.keymap.set("n", "gd", function() vim.lsp.buf.type_definition() end)
vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end)

