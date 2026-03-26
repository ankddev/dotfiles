return {
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      lazy_load = true,
    },
  },
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {
      modes = { insert = true, command = true, terminal = false },
      -- Skip autopair when next character is one of these
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      -- Skip autopair when the cursor is inside these treesitter nodes
      skip_ts = { "string" },
      -- Skip autopair when next character is closing pair
      -- and there are more closing pairs than opening pairs
      skip_unbalanced = true,
      -- Better deal with markdown code blocks
      markdown = true,
    },
  },
  {
    "hedyhli/outline.nvim",
    cmd = { "Outline", "OutlineOpen" },
    keys = {
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {},
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    opts = {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        initial_mode = "insert",
        scroll_strategy = "limit",
        results_title = false,
        layout_strategy = "horizontal",
        path_display = { "absolute" },
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        color_devicons = true,
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.85,
          height = 0.92,
          preview_cutoff = 120,
        },
      },
    },
    keys = {
      { "<leader>f", desc = "Telescope" },
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Telescope find files"
      },
      {
        "<leader>fb",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "Telescope buffers"
      },
      {
        "<leader>fc",
        function()
          require("telescope.builtin").command()
        end,
        desc = "Telescope find commands"
      },
      {
        "<leader>fr",
        function()
          require("telescope.builtin").registers()
        end,
        desc = "Telescope registers"
      },
      {
        "<leader>fp",
        mode = { "n" },
        function()
          require("telescope.builtin").builtin()
        end,
        desc = "Telescope pickers"
      },
      -- Git pickers
      {
        "<leader>fg",
        desc = "Telescope Git"
      },
      {
        "<leader>fgb",
        function()
          require("telescope.builtin").git_branches()
        end,
        desc = "Telescope Git branches"
      },
      {
        "<leader>fgc",
        function()
          require("telescope.builtin").git_commits()
        end,
        desc = "Telescope Git commits"
      },
      {
        "<leader>fgs",
        function()
          require("telescope.builtin").git_status()
        end,
        desc = "Telescope Git status"
      },
    },
    cmd = "Telescope"
  },
  {
    "folke/flash.nvim",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash"
      },
      {
        "S",
        mode = { "n", "x", "o" },
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
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search"
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search"
      }
    }
  },
}
