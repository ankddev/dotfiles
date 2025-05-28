return {
  {
      "catgoose/nvim-colorizer.lua",
      event = "BufReadPre",
      opts = {},
  },
  {
      "lambdalisue/suda.vim",
      cmd = {"SudaRead", "SudaWrite"}
  },
  {
      "nvim-tree/nvim-tree.lua",
      dependencies = {"nvim-tree/nvim-web-devicons"},
      config = function()
          require("nvim-tree").setup(
              {
                  disable_netrw = true,
                  hijack_netrw = true,
                  open_on_tab = true,
                  hijack_cursor = true,
                  hijack_unnamed_buffer_when_opening = false,
                  update_cwd = true,
                  update_focused_file = {
                      enable = true,
                      update_cwd = false
                  },
                  sync_root_with_cwd = true,
                  view = {
                      preserve_window_proportions = true,
                      width = 30
                  },
                  git = {
                      enable = true,
                      ignore = true
                  },
                  actions = {
                      open_file = {
                          resize_window = true
                      }
                  },
                  renderer = {
                      indent_markers = {
                          enable = true
                      },
                      group_empty = true
                  },
                  hijack_directories = {
                      enable = true,
                      auto_open = true
                  }
              }
          )
      end
  },
  {
      "nvim-telescope/telescope.nvim",
      dependencies = {"nvim-lua/plenary.nvim"},
      opts = {
          defaults = {
              vimgrep_arguments = {
                  "rg",
                  "--no-heading",
                  "--with-filename",
                  "--line-number",
                  "--column",
                  "--smart-case"
              },
              initial_mode = "insert",
              scroll_strategy = "limit",
              results_title = false,
              layout_strategy = "horizontal",
              path_display = {"absolute"},
              selection_strategy = "reset",
              sorting_strategy = "ascending",
              color_devicons = true,
              file_ignore_patterns = {".git/", ".cache", "build/", "%.class", "%.pdf", "%.mkv", "%.mp4", "%.zip"},
              layout_config = {
                  horizontal = {
                      prompt_position = "top",
                      preview_width = 0.55,
                      results_width = 0.8
                  },
                  vertical = {
                      mirror = false
                  },
                  width = 0.85,
                  height = 0.92,
                  preview_cutoff = 120
              }
          }
      }
  },
  {
      "folke/flash.nvim",
      event = "VeryLazy",
      ---@type Flash.Config
      opts = {},
      -- stylua: ignore
      keys = {
          {
              "s",
              mode = {"n", "x", "o"},
              function()
                  require("flash").jump()
              end,
              desc = "Flash"
          },
          {
              "S",
              mode = {"n", "x", "o"},
              function()
                  require("flash").treesitter()
              end,
              desc = "Flash Treesitter"
          },
          {
              "r",
              mode = "o",
              function()
                  require("flash").remote()
              end,
              desc = "Remote Flash"
          },
          {
              "R",
              mode = {"o", "x"},
              function()
                  require("flash").treesitter_search()
              end,
              desc = "Treesitter Search"
          },
          {
              "<c-s>",
              mode = {"c"},
              function()
                  require("flash").toggle()
              end,
              desc = "Toggle Flash Search"
          }
      }
  },
  {
      "folke/trouble.nvim",
      cmd = {"Trouble"},
      opts = {
          modes = {
              lsp = {
                  win = {position = "right"}
              },
                diagnostics = {
                  win = {position = "right"}
              },
              test = {
                  mode = "diagnostics",
                  preview = {
                      type = "split",
                      relative = "win",
                      position = "right",
                      size = 0.3,
                  },
              },
          },
      },
      keys = {
          {"<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)"},
          {"<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)"},
          {"<leader>cs", "<cmd>Trouble symbols toggle<cr>", desc = "Symbols (Trouble)"},
          {"<leader>cS", "<cmd>Trouble lsp toggle<cr>", desc = "LSP references/definitions/... (Trouble)"},
          {"<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)"},
          {"<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)"},
          {
              "[q",
              function()
                  if require("trouble").is_open() then
                      require("trouble").prev({skip_groups = true, jump = true})
                  else
                      local ok, err = pcall(vim.cmd.cprev)
                      if not ok then
                          vim.notify(err, vim.log.levels.ERROR)
                      end
                  end
              end,
              desc = "Previous Trouble/Quickfix Item"
          },
          {
              "]q",
              function()
                  if require("trouble").is_open() then
                      require("trouble").next({skip_groups = true, jump = true})
                  else
                      local ok, err = pcall(vim.cmd.cnext)
                      if not ok then
                          vim.notify(err, vim.log.levels.ERROR)
                      end
                  end
              end,
              desc = "Next Trouble/Quickfix Item"
          }
      }
  },
  {
      "folke/todo-comments.nvim",
      cmd = {"TodoTrouble", "TodoTelescope"},
      opts = {},
      -- stylua: ignore
      keys = {
          {"]t", function()
                  require("todo-comments").jump_next()
              end, desc = "Next Todo Comment"},
          {"[t", function()
                  require("todo-comments").jump_prev()
              end, desc = "Previous Todo Comment"},
          {"<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "Todo (Trouble)"},
          {
              "<leader>xT",
              "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>",
              desc = "Todo/Fix/Fixme (Trouble)"
          },
          {"<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo"},
          {"<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme"}
      }
  },
  {
      "echasnovski/mini.pairs",
      event = "VeryLazy",
      opts = {
          modes = {insert = true, command = true, terminal = false},
          -- skip autopair when next character is one of these
          skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
          -- skip autopair when the cursor is inside these treesitter nodes
          skip_ts = {"string"},
          -- skip autopair when next character is closing pair
          -- and there are more closing pairs than opening pairs
          skip_unbalanced = true,
          -- better deal with markdown code blocks
          markdown = true
      }
  },
  {
      "folke/ts-comments.nvim",
      event = "VeryLazy",
      opts = {}
  },
  {"wakatime/vim-wakatime", lazy = false},
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = {
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
    },
  },
}
