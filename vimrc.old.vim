" ============================================
" VIMRC
" ============================================

" OPTIONAL: This enables automatic indentation as you type.
	filetype indent on
"	filetype off
" 	set autoindent
	let g:Tex_DefaultTargetFormat='pdf'
	let g:Tex_MultipleCompileFormats='pdf,bibtex,pdf'

"=====[ Comments are important ]==================
	highlight Comment term=bold ctermfg=white

"============== Pathogen ===========
	execute pathogen#infect()

"=====[ Miscellaneous features (mainly options) ]================
	set ma
	set titleold=

" ================
" Drag
	nnoremap <c-s-up> ddkP
	nnoremap <c-s-down> ddp
"	nnoremap <C-S-j> ddp
" 	nnoremap <C-S-k> ddkP

"=====[ Search folding ]=====================

" Don't start new buffers folded
	set foldlevelstart=99

" Highlight folds
	highlight Folded  ctermfg=cyan ctermbg=black

" --------------- splits -------------------
	nnoremap <Leader>ss :vsplit <C-R>=expand("%:p:h") . "/" <CR>
	nnoremap <Leader>sv :vsplit<CR>
	nnoremap <Leader>sh :split<CR>

" ------------- TABS  ---------------------
"	map <Leader>tn :tabe newfile.txt<CR>
"	map <Leader>t :tabe <C-R>=expand("%:p:h") . "/" <CR>
"	map <Leader>tc :tabc

" ===============================================================
" --------- Write and Read -------------

"copy to comand line shell
"	vnoremap <Leader> y:<C-R>"
	vnoremap <F3> y:<C-R>"
	nnoremap <F3> :r !
"	vnoremap <Leader>ss :w! >> <C-R>=expand('%:p:h') . "/scratch.txt" <CR>
"	nnoremap <Leader>rr :r <C-R>=expand("%:p:h") . "/" <CR>
"	nnoremap <Leader>;p :r ~/vimclipboard/tmp.txt <CR>

" ===============================================================
" ------------- PANDOC ------"
"	let extpf=%:r.pdf
"	map <Leader>t :echo @%<CR>
"	autocmd Filetype markdown nnoremap <F8> <esc>:w<cr> :!./render.R <CR><CR>

"  autocmd Filetype markdown nnoremap <F8> <esc>:w<cr> :!pandoc % -o %:r.pdf<CR><CR>
"  autocmd Filetype markdown nnoremap <m-F8> :w<CR> :!pandoc % -o %:r.pdf<cr>

	autocmd Filetype markdown nnoremap <F9> <esc>:w<cr> :!pandoc % -o %:r.pdf<CR><CR>
	autocmd Filetype markdown nnoremap <m-F9> :w<CR> :!pandoc % -o %:r.pdf<cr>

"	autocmd Filetype markdown nnoremap <F9> <esc>:w<cr> :!pandoc % -H ./utils/header-md.tex -o ./output/%:r.pdf<CR><CR>
"	autocmd Filetype markdown nnoremap <m-F9> :w<CR> :!pandoc % -H ./utils/header-md.tex -o ./output/%:r.pdf<cr>
"	autocmd Filetype md nnoremap <F9>pa :! pandoc *.md -o caderno.pdf<CR><CR>

" ===============================================================
" ------------- ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" http://vimcasts.org/episodes/meet-ultisnips/

	nnoremap <Leader>sn <esc>:UltiSnipsEdit<cr>

" If you want :UltiSnipsEdit to split your window.
	let g:UltiSnipsEditSplit="vertical"
	let g:UltiSnipsSnippetsDir="~/.vim/snips"
	let g:UltiSnipsUsePythonVersion = 3
	let g:UltiSnipsSnippetDirectories=["UltiSnips", "snips"]

"	let g:UltiSnipsExpandTrigger="<tab>"
"	let g:UltiSnipsListSnippets="<c-tab>"
"	let g:UltiSnipsJumpForwardTrigger="<c-j>"
"	let g:UltiSnipsJumpBackwardTrigger="<s-k>"

