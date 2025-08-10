return {
  {
      "antosha417/nvim-lsp-file-operations",
      dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-tree.lua",
      },
      config = function()
          require("lsp-file-operations").setup()
      end,
  },
  {
      "neovim/nvim-lspconfig",
      config = function()
          vim.lsp.enable("rust_analyzer")
          vim.lsp.enable("asm_lsp")
          vim.lsp.enable("gleam")
          vim.lsp.enable("gopls")
          vim.lsp.enable("ts-ls")
          vim.lsp.enable("astro")
          vim.lsp.enable("clangd")
      end,
      opts = function()
          local ret = {
              diagnostics = {
                  underline = true,
                  update_in_insert = false,
                  virtual_text = {
                      spacing = 4,
                      source = "if_many",
                      prefix = "●"
                  },
                  severity_sort = true
              },
              inlay_hints = {
                  enabled = true,
              },
              codelens = {
                  enabled = true
              },
              capabilities = {
                  workspace = {
                      fileOperations = {
                          didRename = true,
                          willRename = true
                      }
                  }
              },
              format = {
                  formatting_options = nil,
                  timeout_ms = nil
              }
          }
          return ret
      end
  },
  {
      "NeogitOrg/neogit",
      opts = {}
  },
  {
      "hrsh7th/nvim-cmp",
      dependencies = {
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-path",
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-nvim-lua",
          "saadparwaiz1/cmp_luasnip",
          "onsails/lspkind.nvim"
      },
      config = function()
          local cmp = require("cmp")
          local lspkind = require('lspkind')
          cmp.setup {
              sources = {
                  {name = "nvim_lsp"},
                  {name = "luasnip"},
                  {name = "buffer"},
                  {name = "path"}
              },
              mapping = cmp.mapping.preset.insert({
                  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                  ['<C-f>'] = cmp.mapping.scroll_docs(4),
                  ['<C-Space>'] = cmp.mapping.complete(),
                  ['<C-e>'] = cmp.mapping.abort(),
                  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
              }),
            formatting = {
                format = lspkind.cmp_format({
                  mode = 'symbol_text', -- show symbol and text annotations
                  maxwidth = {
                    -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                    -- can also be a function to dynamically calculate max width such as
                    -- menu = function() return math.floor(0.45 * vim.o.columns) end,
                    menu = 50, -- leading text (labelDetails)
                    abbr = 50, -- actual suggestion item
                  },
                  ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                  show_labelDetails = true, -- show labelDetails in menu. Disabled by default

                  -- The function below will be called before any actual modifications from lspkind
                  -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                  before = function (entry, vim_item)
                    -- ...
                    return vim_item
                  end
                })
              }
          }
      end
  }
}
