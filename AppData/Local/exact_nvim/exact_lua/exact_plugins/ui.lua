return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.g.catppuccin_flavour = "mocha"
      require("catppuccin").setup()
      vim.cmd.colorscheme("catppuccin")
    end,
    opts = {
      integrations = {
        dropbar = {
          enabled = true,
          color_mode = true,
        },
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        gitsigns = true,
        indent_blankline = {
          enabled = true,
        },
        lsp_trouble = true,
        markdown = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      theme = "catppuccin",
      options = {
        icons_enabled = true,
        component_separators = "",
      },
      sections = {
        lualine_a = {
          "mode",
        },
        lualine_b = {
          "branch",
          "diff",
          "lsp_status",
          {
            "diagnostics",
          },
        },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "searchcount", "selectioncount", "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { 'quickfix', 'trouble', 'lazy', 'fzf' }
    },
  },
  {
    "folke/which-key.nvim",
    event = "VimEnter",
    opts = {
      preset = "modern",
      delay = 0,
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
    init = function()
      local wk = require("which-key")
      wk.add({
        { "<leader>w", proxy = "<c-w>", group = "windows" },
      })
    end,
  },
  {
    "NMAC427/guess-indent.nvim",
    lazy = true,
  },
  { 'nvim-mini/mini.diff', version = '*', opts = {} },
  {
    "echasnovski/mini.icons",
    version = "*",
    opts = {},
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },
  {
    "Bekaboo/dropbar.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    opts = {
      bar = {
        enabled = true,
      },
    },
    config = function()
      local dropbar_api = require("dropbar.api")
      vim.keymap.set("n", "<Leader>;", dropbar_api.pick, {
        desc = "Pick symbols in winbar",
      })
      vim.keymap.set("n", "[;", dropbar_api.goto_context_start, {
        desc = "Go to start of current context",
      })
      vim.keymap.set("n", "];", dropbar_api.select_next_context, {
        desc = "Select next context",
      })
    end,
  },
}
