vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80"

vim.opt.signcolumn="yes"

vim.opt.shada = ""
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- Set python3 path for windows only
if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
    vim.g.python3_host_prog = 'C:/Users/deser/AppData/Local/Programs/Python/Python313/python.exe'
end