" ===============================================================
" Voom customization tips   [[[2~

"	nnoremap <Leader>vv :Voom<CR>
	nnoremap <Leader>vo :Voom org<CR>
	nnoremap <Leader>vm :Voom markdown<CR>
	nnoremap <Leader>vt :Voom latex<CR>
	autocmd Filetype tex nnoremap <Leader>vv <esc>:Voom latex<cr>
	autocmd Filetype markdown nnoremap <Leader>vv <esc>:Voom markdown<cr>
	nnoremap <LocalLeader>n :Voomunl<CR>
	com! VM Voom markdown
	com! VMT VoomToggle markdown

" This method is better than using syntax/text.vim because it also works when a nonstandard foldmarker is specified on file's modeline.

" write file with sudo permission
	map <leader>sudo :w !sudo tee %

" ====================================================
" VIMWIKI e VIMWWW conflict REMAP:
"	nmap <Leader>wq <Plug>VimkiUISelect

" ====================================================
" R
"	nnoremap <Leader>r :echo expand('%:p')<CR>
"	autocmd Filetype R vnoremap <F9> :w<CR> :w! tmp.R<cr>
"	vnoremap <leader>rs :w! tmp.R<CR> :!R -f tmp.R<CR>
	vnoremap <leader>rs :w! tmp.R<CR>
"	nnoremap \rs :w! tmp.R<CR>
"	nnoremap \rp :!R -f tmp.R<CR>
"	nnoremap \rf :!R -f %<CR>

" =====================================================
" timestamp
"	nnoremap <F3> :-1r!date<CR>
" 	nnoremap <F3> :r!date +'\%Y/\%m/\%d \%a \%T' <c-u><esc>p
" 	nnoremap <F3> <esc>:r!date +'\%Y/\%m/\%d \%a \%T'<cr>
	nnoremap <F4> D<esc>:r!date +'\%Y/\%m/\%d \%a \%T'<cr>v$dk$pjddk$
	inoremap <F4> <esc>D<esc>:r!date +'\%Y/\%m/\%d \%a \%T'<cr>v$dk$pjddk$

" ==============================================
" ACK

"	nnoremap <C-0> :Ack
	nnoremap <Leader>a :Ack!<Space>

"	autocmd Filetype tex setlocal nofoldenable

	noremap <Leader>pw <esc>:pwd<cr>
	noremap <Leader>ls <esc>:!ls<cr>
	noremap <Leader>cd <esc>:cd
	noremap <Leader>cp <esc>:cp
	noremap <Leader>sf <esc>:!find ./ -maxdepth 1 -type f
"	noremap <Leader>pd <esc>:!find ./ -maxdepth 1 -type f
	noremap <Leader>t1 <esc>:!tree ./ -d -L 1
	noremap <Leader>t1 <esc>:!tree ./ -d -L 1
	noremap <Leader>t2 <esc>:!tree ./ -d -L 2
	noremap <Leader>t3 <esc>:!tree ./ -d -L 3

" Markdown
" ================
	autocmd Filetype markdown inoremap <leader>bb ****<++><esc>bla
	autocmd Filetype markdown vnoremap <leader>bb di****<esc>hPf*la<esc>
	autocmd Filetype markdown inoremap <leader>ii **<++><esc>ba
	autocmd Filetype markdown vnoremap <leader>ii di**<esc>Pf*a<esc>
	autocmd Filetype markdown inoremap <leader>ss ~~~<CR><CR>~~~<CR><++><esc>kk
	autocmd Filetype markdown vnoremap <leader>ss di~~~<CR>~~~<CR><++><esc>kP}2kO<esc>
	autocmd Filetype markdown nnoremap <Leader>vv <esc>:Voom markdown<cr>

" TABLE-MODE
" ==========

	let g:table_mode_corner = '+'
	let g:table_mode_separator = '|'

" ============================================
" END OF VIMRC
" ============================================
