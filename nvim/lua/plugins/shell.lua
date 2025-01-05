return 
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      vim.keymap.set('n', '<leader>T', ':Neotree toggle<CR>', { desc = 'Toggle Neo[T]ree' })
      vim.keymap.set('n', '<leader>tt', ':ToggleTerm<CR>', { desc = 'Toggle terminal' })
      require('toggleterm').setup {}
    end,
  }
