-- Map leader to which_key
-- nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
-- vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

-- Create map to add keys to
vim.g.which_key_map =  {}
-- Define a separator
vim.g.which_key_sep = '→'
-- set timeoutlen=100

-- Not a fan of floating windows for this
vim.g.which_key_use_floating_win = 0

-- Change the colors if you want
-- highlight default link WhichKey          Operator
-- highlight default link WhichKeySeperator DiffAdded
-- highlight default link WhichKeyGroup     Identifier
-- -- highlight default link WhichKeyDesc      Function

-- Hide status line
-- autocmd! FileType which_key
-- autocmd  FileType which_key set laststatus=0 noshowmode noruler
-- \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

-- s is for search
vim.g.which_key_map.s = {
   name = '+search' ,
   ['/'] = { ':History/'     , 'history'},
   [';'] = { ':Commands'     , 'commands'},
   a = { ':Ag'           , 'text Ag'},
   c = { ':Commits'      , 'commits'},
   C = { ':BCommits'     , 'buffer commits'},
   f = { ':Files'        , 'files'},
   g = { ':GFiles'       , 'git files'},
   G = { ':GFiles?'      , 'modified git files'},
   h = { ':History'      , 'file history'},
   H = { ':History:'     , 'command history'},
   l = { ':Lines'        , 'lines'} ,
   m = { ':Marks'        , 'marks'} ,
   M = { ':Maps'         , 'normal maps'} ,
   p = { ':Helptags'     , 'help tags'} ,
   P = { ':Tags'         , 'project tags'},
   s = { ':Snippets'     , 'snippets'},
   S = { ':Colors'       , 'color schemes'},
   t = { ':Rg'           , 'text Rg'},
   T = { ':BTags'        , 'buffer tags'},
   w = { ':Windows'      , 'search windows'},
   y = { ':Filetypes'    , 'file types'},
   z = { ':FZF'          , 'FZF'},
}

-- silent! unmap <leader>b
-- silent! unmap <leader>t

-- Hidden keys but actives
vim.g.which_key_map[1] = 'which_key_ignore'
vim.g.which_key_map[2] = 'which_key_ignore'
vim.g.which_key_map[3] = 'which_key_ignore'
vim.g.which_key_map[4] = 'which_key_ignore'
vim.g.which_key_map[5] = 'which_key_ignore'
vim.g.which_key_map[6] = 'which_key_ignore'
vim.g.which_key_map[7] = 'which_key_ignore'
vim.g.which_key_map[8] = 'which_key_ignore'
vim.g.which_key_map[9] = 'which_key_ignore'
vim.g.which_key_map.ba = 'which_key_ignore'
vim.g.which_key_map.bd = 'which_key_ignore'


vim.g.which_key_map.b = {
     name = '+buffers' ,
     d = {':CtrlSpace dq' , 'Delete buffers'},
     c = {':CtrlSpace cq'  , 'Close buffers'},
     l = {':CtrlSpace'  , 'List buffers'},
 }

vim.g.which_key_map.t = {
    name = '+buffers' ,
    d = {':CtrlSpace cq' , 'Delete tabs'},
    c = {':tabclose'  , 'Close tabs'},
    l = {':CtrlSpace l'  , 'List tabs'},
}

vim.g.gwhich_key_map.c = {
    name = '+comment' ,
    l = {'<plug>NERDCommenterToggle'  , 'comment line'},
}

-- c is for floaterm
vim.g.which_key_map.a = {
    name = '+applications' ,
    f = { ':FloatermNew fzf'                               , 'fzf' },
    g = { ':FloatermNew lazygit'                           , 'git' },
    d = { ':FloatermNew lazydocker'                        , 'docker' },
    n = { ':FloatermNew node'                              , 'node' },
    p = { ':FloatermNew python'                            , 'python' },
    r = { ':FloatermNew ranger'                            , 'ranger' },
    t = { ':FloatermToggle'                                , 'toggle' },
    s = { ':FloatermNew ncdu'                              , 'ncdu' },
}

vim.g.which_key_map.n = {
    name = '+nvim',
    k = {':e ~/.config/nvim/keys/which-key.vim', 'edit keys config'},
    i = {':e ~/.config/nvim/init.vim', 'edit init config'},
    p = {':e ~/.config/nvim/vim-plug/plugins.vim', 'edit plug config'},
    g = {':e ~/.config/nvim/general/settings.vim', 'edit general settings'},
    c = {':CocConfig', 'edit coc.nvim settings'},
}


vim.g.which_key_map.d = {
    name = '+diff',
    t = { ':diffthis', 'active diff this file'},
    o = { ':diffoff', 'disable diff in file'},
    s = { ':diffsplit', 'open diff in split mode'},
}

vim.g.which_key_map.f = {
    name = '+files',
    t = { ':Explore', 'Open netrw' },
    r = { ':FloatermNew ranger', 'ranger' },
}

vim.g.which_key_map.o = {
    name = '+Open',
    q = {':copen', 'Open quickfix'},
    l = {':lopen', 'Open local list'},
}

augroup lang_keys
    autocmd!
    autocmd BufNewFile,BufRead *.go vim.g.which_key_map.l = {
     name : '+golang',
     a = {':GoAlternative', 'go alternative'},
     b = {':GoBuild', 'go build'},
     c = {':GoCoverageToggle', 'go coverage toggle'},
     d = {':GoDoc', 'go doc'},
     g = {':GoDef', 'go def'},
     h = {':GoInfo', 'go info'},
     i = {':GoImplements', 'go implements'},
     I = {':GoImports', 'format impoprts'},
     l = {':GoDecls', 'decl file'},
     L = {':GoDeclsDir', 'decl dir'},
     k = {':GoDebugBreakpoint', 'go add breakpoint'},
     r = {':GoRename', 'go rename'},
     s = {':GoDebugStart', 'go start debug'},
     S = {':GoDebugStop', 'go stop debug'},
     t = {':GoTest', 'go test'},
     T = {':GoTestFunc', 'go test function'},
     x = {':GoImplements', 'go implements'},
     }

    autocmd BufNewFile,BufRead *.py let g:which_key_map.l = {
    \ 'name' : '+python',
    \ 'a' : [':call jedi#show_assignments()', 'goto assignments'],
    \ 'd' : [':call jedi#show_documentation()', 'show doccumentation'],
    \ 'r' : [':call jedi#rename()', 'rename'],
    \ }

    autocmd BufNewFile,BufRead *.sql let g:which_key_map.l = {
    \ 'name' : '+python',
    \ 'x' : ['SQLExec', 'Exec SQL line'],
    \ }
augroup END


let g:which_key_map.ss = {
\ 'name' : '+session',
\ 's' : [':SSave', 'save session'],
\ 'c' : [':SClose', 'close session'],
\ }

let g:which_key_map.tt = {
\ 'name' : '+translate',
\ 'p' : [':TransToPT', 'translate to pt-br'],
\ 'e' : [':TransToEN', 'translate to en'],
\ }

-- Register which key map
call which_key#register('<Space>', "g:which_key_map")
