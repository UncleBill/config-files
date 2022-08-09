autocmd FileType php let b:surround_{char2nr("-")} = "<?php \r ?>"
autocmd FileType javascript let b:surround_99 = "(function(){\r}()); // closure"
autocmd FileType javascript let b:surround_45 = "for(){ \r }"
" autocmd BufWrite * :%s/\s\+$//e
"autocmd FileType * :NeoComplCacheCachingBuffer<cr>

"dictionary setting{
" autocmd FileType xml set dictionary=~/Dropbox/works/Vim/dict/xml.dict
" autocmd FileType cpp,c set dictionary=~/Dropbox/works/Vim/dict/cpp.dict
" autocmd FileType cpp   set path+=/usr/include/c++/4.6.3/
" autocmd FileType html,
" 				\asp,
" 				\json,
" 				\coffee
" 				\ set dictionary=~/Dropbox/works/Vim/dict/html.dict
"                                     \~/Dropbox/works/Vim/dict/javascript.dict,
"                                     \~/Dropbox/works/Vim/dict/css.dict
" autocmd FileType javascript,json,coffee set dictionary=~/Dropbox/works/Vim/dict/javascript.dict
" " autocmd FileType coffee set ft=coffee.javascript
" autocmd FileType css,styl,less set dictionary=~/Dropbox/works/Vim/dict/css.dict
" autocmd FileType vim set dictionary=~/Dropbox/works/Vim/dict/vim.dict
"**todo**
"let dictfold = ~/Dropbox/works/Vim/dict/
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
"autocmd! BufNewFile,BufRead *.html set ft=html.css.javascript
autocmd! BufNewFile,BufReadPost *.ejs set ft=html
autocmd! BufNewFile,BufReadPost *.go set ft=go
autocmd! BufNewFile,BufReadPost *.md set ft=markdown
autocmd! BufNewFile,BufReadPost *.scss,*.sass set ft=scss
autocmd! BufNewFile,BufReadPost *.vue set ft=html
autocmd! BufNewFile,BufReadPost *.ux set ft=html
autocmd! BufNewFile,BufReadPost *.qjs,*.wxs set ft=javascript
" TODO g:zipPlugin_ext
au BufReadCmd *.rpk call zip#Browse(expand("<amatch>"))
au BufReadCmd *.rpks call zip#Browse(expand("<amatch>"))
au BufReadCmd *.srpk call zip#Browse(expand("<amatch>"))
au BufReadCmd *.vsix call zip#Browse(expand("<amatch>"))
autocmd BufEnter *.png,*.jpg,*gif,*.mp4,*.mp3,*.pdf exec "!open " .. expand("%") | :bw
"autocmd VimEnter,Colorscheme * :hi IndenGuidesOdd guibg=red ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndenGuidesEven guibg=green ctermbg=4
"autocmd! BufEnter *.coffee map <F5> :CoffeeCompile<cr>
"autocmd! BufLeave *.coffee map <F5> :QuickRun<cr>

autocmd! BufRead *.vue setfiletype html
autocmd! BufRead *.swan setfiletype html

" auto mkdir
augroup auto_mkdir
	au!
	au BufWritePre,FileWritePre * call <SID>auto_mkdir()
augroup END
function <SID>auto_mkdir()
	" Get directory the file is supposed to be saved in
	let s:dir = expand("<afile>:p:h")

	" Create that directory (and its parents) if it doesn't exist yet
	if !isdirectory(s:dir)
		call mkdir(s:dir, "p")
	endif
endfunction

autocmd FileType calendar set nonumber norelativenumber
