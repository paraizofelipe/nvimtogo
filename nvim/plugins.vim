call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'mileszs/ack.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'hecal3/vim-leader-guide'
Plug 'qpkorr/vim-bufkill'
Plug 'shougo/deoplete.nvim'
Plug 'neomake/neomake'

call plug#end()


" --- Airline ---
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_idx_mode = 1

autocmd FileType python setlocal completeopt-=preview


" --- Identline ---
let g:indentLine_enabled = 1
let g:indentLine_char = '│'
let g:indentLine_concealcursor = 0
let g:indentLine_conceallevel = 1
let g:indentLine_faster = 1
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#3A3A3A'
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)
let g:indentLine_fileType = ['c', 'cpp', 'go', 'js', 'py', 'json', 'yml', 'yaml']


" --- Multiple Cursor --- 
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" --- NERDTree ---
let g:NERDTreeDirArrowExpandable = ""
let g:NERDTreeDirArrowCollapsible = ""
let g:NERDTreeHighlightFolders = 1 
let g:NERDTreeHighlightFoldersFullName = 1

" --- deoplete ---
let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif

" --- vim-go ---
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
let g:go_fmt_fail_silently = 1
let g:go_highlight_types = 1
let g:go_highlight_diagnostic_errors = 0
let g:go_highlight_diagnostic_warnings = 0

" --- nomake ---
let g:neomake_open_list = 2
call neomake#configure#automake('w')
call neomake#configure#automake('nw', 750)
call neomake#configure#automake('rw', 1000)
call neomake#configure#automake('nrwi', 500)

