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
              -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
              -- Be aware that you also will need to properly configure your LSP server to
              -- provide the inlay hints.
              inlay_hints = {
                  enabled = true,
                  exclude = {"vue"} -- filetypes for which you don't want to enable inlay hints
              },
              -- Enable this to enable the builtin LSP code lenses on Neovim >= 0.10.0
              -- Be aware that you also will need to properly configure your LSP server to
              -- provide the code lenses.
              codelens = {
                  enabled = true
              },
              -- add any global capabilities here
              capabilities = {
                  workspace = {
                      fileOperations = {
                          didRename = true,
                          willRename = true
                      }
                  }
              },
              -- options for vim.lsp.buf.format
              -- `bufnr` and `filter` is handled by the LazyVim formatter,
              -- but can be also overridden when specified
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
          "saadparwaiz1/cmp_luasnip"
      },
      config = function()
          local cmp = require("cmp")
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
          }
      end
  }
}
