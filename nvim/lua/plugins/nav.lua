return {
  {
    'ggandor/leap.nvim',
    config = function()
      require 'leap'
      vim.keymap.set('n', 's', '<Plug>(leap)')
    end,
  },
}
