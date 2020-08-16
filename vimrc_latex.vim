" ============
" vim-latex
" ============

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
	set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
	let g:tex_flavor='latex'

" Disable folding
	autocmd Filetype tex setlocal nofoldenable
	"

" spellcheck
" ============
"	map <F6> :setlocal spell! spelllang=en_us<CR>
" 	map <F9> :setlocal spell! spelllang=pt<CR>
" 	map <F9> :setlocal spell! spelllang=pt_br<CR>

" compiling
" ============
autocmd Filetype tex nnoremap <F5> :w<CR> :!clear && pdflatex -synctex=1 -interaction=nonstopmode %:t:r <CR><CR>
autocmd Filetype tex nnoremap <m-F5> :w<CR> :!clear && pdflatex -synctex=1 -interaction=nonstopmode %:t:r <CR>
autocmd Filetype tex nnoremap <F6> :!bibtex %:t:r <CR>
autocmd Filetype tex nnoremap <leader>lv :!evince %:t:r.pdf & disown <CR>
" let g:livepreview_previewer = 'evince'
" let g:livepreview_engine = 'pdftex'

" \ll <- compile
" \lv <- visualize
" latex-live-preview
" map <Leader>l :LLPStartPreview<CR>

" Shortcuts
" ===================
autocmd Filetype tex inoremap <leader>bb \textbf{}<++><esc>F}i
autocmd Filetype tex inoremap <leader>ii \textit{}<++><esc>F}i
autocmd Filetype tex inoremap "" ``''<++><esc>F`a
autocmd Filetype tex vnoremap <leader>bb di\textbf{}<esc>Pf}a<esc>
autocmd Filetype tex vnoremap <leader>ii di\textit{}<esc>Pf}a<esc>

" ===================

autocmd Filetype tex vnoremap <leader>tt di\texttt{}<esc>Pf}a<esc>
autocmd Filetype tex vnoremap <leader>ul di\underline{}<esc>Pf}a<esc>
autocmd Filetype tex vnoremap <leader>uu di\underline{}<esc>Pf}a<esc>
" autocmd Filetype tex vnoremap <leader>hl di\hl{}<esc>Pf}a<esc>
autocmd Filetype tex vnoremap <leader>bs di\mbs{}<esc>Pf}a<esc>
autocmd Filetype tex vnoremap <leader>bm di\mbf{}<esc>Pf}a<esc>
autocmd Filetype tex vnoremap <leader>bl di\blue{}<esc>Pf}a<esc>
autocmd Filetype tex vnoremap <leader>rr di\red{}<esc>Pf}a<esc>
" autocmd Filetype tex vnoremap <leader>$  di\(\)<esc>hPf)a<esc>
" autocmd Filetype tex vnoremap <leader>$  di$$<esc>Pf$a<esc>
autocmd Filetype tex vnoremap <leader>dm di\[<CR><CR>\]<esc>kPA<esc>
autocmd Filetype tex vnoremap <leader>cc di\citeonline{}<esc>Pf}a<esc>

autocmd Filetype tex inoremap <leader>tt \texttt{}<++><esc>F}i
autocmd Filetype tex inoremap <leader>ul \underline{}<++><esc>F}i
autocmd Filetype tex inoremap <leader>uu \underline{}<++><esc>F}i
"autocmd Filetype tex  inoremap <leader>hl \hl{}<++><esc>F}i
autocmd Filetype tex inoremap <leader>bs \mbs{}<++><esc>F}i
autocmd Filetype tex inoremap <leader>bm \mbf{}<++><esc>F}i
autocmd Filetype tex inoremap <leader>bl \blue{}<++><esc>F}i
autocmd Filetype tex inoremap <leader>rr \red{}<++><esc>F}i
"autocmd Filetype tex  inoremap <leader>$  \(\)<++><esc>F(a
autocmd Filetype tex inoremap <leader>dm \[<CR><CR>\]<++><esc>ki
autocmd Filetype tex inoremap <leader>mm <++><esc>a
autocmd Filetype tex inoremap <leader>cc \citeonline{}<++><esc>F}i

autocmd Filetype tex inoremap <leader>ff \begin{frame}<CR><++><CR>\end{frame}<CR><esc>3k
"autocmd Filetype tex inoremap <leader>bl \begin{block}{<++>}<CR><++><CR>\end{block}<CR><esc>3k
autocmd Filetype tex inoremap <leader>it \begin{itemize}<CR>\item<CR><++><CR>\end{itemize}<CR><esc>3k

autocmd Filetype tex inoremap <leader>fr \frac{}{<++>}<++><esc>F};i
autocmd Filetype tex inoremap <leader>- _{}<++><esc>F}i
autocmd Filetype tex inoremap <leader>~ ^{}<++><esc>F}i

autocmd Filetype tex inoremap EAL \begin{align}<CR><CR>\end{align}<++><esc>ki
autocmd Filetype tex inoremap $$ $$<++><esc>ba


