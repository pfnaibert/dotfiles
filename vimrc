" ============================================
" VIMRC
" paulo ferreira naibert
" github.com/pfnaibert
" ============================================

" source the open file	:source %
" open terminal	:term
" open vertical terminal	:vert term

" ============================================
" splits
" https://linuxhint.com/how-to-use-vim-split-screen/
" open vertical split	<C-w>v

" ============================================
" easier help
	nnoremap <C-h> <esc>:help

" ============================================
" Automatic reloading of .vimrc
"	autocmd BufWritePost ~/.vimrc source %

" Automatic reloading of .bashrc
"	autocmd BufWritePost ~/.bashrc source %

" ============================================
" REFS:
" Primeagen:     https://www.youtube.com/watch?v=n9k9scbTuvQ
" Luke Smith:    https://www.youtube.com/watch?v=cTBgtN-s2Zw
" Just Vim:      https://www.youtube.com/watch?v=XA2WjJbmmoM
" Damian Conway: https://www.youtube.com/watch?v=aHm36-na4-4
" Shawn Biddle:	 https://www.youtube.com/watch?v=Nim4_f5QUxA
" Shawn Biddle:	 https://www.youtube.com/watch?v=2pqipq-UEwQ
" ============================================

" ============================================
" vim-plug:	    https://github.com/junegunn/vim-plug
" Run the following line to Instll plugins :PlugInstall
call plug#begin()
	Plug 'junegunn/goyo.vim'
	Plug 'vim-airline/vim-airline'
	Plug 'morhetz/gruvbox'
	Plug 'lervag/vimtex'
	Plug 'srcery-colors/srcery-vim'
	Plug 'tpope/vim-fugitive'
"	Plug 'vim-syntastic/syntastic'
" 	Plug 'chrisbra/unicode.vim'
" 	Plug 'ryanoasis/vim-devicons'
" 	Plug 'vim-latex/vim-latex'
call plug#end()

" ============================================
" vim-pathogen:	https://github.com/tpope/vim-pathogen
" execute pathogen#infect()

" ===============================================================
" goyo
	map <leader>G :Goyo<CR>

" ===============================================================
" colorschemes
	colorscheme gruvbox
"	colorscheme industry
"	colorscheme srcery
	set background=dark

" ============================================
" airline
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#tab_nr_type = 1
	set laststatus=2
	let g:indentLine_noConcealCursor = 1
	let g:indentLine_color_term = 239
	let g:indentLine_char = '|'

" ===============================================================
" first thing is entering vim mode, not plain vi
	set nocompatible

" disable automaticc commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" enable syntax and plugins
	syntax enable
	filetype plugin on
	set path+=**

" tab-completion
" C-x C-f "finds files and folders"
" C-n and C-p "autocompletes"
	set wildmode=longest,list,full
	set wildmenu

	set noerrorbells

" numbers and relative numbers
	set nu rnu

" encoding
	set encoding=utf-8
" encoding
"	scriptencoding utf-8

" highlight Comment term=bold ctermfg=white

" Better copy & paste
	set pastetoggle=<F2>
	set clipboard=unnamed

" disable swap files
	set nobackup noswapfile

" tabs
	set shiftwidth=4 tabstop=4 softtabstop=4

" CASE SENSITIVE SEARCH
	set incsearch       "Lookahead as search pattern is specified
"	set ignorecase      "Ignore case in all searches...
"	set smartcase       "...unless uppercase letters used
	set hlsearch        "Highlight all matches
	highlight Search ctermfg=White

" cursorline
	set cursorline
	hi CursorLine cterm=NONE ctermbg=8 ctermfg=NONE

"enable and set title
	set title
	set titlestring=VIM:\ %-25.55F\ %a%r%m titlelen=70

" mostra os comandos no canto inferior direito
	set showcmd

" Don't page long listings
	set nomore
" Save buffer automatically when changing files
	set autowrite
" Always reload buffer when external changes detected
	set autoread
" Save buffer every 10 chars typed
	set updatecount=10

" Show trailing whitespaces
	map <leader>W /\s\+$<CR>

" meu erro mais comum
	map :W :w
	map :Q :q
	map :WQ :wq
	map :Wq :wq
	map :wQ :wq

" visual lines
	nnoremap j gj
	nnoremap k gk

" Drag
	nnoremap <c-s-up> ddkP
	nnoremap <c-s-down> ddp

" navigation center
	nnoremap { {zz
	nnoremap } }zz
	vnoremap { {zz
	vnoremap } }zz

" last line center
	nnoremap G Gzz

" Center screen on next/previous selection.
	nnoremap * *zz
	nnoremap # #zz
	nnoremap n nzz
	nnoremap N Nzz

" Last and next jump should center too.
	nnoremap <C-o> <C-o>zz
	nnoremap <C-i> <C-i>zz

" splits
	set splitright splitbelow

	nnoremap <C-j> <C-w><C-J>
	nnoremap <C-k> <C-w><C-K>
	nnoremap <C-l> <C-w><C-L>
	nnoremap <C-h> <C-w><C-H>

" buffers
	nnoremap <Leader>bd :bd <CR>
	nnoremap <Leader>bp :bp <CR>
	nnoremap <Leader>bn :bn <CR>
	nnoremap <Leader>bf :bf <CR>

" terminal
	nnoremap <Leader>te :term <CR>

" Yank from the cursor to the end of the line, to be consistent with C and D.
	nnoremap Y y$

" Make Visual modes work better
" Square up visual selections...
	set virtualedit=block

" Make BS/DEL work as expected in visual modes (i.e. delete the selected text)...
	vmap <BS> x

" folding
	set nofoldenable " no folding

" Vim commands for creating and deleting folds are not very useful and are potentially dangerous when typed accidentally. They can be disabled in .vimrc as follows: >
" Disable commands for creating and deleting folds.
	noremap zf <Nop>
	noremap zF <Nop>
	noremap zd <Nop>
	noremap zD <Nop>
	noremap zE <Nop>

" wrap after 80 cols
	set wrap
	set linebreak
	set textwidth=0
"	set textwidth=0
	set wrapmargin=0

" list disables linebreak
	set nolist

" Highlight column 81
"	set colorcolumn=81

" open tex bibliography
	noremap <leader>bi :vsp<space>$BIB<CR>

" open tex macros
	noremap <leader>ma :vsp<space>$LMAC<CR>

" Check File in shellcheck
	noremap <leader>S :!clear && shellcheck %<CR>

" execute the current shell script
	autocmd Filetype sh nnoremap <F12> :!clear && ./%<CR><CR>

" ============================================
" LaTeX
	source ~/dotfiles/vimrc_latex.vim

" ============================================
" Rmarkdown as markdown

augroup rmarkdown
    " au! BufRead,BufNewFile *.Rmd  set filetype=rmarkdown
    au! BufRead,BufNewFile *.Rmd  set filetype=markdown
augroup END

"render
	 autocmd Filetype markdown nnoremap <F5> :!clear && Rscript -e 'rmarkdown::render("%")' <CR>

" ============================================
" END OF VIMRC
" ============================================
