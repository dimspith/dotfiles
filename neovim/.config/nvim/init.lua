-- Aliases
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

-- Clone paq-nvim if not installed
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/paq-nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/savq/paq-nvim.git', install_path})
  execute 'packadd paq-nvim'
end

-- Plugins
require "paq" {
   "nvim-lua/popup.nvim";
   "nvim-lua/plenary.nvim";
   "nvim-treesitter/nvim-treesitter";
   "neovim/nvim-lspconfig";
   "ojroques/nvim-lspfuzzy";
   "hrsh7th/nvim-compe";
   "blackCauldron7/surround.nvim";
   "nvim-telescope/telescope.nvim";
   "projekt0n/github-nvim-theme";
   "kyazdani42/nvim-web-devicons";
   "hoob3rt/lualine.nvim";
   "axvr/org.vim";
}

require 'surround'.setup {}

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

  source = {
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

cmd [[
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
]]

require('lualine').setup {
		options = {
			theme = 'github',
		}
}
require("github-theme").setup({
  themeStyle = "dark",
})

-------------------- Options --------------------

opt.background = "dark"     -- Set the background theme to dark
opt.termguicolors = true    -- Enable true color support
opt.nu = true               -- Enable (line + relative line) numbers
opt.relativenumber = true
opt.autoindent = true       -- Set code autoindentation
opt.cindent = true
opt.hidden = true           -- Enable background buffers
opt.cursorline = true       -- Highlight current line
-- opt.modeline = true
opt.showmode = false        -- Don't show the indicator in insert mode
opt.tabstop = 4             -- Number of spaces tabs count for
opt.expandtab = true        -- Expand tabs into spaces
opt.smarttab = true
opt.splitbelow = true       -- Split open at the bottom and right
opt.splitright = true
opt.completeopt = {'menuone', 'noselect'} -- Improve completion
opt.mouse = 'nicr'          -- Smooth mouse scrolling
opt.smartcase = true        -- Do not ignore case with capitals
opt.smartindent = true      -- Insert indents automatically
opt.scrolloff = 4           -- Lines of context
opt.incsearch = true        -- Show search while typing
opt.hlsearch = false        -- Don't highlight matches after search ends
opt.inccommand = "split"    -- Live substitution preview
opt.magic = true            -- Regular expressions on search
opt.lazyredraw = true       -- Don't redraw while executing macros
opt.undofile = true         -- File with undo history
opt.backup = false          -- Don't create backup files
opt.writebackup = false
opt.ruler = true            -- Always show position
opt.directory = "/tmp//"    -- Undo and swap file location
opt.undodir = "/tmp//"
opt.wildmenu = true         -- Command-line completion mode
opt.wildmode = {'list', 'longest', 'full'}
opt.wrap = false            -- Disable line wrap

-------------------- Mappings --------------------

-- Helper function
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Navigate to start/end of screen
map('n', 'K', 'H');
map('n', 'J', 'L');

-- Navigate to start/end of line
map('n', 'H', '^');
map('v', 'H', '^');
map('o', 'H', '^');
map('n', 'L', '$');
map('v', 'L', '$');
map('o', 'L', '$');

-- Move along visual lines, not numbered ones
map('n', 'j', 'gj');
map('n', 'k', 'gk');
map('n', '^', 'g^');
map('n', '$', 'g$');
map('v', 'j', 'gj');
map('v', 'k', 'gk');
map('v', '^', 'g^');
map('v', '$', 'g$');

-- Navigating splits
map('n', '<A-h>', '<C-w>h');
map('n', '<A-j>', '<C-w>j');
map('n', '<A-k>', '<C-w>k');
map('n', '<A-l>', '<C-w>l');

-- <Tab> to navigate the completion menu
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})


-- Easy splits
map('n', '<space>sv', ':vsplit<cr>');
map('n', '<space>sh', ':split<cr>');

-- Easy tabs
map('n', '<space>tn', ':tabnew<cr>');
map('n', '<space>tc', ':tabclose<cr>');

-- Easy buffers
map('n', '<space>bq', ':bd!<cr>');
map('n', '<space>bn', ':bn<cr>');
map('n', '<space>bp', ':bp<cr>');

-- Telescope keybindings
map('n', '<space>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>');
map('n', '<space>fg', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>');
map('n', '<space>fb', '<cmd>lua require(\'telescope.builtin\').buffers()<cr>');
map('n', '<space>fh', '<cmd>lua require(\'telescope.builtin\').help_tags()<cr>');

-------------------- Autocommands -------------------- 

cmd [[
augroup filetype_c
	 autocmd!
     autocmd FileType c setlocal tabstop=8 shiftwidth=8
augroup END
]]

-------------------- Tree-Sitter --------------------

local ts = require 'nvim-treesitter.configs'
ts.setup {ensure_installed = 'maintained', highlight = {enable = true}}

-------------------- LSP --------------------

local lsp = require 'lspconfig'
local lspfuzzy = require 'lspfuzzy'

-- Default settings
lsp.nimls.setup {}
lsp.clangd.setup {}
lsp.sumneko_lua.setup{}

-- root_dir is where the LSP server will start: here at the project root otherwise in current folder
lsp.pyls.setup {root_dir = lsp.util.root_pattern('.git', fn.getcwd())}

-- Make the LSP client use FZF instead of the quickfix list
lspfuzzy.setup {}

-- Keybindings
map('n', '<space>,', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', '<space>;', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', '<space>d', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', '<space>h', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<space>m', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<space>r', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<space>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
