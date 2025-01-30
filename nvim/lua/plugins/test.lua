return {

  {
    dir = '~/dev/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-python',
    },

    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-python' {
            runner = 'pytest',
            python = '/Users/acmyers/dev/close/closeio/drython',
          },
        },
      }

      vim.keymap.set('n', '<leader>tc', function()
        local neotest = require 'neotest'
        neotest.run.run()
        neotest.output.open { enter = true }
      end, { desc = '[t]est [c]urrent' })

      vim.keymap.set('n', '<leader>tf', function()
        local neotest = require 'neotest'
        neotest.run.run(vim.fn.expand '%')
        neotest.output_panel.toggle()
      end, { desc = '[t]est [c]urrent' })
    end,
  },
}
