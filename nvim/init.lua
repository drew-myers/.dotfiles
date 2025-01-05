-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Enable 24 bit colors
vim.opt.termguicolors = true

-- Treesitter defines folds
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
-- All folds expanded by default
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
-- Max fold depth
vim.opt.foldnestmax = 4

-- Allow termina to run in background
vim.opt.hidden = true

-- Make line numbers default
vim.opt.number = true
-- Relative line numbers
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- [[ Basic Keymaps ]]

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Make it easy to bail out terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<Up>', '<C-w><C-k>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<Down>', '<C-w><C-j>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<Left>', '<C-w><C-h>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<Right>', '<C-w><C-l>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<C-k>', ':resize -5<CR>')
vim.keymap.set('n', '<C-j>', ':resize +5<CR>')
vim.keymap.set('n', '<C-h>', ':vertical resize +5<CR>')
vim.keymap.set('n', '<C-l>', ':vertical resize -5<CR>')

-- Page through buffers
-- If this seems weird, it's because I have had a hardware macro on my keyboard for this for a
-- long time and its legacy muscle memory at this point
vim.keymap.set('n', ']b', ':bnext<CR>', { noremap = true, silent = true, desc = 'Go to next buffer' })
vim.keymap.set('n', '[b', ':bprev<CR>', { noremap = true, silent = true, desc = 'Go to previous buffer' })

-- [[ Basic Autocommands ]]
-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require('lazy').setup({
  require 'plugins.core',
  require 'plugins.comments',
  require 'plugins.git',
  require 'plugins.which-key',
  require 'plugins.telescope',
  require 'plugins.lsp',
  require 'plugins.format',
  require 'plugins.cmp',
  require 'plugins.autopairs',
  require 'plugins.neo-tree',
  require 'plugins.mini',
  require 'plugins.treesitter',
  require 'plugins.line',
  require 'plugins.buffers',
  require 'plugins.repl',
  require 'plugins.dap',
  require 'plugins.yazi',
  require 'plugins.marks',
  require 'plugins.nav',
  require 'plugins.shell',
  require 'plugins.markdown',
  require 'plugins.ui',
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
-- Putting this down here for now because it's experimental and I 
-- don't know how it works
require 'plugins.lang.roc'
