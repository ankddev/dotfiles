vim.g.neovide_title_background_color =
    string.format("%x", vim.api.nvim_get_hl(0, { id = vim.api.nvim_get_hl_id_by_name("Normal") }).bg)

vim.g.neovide_title_text_color = "pink"
vim.g.neovide_position_animation_length = 0.15
vim.o.guifont = "Maple Mono NF"
vim.g.neovide_scale_factor = 0.8
