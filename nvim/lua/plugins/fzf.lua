return {
  {
    'ibhagwan/fzf-lua',
    -- optional for icon support
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<leader>ff', '<cmd>FzfLua files<cr>', desc = '[f]ind [f]iles' },
      { '<leader>fb', '<cmd>FzfLua buffers<cr>', desc = '[f]ind [b]uffers' },
      { '<leader>fg', '<cmd>FzfLua live_grep<cr>', desc = '[f]ind [g]rep' },
      { '<leader>ft', '<cmd>FzfLua tmux_buffers<cr>', desc = '[f]ind [t]mux' },
      { 'gr', '<cmd>FzfLua lsp_references<cr>', desc = '[g]oto [r]eferences' },
      { '<leader>fS', '<cmd>FzfLua lsp_document_symbols<cr>', desc = '[f]ind [S]ymbols' },
      { '<leader>fwS', '<cmd>FzfLua lsp_live_workspace_symbols<cr>', desc = '[f]ind [w]orkspace [s]ymbols' },
    },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {},
  },
}
