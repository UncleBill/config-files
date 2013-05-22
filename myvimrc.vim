""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"source Bundles list
so ~/.vim/Bundles.vim

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"""""""""""""""""""""""""""""""""""""""""""""""""'
"Compile with gcc{{{
func! CmpGcc()
	exec "w"
    "exec "!g++ % -o %<.exe && echo  >nul && %<"
	"exec "!g++ % -o %<.exe && %<"
    !gcc % -o %< && %<
endfunc
command! CmpGcc call CmpGcc()
"nnoremap <F5> :CmpGcc<CR>
"inoremap <F5> <Esc>:CmpGcc<CR>
"}}}
"Random coloschemme function{{{
function! Ranlook()
	let colorfiles=[]
	if empty(colorfiles)
		for f in split(globpath(&rtp,"colors/*.vim"),"\n")
			call add(colorfiles,get(matchlist(f,'\([^\\\/]*\)\.vim'),1))
		endfor
	endif
	exe "colo" get(colorfiles,localtime()%len(colorfiles))
endfunction
"}}}
"Random coloschemme function
command! Ranlook call Ranlook()

function! Dict()
    echon system("sdcv ".expand("<cword>"))
endfunction
function! Rdict()
    exe ":r !sdcv ".expand("<cword>")
endfunction
command! Dict call Dict()
command! Rdict call Rdict()

"reindent while save the file{
"autocmd BufWrite * :normal mZgg=G'Z
"}
colo native
if has("gui_running")
	colo desert
	"colo asu1dark
	"colo xoria256
endif

"line_motions{{{
function! MoveLineUp()
	call MoveLineOrVisualUp(".", "")
endfunction

function! MoveLineDown()
	call MoveLineOrVisualDown(".", "")
endfunction

function! MoveVisualUp()
	call MoveLineOrVisualUp("'<", "'<,'>")
	normal gv
endfunction

function! MoveVisualDown()
	call MoveLineOrVisualDown("'>", "'<,'>")
	normal gv
endfunction

function! MoveLineOrVisualUp(line_getter, range)
	let l_num = line(a:line_getter)
	if l_num - v:count1 - 1 < 0
		let move_arg = "0"
	else
		let move_arg = a:line_getter." -".(v:count1 + 1)
	endif
	call MoveLineOrVisualUpOrDown(a:range."move ".move_arg)
endfunction

function! MoveLineOrVisualDown(line_getter, range)
	let l_num = line(a:line_getter)
	if l_num + v:count1 > line("$")
		let move_arg = "$"
	else
		let move_arg = a:line_getter." +".v:count1
	endif
	call MoveLineOrVisualUpOrDown(a:range."move ".move_arg)
endfunction

function! MoveLineOrVisualUpOrDown(move_arg)
	let col_num = virtcol(".")
	execute "silent! ".a:move_arg
	execute "normal! ".col_num."|"
endfunction

nnoremap <silent> <M-Up> :<C-u>call MoveLineUp()<CR>
xnoremap <silent> <M-Up> :<C-u>call MoveVisualUp()<CR>
inoremap <silent> <M-Up> <C-o>:call MoveLineUp()<CR>
"vnoremap <silent> <C-Up> :<C-u>call MoveVisualUp()<CR>
"
nnoremap <silent> <M-Down> :<C-u>call MoveLineDown()<CR>
inoremap <silent> <M-Down> <C-o>:call MoveLineDown()<CR>
"vnoremap <silent> <C-Down> :<C-u>call MoveVisualDown()<CR>
xnoremap <silent> <M-Down> :<C-u>call MoveVisualDown()<CR>

"}}}
source ~/.vim/mapping.vim
"settings
source ~/.vim/setting.vim
"autocmd
source ~/.vim/autocmd.vim
fun! GetSnipsInCurrentScope()
    let snips = {}
    for scope in [bufnr('%')] + split(&ft, '\.') + ['_']
        call extend(snips, get(s:snippets, scope, {}), 'keep')
        call extend(snips, get(s:multi_snips, scope, {}), 'keep')
    endfor
    return snips
endf
" vim:fdm=marker
