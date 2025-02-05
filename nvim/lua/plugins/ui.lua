local override_or_default = require('tools').override_or_default

return {
  -- Setup colorscheme with optional local override
  -- I like to switch the colorscheme to vibe with the desktop background
  -- on the particular computer.
  override_or_default('colorscheme', {
    'neanias/everforest-nvim',
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    init = function()
      vim.cmd.colorscheme 'everforest'
    end,
  }),

  -- Setup light/dark mode toggle
  {
    'cormacrelf/dark-notify',
    config = function()
      require('dark_notify').run {
        dark = {
          colorscheme = override_or_default('dark_colorscheme_name', 'everforest'),
        },
        light = {
          colorscheme = override_or_default('light_colorscheme_name', 'everforest'),
        },
      }
    end,
  },
}
