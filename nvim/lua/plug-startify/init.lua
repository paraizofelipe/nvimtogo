vim.g.startify_custom_header = {
'                                                          ',
'         ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
'         ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
'         ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
'         ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
'         ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
'         ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
'                                                          ',
'                                                          ',
'                     Author: Felipe Paraizo               ',
'                     URL: http://paraizo.dev              ',
}

vim.g.startify_session_dir = '~/.config/nvim/session'
vim.g.startify_session_autoload = 1
vim.g.startify_session_delete_buffers = 1
vim.g.startify_change_to_vcs_root = 1
vim.g.startify_fortune_use_unicode = 1
vim.g.startify_session_persistence = 1
vim.g.startify_enable_special = 0
vim.g.webdevicons_enable_startify = 1

local currentDir = vim.cmd('pwd')

vim.g.startify_lists = {
    { type= 'files',     header= {'   Files'} },
    { type= 'dir',       header= {'   Current Directory'} },
    { type= 'sessions',  header= {'   Sessions'} },
    { type= 'bookmarks', header= {'   Bookmarks'} },
}

vim.cmd([[
function! StartifyEntryFormat()
        return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction
]])

vim.g.startify_bookmarks = {
    { c = '~/.i3/config' },
    { i = '~/.config/nvim/init.vim' },
    { z = '~/.zshrc' },
    { p = '~/projects' },
}

