return 
  {
    'geg2102/nvim-python-repl',
    dependencies = 'nvim-treesitter',
    ft = { 'python', 'lua', 'scala' },
    config = function()
      vim.keymap.set('n', '<space>iu', function()
        require('nvim-python-repl').send_statement_definition()
      end, { desc = 'Send semantic unit to REPL' })
      vim.keymap.set('v', '<space>is', function()
        require('nvim-python-repl').send_visual_to_repl()
      end, { desc = 'Send visual selection to REPL' })
      vim.keymap.set('n', '<space>ib', function()
        require('nvim-python-repl').send_buffer_to_repl()
      end, { desc = 'Send entire buffer to REPL' })
      vim.keymap.set('n', '<space>ie', function()
        require('nvim-python-repl').toggle_execute()
      end, { desc = 'Automatically execute command in REPL after sent' })
      vim.keymap.set('n', '<space>it', function()
        require('nvim-python-repl').toggle_vertical()
      end, { desc = 'Create REPL in vertical or horizontal split' })
      vim.keymap.set('n', '<space>io', function()
        require('nvim-python-repl').open_repl()
      end, { desc = 'Opens the REPL in a window split' })

      -- If CLOSE_HOME is set & we're under that directory then shell into ipython in container
      local get_python_cmd = function()
        local close_home = os.getenv 'CLOSE_HOME'
        if close_home and string.find(vim.fn.getcwd(), close_home) then
          local close_dc_file_path = os.getenv 'CLOSE_HOME' .. '/devtools/docker-compose.yaml'
          return 'docker compose -f ' .. close_dc_file_path .. ' exec -it closeio_api ./manage.py shell'
        else
          -- If not then just run ipython
          return 'ipython'
        end
      end

      require('nvim-python-repl').setup {
        execute_on_send = true,
        vsplit = false,
        spawn_command = {
          python = get_python_cmd(),
        },
      }
    end,
  }
