return {
  {
    'dzfrias/arena.nvim',
    event = 'BufWinEnter',
    config = function()
      local arena = require 'arena'
      arena.setup()
      vim.keymap.set('n', '<leader><leader>', arena.toggle, { desc = '[ ] Arena buffer picker' })
    end,
  },
}
