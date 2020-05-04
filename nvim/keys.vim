let mapleader = " "

" ---- clipboard ----
vnoremap <C-y> "+y
nnoremap <C-p> "+p
vnoremap <C-p> "+p

" ---- buffers ----
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>, <Plug>AirlineSelectPrevTab
nmap <leader>. <Plug>AirlineSelectNextTab

nmap <leader>bq :BW<CR>
nmap <leader>bd :BD<CR>
nnoremap <leader>Down <C-w>j
nnoremap <leader>Up <C-w>k
nnoremap <leader>Right <C-w>l
nnoremap <leader>Left <C-w>h

" --- identLines --- 
map gut :IndentLinesToggle<CR>

" ---- NERDTree ----
map <leader>ft :NERDTreeToggle<CR>

" --- VIM-GO ----
map <leader>gb :GoBuild<CR>
map <leader>gr :GoRun<CR>
map <leader>gi :Goinstall<CR>

" --- leader guide ---
let g:lmap =  {}

call leaderGuide#register_prefix_descriptions('<Space>', 'g:lmap')
nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>

let g:lmap.f = { 'name' : 'File Menu' }
let g:lmap.o = { 'name' : 'Open Stuff' }

let g:lmap.g = {
				\'name' : 'Git Menu',
				\'s' : ['Gstatus', 'Git Status'],
                \'p' : ['Gpull',   'Git Pull'],
                \'u' : ['Gpush',   'Git Push'],
                \'c' : ['Gcommit', 'Git Commit'],
                \'w' : ['Gwrite',  'Git Write'],
                \}
