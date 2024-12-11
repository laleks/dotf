-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'


  use{'nvim-telescope/telescope.nvim', tag = '0.1.2',
      requires = {'nvim-lua/plenary.nvim'}}

  --use {'mg979/vim-visual-multi', branch = 'master'}
  --use 'preservim/nerdcommenter'


    -- автоматические закрывающиеся скобки:
    -- use { 'windwp/nvim-autopairs',
    -- config = function()
    --     require("nvim-autopairs").setup()
    -- end}

    -- Комментирует по <gc> вне зависимости от языка программирования
    -- use { 'numToStr/Comment.nvim',
    -- config = function()
    --     require('Comment').setup()
    -- end }

    use({ 'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
        vim.cmd('colorscheme rose-pine')
    end})

    use 'majutsushi/tagbar'
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use 'nvim-treesitter/playground'
    use 'ThePrimeagen/harpoon'
    use 'mbbill/undotree'
    use 'tpope/vim-fugitive'
    use 'xiyaowong/transparent.nvim'

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }

end)
