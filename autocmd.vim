autocmd FileType html,css imap <c-cr> <c-y>,
autocmd FileType html,css nmap <c-cr> <c-y>,
autocmd FileType python let g:jedi#popup_on_dot=0
autocmd FileType php let b:surround_{char2nr("-")} = "<?php \r ?>"
autocmd FileType javascript let b:surround_99 = "(function(){\r}()); // closure"
autocmd BufWrite * :%s/\s\+$//e

"dictionary setting{
autocmd FileType xml set dictionary+=~/Dropbox/works/Vim/dict/xml.dict
autocmd FileType cpp,c set dictionary+=~/Dropbox/works/Vim/dict/cpp.dict
autocmd FileType cpp   set path+=/usr/include/c++/4.6.3/
autocmd FileType html,
				\asp,
				\json,
				\coffee
				\ set dictionary+=~/Dropbox/works/Vim/dict/html.dict
                                    \~/Dropbox/works/Vim/dict/javascript.dict,
                                    \~/Dropbox/works/Vim/dict/css.dict
autocmd FileType javascript,json,coffee set dictionary+=~/Dropbox/works/Vim/dict/javascript.dict
autocmd FileType css,styl,less set dictionary+=~/Dropbox/works/Vim/dict/css.dict
autocmd FileType vim set dictionary+=~/Dropbox/works/Vim/dict/vim.dict
"**todo**
"let dictfold = ~/Dropbox/works/Vim/dict/
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
autocmd! BufNewFile,BufRead *.html set ft=html.css.javascript
autocmd! BufNewFile,BufRead *.ejs set ft=html
autocmd! BufNewFile,BufRead *.go set ft=go
autocmd! BufNewFile,BufRead *.md set ft=markdown
autocmd! BufNewFile,BufRead *.scss *.sass set ft=scss
"autocmd VimEnter,Colorscheme * :hi IndenGuidesOdd guibg=red ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndenGuidesEven guibg=green ctermbg=4
"}
