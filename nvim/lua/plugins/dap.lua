return
  {
    'rcarriga/nvim-dap-ui',
    event = 'VeryLazy',
    dependencies = {
      'mfussenegger/nvim-dap',
      'mfussenegger/nvim-dap-python',
      'nvim-neotest/nvim-nio',
    },
    config = function()
      vim.keymap.set('n', '<leader>dc', function()
        require('dap').continue()
      end, { desc = '[d]ebug [c]ontinue' })

      vim.keymap.set('n', '<leader>do', function()
        require('dap').step_over()
      end, { desc = '[d]ebug step [o]ver' })

      vim.keymap.set('n', '<leader>di', function()
        require('dap').step_into()
      end, { desc = '[d]ebug step [i]nto' })

      vim.keymap.set('n', '<leader>dO', function()
        require('dap').step_out()
      end, { desc = '[d]ebug step [O]ut' })

      vim.keymap.set('n', '<leader>db', function()
        require('dap').toggle_breakpoint()
      end, { desc = '[d]ebug set [b]reakpoint' })

      vim.keymap.set('n', '<leader>dr', function()
        require('dap').repl.open()
      end, { desc = '[d]ebug open [r]epl' })

      vim.keymap.set('n', '<leader>df', function()
        require('dap-python').test_method()
      end, { desc = '[d]ebug [f]unction' })

      vim.keymap.set('n', '<leader>du', function()
        require('dapui').toggle()
      end, { desc = '[d]ebug [U]I' })

      require('dap-python').setup 'python'
      require('dapui').setup()
    end,
  }
