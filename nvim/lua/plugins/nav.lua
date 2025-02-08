return {
  {
    'ggandor/leap.nvim',
    config = function()
      require 'leap'
      vim.keymap.set({ 'n', 'x' }, 's', '<Plug>(leap)')
    end,
  },
}
