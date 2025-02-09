return {
  {
    'benlubas/molten-nvim',
    version = '^2.0.0', -- use version <2.0.0 to avoid breaking changes
    dependencies = { '3rd/image.nvim' },
    build = ':UpdateRemotePlugins',
    init = function()
      -- these are examples, not defaults. Please see the readme
      vim.g.molten_image_provider = 'image.nvim'
      vim.g.molten_output_win_max_height = 20
    end,
    keys = {

      {
        '<leader>rl',
        '<cmd>:MoltenEvaluateLine<cr>',
        desc = 'Evaluate line',
      },
      { '<leader>rr', '<cmd>:MoltenReevaluateCell<cr>', desc = 'Re-evaluate cell' },
      { '<leader>r', ':<C-u>MoltenEvaluateVisual<CR>gv', desc = 'Evaluate visual selection', mode = { 'v' } },
    },
  },
}
