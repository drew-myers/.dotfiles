return {
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('codecompanion').setup {
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
        },
        strategies = {
          chat = {
            adapter = 'qwencoder',
          },
          inline = {
            adapter = 'qwencoder',
          },
        },
      }
    end,
  },
}
