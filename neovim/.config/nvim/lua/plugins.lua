-- Clone packer.nvim if not installed
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

vim.api.nvim_command('packadd packer.nvim')

---- Main plugin declarations ----
require('packer').startup(function()

  ---- Manage packer through packer ----
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/popup.nvim';

  ---- Fuzzy finder with a great UI ----
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  };

  ---- Completion framework ----
  use {
    'hrsh7th/nvim-compe',
    config = function()
      require 'compe'.setup {
        enabled = true;
        autocomplete = true;
        debug = false;
        min_length = 1;
        preselect = 'enable';
        throttle_time = 80;
        source_timeout = 200;
        resolve_timeout = 800;
        incomplete_delay = 400;
        max_abbr_width = 100;
        max_kind_width = 100;
        max_menu_width = 100;
        documentation = {
          border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
          winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
          max_width = 120,
          min_width = 60,
          max_height = math.floor(vim.o.lines * 0.3),
          min_height = 1,
        };

        uource = {
          path = true;
          buffer = true;
          calc = true;
          nvim_lsp = true;
          nvim_lua = true;
          vsnip = true;
          ultisnips = true;
          luasnip = true;
        };
      }

      ---- Completion keybindings ----
      cmd [[
      inoremap <silent><expr> <C-Space> compe#complete()
      inoremap <silent><expr> <CR>      compe#confirm('<CR>')
      inoremap <silent><expr> <C-e>     compe#close('<C-e>')
      inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
      inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
      ]]
    end
  };

  ---- Neovim interface for TreeSitter ----
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() 
      local ts = require 'nvim-treesitter.configs'
      ts.setup {ensure_installed = 'maintained', highlight = {enable = true}}
    end
  }

  ---- LSP Setup ----
  use {
    'neovim/nvim-lspconfig',
    config = function()
      local lsp = require 'lspconfig'

      -- Default settings
      lsp.nimls.setup {}
      lsp.clangd.setup {}
      lsp.sumneko_lua.setup{}
    end
  };

  use {
    'ojroques/nvim-lspfuzzy',
    config = function()
      local lspfuzzy = require 'lspfuzzy'

      -- Make the LSP client use FZF instead of the quickfix list
      lspfuzzy.setup {}
    end
  };

  ---- Surround text ----
  use {
    'blackCauldron7/surround.nvim',
    config = function()
      require 'surround'.setup {}
    end
  };

  ---- Extensible modeline ----
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
  };

  ---- Theme Config ----
  use {
    'projekt0n/github-nvim-theme',
    config = function ()
    end
  };


  ---- Org-mode file support ----
  use 'axvr/org.vim';
end)

---------------------------------
---- Initialize some plugins ----
---------------------------------

require("github-theme").setup({
  themeStyle = "dark",
})

require('lualine').setup {
  options = {
    theme = 'github',
  }
}


