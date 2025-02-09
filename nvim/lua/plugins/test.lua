return {

  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-python',
      'rcarriga/nvim-dap-ui',
      'mfussenegger/nvim-dap',
    },

    config = function()
      local neotest = require 'neotest'

      neotest.setup {
        adapters = {
          require 'neotest-python',
        },
      }

      vim.keymap.set('n', '<leader>tc', function()
        neotest.run.run()
      end, { desc = '[t]est [c]urrent' })

      vim.keymap.set('n', '<leader>td', function()
        neotest.run.run { strategy = 'dap' }
        require('dapui').open()
      end, { desc = '[t]est [d]ap' })

      vim.keymap.set('n', '<leader>tf', function()
        neotest.run.run(vim.fn.expand '%')
      end, { desc = '[t]est [f]ile' })

      vim.keymap.set('n', '<leader>ts', function()
        neotest.summary.toggle()
      end, { desc = '[t]est [s]ummary' })

      vim.keymap.set('n', '<leader>to', function()
        neotest.output.open()
      end, { desc = '[t]est [o]utput' })

      vim.keymap.set('n', '<leader>tO', function()
        neotest.output_panel.toggle()
      end, { desc = '[t]est [O]utput panel' })

      vim.keymap.set('n', '<leader>tn', function()
        neotest.jump.next { status = 'failed' }
      end, { desc = '[t]est jump to [n]ext' })

      vim.keymap.set('n', '<leader>tp', function()
        neotest.jump.prev { status = 'failed' }
      end, { desc = '[t]est jump to [p]revious' })
    end,
  },
}
