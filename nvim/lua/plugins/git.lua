return {
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  {
    'FabijanZulj/blame.nvim',
    lazy = false,
    config = function()
      require('blame').setup {}
    end,
    keys = {
      { '<leader>tB', '<cmd>BlameToggle<cr>', desc = 'Toggle Blame' },
      { '<leader>tbv', '<cmd>BlameToggle virtual<cr>', desc = 'Toggle Blame Virtual' },
      { '<leader>tbw', '<cmd>BlameToggle window<cr>', desc = 'Toggle Blame Window' },
    },
  },
}
