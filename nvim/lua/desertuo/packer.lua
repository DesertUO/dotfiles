-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Themes
  use({
	  -- "catppuccin/nvim",
      -- 'ellisonleao/gruvbox.nvim',
      'olimorris/onedarkpro.nvim',
	  -- as = "catppuccin",
      -- as = 'gruvbox',
  })
  use {
      'lukas-reineke/virt-column.nvim',
      config = function()
        require("virt-column").setup({
            char = "▏",
            virtcolumn = "80",
        })
      end
  }

  use 'luochen1990/rainbow'
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'nvim-lua/plenary.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }


  -- Others
  use(
	  'nvim-treesitter/nvim-treesitter',
	  { run = ':TSUpdate' }
  )

  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- Lsp
  use 'neovim/nvim-lspconfig'
  use 'ray-x/lsp_signature.nvim'

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/vim-vsnip'
  use 'quangnguyen30192/cmp-nvim-ultisnips'

  -- Utils
  use 'zefei/vim-colortuner'
  use 'ntpeters/vim-better-whitespace'
  use 'windwp/nvim-autopairs'
  use 'simrat39/symbols-outline.nvim'
  use 'RRethy/vim-illuminate'
  use 'sindrets/diffview.nvim'
  use 'honza/vim-snippets'

  -- Copilot}
  use 'github/copilot.vim'

  -- Tmux integration
  use {
      'christoomey/vim-tmux-navigator', lazy = false
  }
end)
