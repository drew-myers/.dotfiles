return
  {
    {
      'karb94/neoscroll.nvim',
      config = function()
        require('neoscroll').setup()
      end,
    },

    -- Setup colorscheme with optional local override
    -- I like to switch the colorscheme to vibe with the desktop background
    -- on the particular computer.
    require'tools'.override_or_default("colorscheme", {
      'neanias/everforest-nvim',
      version = false,
      lazy = false,
      priority = 1000, -- make sure to load this before all the other start plugins
      init = function()
        vim.cmd.colorscheme 'everforest'
      end,
    }),
  }
