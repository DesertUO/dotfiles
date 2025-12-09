-- Set <leader> key to space
vim.g.mapleader = " "

-- Filetree
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Swaps lines on visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Nice one
vim.keymap.set("x", "<leader>p", "\"_dp")

-- GREAT
-- Yanks into system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")

-- Paste fromsystem clipboard
vim.keymap.set("n", "<leader>v", "\"+p")

-- Q does nothing
vim.keymap.set("n", "Q", "<nop>")

-- Oh...
-- When the cursor is on a word, "selects" all the matching words and
-- can be globally modified in the file (modify all)
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Navigate tmux panes with vim keys
vim.keymap.set("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>")
vim.keymap.set("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>")
vim.keymap.set("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>")

-- Nvim panes

-- Creation
-- Horizontally
vim.keymap.set("n", "<C-Right>", ":vsplit<CR>|<C-w>l")
vim.keymap.set("n", "<C-Left>", ":vsplit<CR>")
-- Vertically
vim.keymap.set("n", "<c-Down>", ":split<CR>|<C-w>j")
vim.keymap.set("n", "<c-Up>", ":split<CR>")

-- Navigation
-- Horizontally
vim.keymap.set("n", "<C-wLeft>", "<C-w>h")
vim.keymap.set("n", "<C-wRight>", "<C-w>l")
-- Vertically
vim.keymap.set("n", "<C-wUp>", "<C-w>k")
vim.keymap.set("n", "<C-wDown>", "<C-w>j")

