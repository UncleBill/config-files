autocmd FileType html,css imap <c-cr> <c-y>,
autocmd FileType html,css nmap <c-cr> <c-y>,
autocmd FileType php let b:surround_{char2nr("-")} = "<?php \r ?>"
autocmd FileType javascript let b:surround_99 = "(function(){\r}()); // closure"
autocmd FileType javascript let b:surround_45 = "for(){ \r }"
" autocmd BufWrite * :%s/\s\+$//e
"autocmd FileType * :NeoComplCacheCachingBuffer<cr>

"dictionary setting{
autocmd FileType xml set dictionary=~/Dropbox/works/Vim/dict/xml.dict
autocmd FileType cpp,c set dictionary=~/Dropbox/works/Vim/dict/cpp.dict
autocmd FileType cpp   set path+=/usr/include/c++/4.6.3/
autocmd FileType html,
				\asp,
				\json,
				\coffee
				\ set dictionary=~/Dropbox/works/Vim/dict/html.dict
                                    \~/Dropbox/works/Vim/dict/javascript.dict,
                                    \~/Dropbox/works/Vim/dict/css.dict
autocmd FileType javascript,json,coffee set dictionary=~/Dropbox/works/Vim/dict/javascript.dict
" autocmd FileType coffee set ft=coffee.javascript
autocmd FileType css,styl,less set dictionary=~/Dropbox/works/Vim/dict/css.dict
autocmd FileType vim set dictionary=~/Dropbox/works/Vim/dict/vim.dict
"**todo**
"let dictfold = ~/Dropbox/works/Vim/dict/
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
"autocmd! BufNewFile,BufRead *.html set ft=html.css.javascript
autocmd! BufNewFile,BufRead *.ejs set ft=html
autocmd! BufNewFile,BufRead *.go set ft=go
autocmd! BufNewFile,BufRead *.md set ft=markdown
autocmd! BufNewFile,BufRead *.scss *.sass set ft=scss
"autocmd VimEnter,Colorscheme * :hi IndenGuidesOdd guibg=red ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndenGuidesEven guibg=green ctermbg=4
"autocmd! BufEnter *.coffee map <F5> :CoffeeCompile<cr>
"autocmd! BufLeave *.coffee map <F5> :QuickRun<cr>

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
