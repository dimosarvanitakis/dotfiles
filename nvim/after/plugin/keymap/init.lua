-- UndoTree
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")

-- Move line up/down (in all modes)
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- File browser
vim.keymap.set("n", "<C-f>", ":Sex!<CR>")
vim.keymap.set("n", "<leader>.", ":Ex<CR>")

-- Split window (vertical)
vim.keymap.set("n", "<leader>wv", ":vsplit<CR>")
vim.keymap.set("n", "<leader>fs", ":w<CR>")
