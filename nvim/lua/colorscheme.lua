vim.g.gruvbox_italic = 1
vim.api.nvim_set_option('termguicolors', true)
vim.cmd('colorscheme '..G.colorscheme)

vim.cmd('hi EndOfBuffer guifg=bg')
