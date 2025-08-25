return {
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {},
	},
	{ "wakatime/vim-wakatime", lazy = false },
	{
		"NeogitOrg/neogit",
		opts = {},
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<C-n>", "<cmd>NvimTreeToggle<cr>", "Toggle nvim-tree" },
		},
		opts = {
			disable_netrw = true,
			hijack_netrw = true,
			open_on_tab = true,
			hijack_cursor = true,
			hijack_unnamed_buffer_when_opening = false,
			update_cwd = true,
			update_focused_file = {
				enable = true,
				update_cwd = false,
			},
			sync_root_with_cwd = true,
			view = {
				preserve_window_proportions = true,
				width = 30,
			},
			git = {
				enable = true,
				ignore = true,
			},
			actions = {
				open_file = {
					resize_window = true,
				},
			},
			renderer = {
				indent_markers = {
					enable = true,
				},
				group_empty = true,
			},
			hijack_directories = {
				enable = true,
				auto_open = true,
			},
		},
	},
}
