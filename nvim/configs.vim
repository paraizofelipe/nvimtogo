" --- Editor ---
set mouse =
set conceallevel=0
set cc=123
set autoindent 
set pastetoggle=<F2>
set tabstop=4 shiftwidth=4 expandtab
set foldmethod=indent
set number
set relativenumber
set backspace=indent,eol,start


" --- Theme --- 
syntax on
set laststatus=2
colorscheme gruvbox
highlight ColorColumn guibg=#3a3a3a


" --- Python ---
let g:loaded_python_provider = 0
let g:python3_host_prog = '/usr/bin/python3'
