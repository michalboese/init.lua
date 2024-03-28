-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.6',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({ 'rose-pine/neovim',
  	as = 'rose-pine', 
  	config = function()
		vim.cmd('colorscheme rose-pine')
  end

  })

  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  use( 'hrsh7th/cmp-nvim-lsp')
  use( 'hrsh7th/cmp-buffer')
  use( 'hrsh7th/cmp-path')
  use( 'hrsh7th/cmp-nvim-lua')
  use { 'L3MON4D3/LuaSnip' }
  use {
	  'hrsh7th/nvim-cmp',
	  config = function ()
		  require'cmp'.setup {
			  snippet = {
				  expand = function(args)
					  require'luasnip'.lsp_expand(args.body)
				  end
			  },

			  sources = {
				  { name = 'luasnip' },
				  -- more sources
			  },
		  }
	  end
  }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'rafamadriz/friendly-snippets' }

  use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  requires = {
    --- Uncomment the two plugins below if you want to manage the language servers from neovim
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- LSP Support
    {'neovim/nvim-lspconfig'},
    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'L3MON4D3/LuaSnip'},
  }
}
  end)
