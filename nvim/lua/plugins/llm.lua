return {
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('codecompanion').setup {
        display = {
          diff = {
            enabled = true,
            provider = 'mini_diff',
          },
        },
        adapters = {
          deepseek = function()
            return require('codecompanion.adapters').extend('ollama', {
              name = 'deepseek', -- Give this adapter a different name to differentiate it from the default ollama adapter
              schema = {
                model = {
                  default = 'deepseek-r1:14b',
                },
                num_ctx = {
                  default = 16384,
                },
                num_predict = {
                  default = -1,
                },
              },
            })
          end,
          phi4 = function()
            return require('codecompanion.adapters').extend('ollama', {
              name = 'phi4', -- Give this adapter a different name to differentiate it from the default ollama adapter
              schema = {
                model = {
                  default = 'phi4:latest',
                },
                num_ctx = {
                  default = 16384,
                },
                num_predict = {
                  default = -1,
                },
              },
            })
          end,
          qwencoder = function()
            return require('codecompanion.adapters').extend('ollama', {
              name = 'quencoder', -- Give this adapter a different name to differentiate it from the default ollama adapter
              schema = {
                model = {
                  default = 'qwen2.5-coder:32b',
                },
                num_ctx = {
                  default = 16384,
                },
                num_predict = {
                  default = -1,
                },
              },
            })
          end,
          qwencoder_small = function()
            return require('codecompanion.adapters').extend('ollama', {
              name = 'qwencoder_small', -- Give this adapter a different name to differentiate it from the default ollama adapter
              schema = {
                model = {
                  default = 'qwen2.5-coder:14b',
                },
                num_ctx = {
                  default = 16384,
                },
                num_predict = {
                  default = -1,
                },
              },
            })
          end,
          g1b = function()
            return require('codecompanion.adapters').extend('ollama', {
              name = 'g1b', -- Give this adapter a different name to differentiate it from the default ollama adapter
              schema = {
                model = {
                  default = 'gemma3:1b',
                },
                num_ctx = {
                  default = 32000,
                },
                num_predict = {
                  default = -1,
                },
              },
            })
          end,
          g4b = function()
            return require('codecompanion.adapters').extend('ollama', {
              name = 'g4b', -- Give this adapter a different name to differentiate it from the default ollama adapter
              schema = {
                model = {
                  default = 'gemma3:4b',
                },
                num_ctx = {
                  default = 32000,
                },
                num_predict = {
                  default = -1,
                },
              },
            })
          end,
          g12b = function()
            return require('codecompanion.adapters').extend('ollama', {
              name = 'g12b', -- Give this adapter a different name to differentiate it from the default ollama adapter
              schema = {
                model = {
                  default = 'gemma3:12b',
                },
                num_ctx = {
                  default = 32000,
                },
                num_predict = {
                  default = -1,
                },
              },
            })
          end,
        },
        strategies = {
          chat = {
            adapter = 'g4b',
          },
          inline = {
            adapter = 'g4b',
          },
        },
      }
      vim.cmd [[cab cc CodeCompanion]]
    end,
    keys = {
      {
        '<C-a>',
        '<cmd>CodeCompanionActions<cr>',
        desc = 'Open LLM Actions',
        mode = { 'n', 'v' },
      },
      {
        '<LocalLeader>a',
        '<cmd>CodeCompanionChat Toggle<cr>',
        desc = 'Toggle LLM Chat',
        mode = { 'n', 'v' },
      },
      {
        'ga',
        '<cmd>CodeCompanionChat Add<cr>',
        desc = 'Send code to LLM chat',
        mode = { 'v' },
      },
    },
  },
}
