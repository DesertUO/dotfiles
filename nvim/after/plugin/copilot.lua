-- This is a copilot configuration file for Neovim.
-- Copilot has already been installed by packer.nvim in packer.lua

-- The current file is after/plugin/copilot.lua

-- Enable copilot for all file types
vim.g.copilot_filetypes = {
  ["*"] = true,
}

-- Show the full suggestion and allow to partially accept it with <Leader>l
vim.g.copilot_no_tab_map = true
-- Accept the whole suggestion with <Leader>l
vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
-- Accept part of the suggestion with <C>n
vim.api.nvim_set_keymap("i", "<C-n>", 'copilot#Accept("<Right>")', { silent = true, expr = true })

