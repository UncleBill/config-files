"================================================================================
"neobundle
"================================================================================
set nocompatible               " be iMproved
filetype off                   " required!

if has('vim_starting')
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

set rtp+=~/.vim/bundle/vundle/
call neobundle#rc(expand('~/.vim/bundle'))

"source Bundles list
so ~/.vim/Bundles.vim

filetype plugin indent on     " required!
NeoBundleCheck


"================================================================================
"misc function
"================================================================================
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

function! Sdcv(...)
    let s:keyword = ""
    if a:0 == 0
        let s:keyword = expand("<cword>")
        if s:keyword == ""
            echo "sdcv: no keyword input"
            return
        endif
    else
        let s:keyword = a:1
    endif
    let expl=system('sdcv -n ' . s:keyword)
    "echo expl
    windo if expand("%")=="sdcv-dict-tmp" | q! |  endif
    25sp sdcv-dict-tmp
    setlocal buftype=nofile bufhidden=delete noswapfile
    nnoremap <buffer> q <c-w>c
    nnoremap <buffer> <Esc> <c-w>c
    1s/^/\=expl/
    1
    wincmd J
endfunction

command! -nargs=* Sdcv call Sdcv(<args>)
nmap <M-d> :Sdcv<cr>

colo native
if has("gui_running")
	colo atom
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

"================================================================================
"unite
"================================================================================
nnoremap <silent><C-p> :Unite file_rec/async -auto-resize<cr>
" nnoremap <silent> <C-p> :<C-u>Unite -no-split -auto-preview -buffer-name=files file_mru  file_rec/async:!<CR>
nnoremap <silent><space>/ :Unite grep:. -auto-resize -auto-preview<cr>
nnoremap <silent><C-x> :Unite file_mru -auto-resize<cr>
nnoremap <silent><space>y :Unite history/yank<cr>
nnoremap <silent><space>s :Unite -quick-match buffer<cr>
let g:unite_winheight = 10
let g:unite_enable_start_insert = 1
let g:unite_split_rule = 'botright'


"================================================================================
"sourcing
"================================================================================
source ~/.vim/mapping.vim
"settings
source ~/.vim/setting.vim
"autocmd
source ~/.vim/autocmd.vim


"================================================================================
"instant markdown
"================================================================================
let g:instant_markdown_autostart = 0


"===============================================================================
" QuickRun
"===============================================================================

let g:quickrun_config = {}
let g:quickrun_config['*'] = {
            \ 'runner/vimproc/updatetime' : 100,
            \ 'outputter' : 'buffer',
            \ 'runner' : 'vimproc',
            \ 'running_mark' : 'ﾊﾞﾝ（∩`･ω･）ﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾞﾝ',
            \ 'into' : 1,
            \ 'runmode' : 'async:remote:vimproc'
            \}
" QuickRun triggers markdown preview
let g:quickrun_config.markdown = {
            \ 'runner': 'vimscript',
            \ 'command': ':InstantMarkdownPreview',
            \ 'exec': '%C',
            \ 'outputter': 'null'
            \}
let g:quickrun_config.html = {
            \ 'command': 'google-chrome',
            \ 'outputter': 'null'
            \ }
let g:quickrun_config.matlab = {
            \ 'command': 'octave',
            \ 'exec': '%C -q',
            \ }

abbreviate youcompleteme YouCompleteMe
abbreviate ultisnip UltiSnip
abbreviate neocomplete Neocomplete

set re=1
if has("profile")
let g:syntime_report=''
fun! SynTime(eng)
      syn clear
      exe 'set re='.a:eng
      edit!
      syntime on
      redraw!
      redraw!
      redraw!
      redraw!
      redir =>> g:syntime_report
      echom "Engine" a:eng
      syntime report
      syntime off
      redir END
endfun

fun! DoSynTime()
        let g:syntime_report=''
        call SynTime(1)
        call SynTime(2)
        echom g:syntime_report
endfun

command! -nargs=0 SynTime : call DoSynTime()
endif
" コピペ厳禁

" quickrun 用のマッピング
nmap <Space>q <Plug>(precious-quickrun-op)
omap ic <Plug>(textobj-precious-i)
vmap ic <Plug>(textobj-precious-i)


" コンテキストが切り替わった場合に処理をフック
augroup my-augroup
    autocmd!
    " vim のコンテキストに切り替わった時に
    " いくつかのマッピングを削除する
    autocmd User PreciousFiletypeLeave_vim iunmap <buffer> <CR>
    autocmd User PreciousFiletypeLeave_vim nunmap <buffer> <Leader><Leader>r
augroup END


" filetype=help は insert 時のみ切り替わるように設定
let g:precious_enable_switch_CursorMoved = {
\   "help" : 0
\}

function! s:help()
    augroup my-help
        autocmd!
        autocmd InsertEnter <buffer> :PreciousSwitch
        autocmd InsertLeave <buffer> :PreciousReset
    augroup END
endfunction
autocmd FileType help call s:help()
" カーソル移動時の自動切り替えを無効化
" このオプションは filetype ごとに設定可能
" "*" は全ての filetype に影響する
let g:precious_enable_switch_CursorMoved = {
\   "*" : 0
\}
let g:precious_enable_switch_CursorMoved_i = {
\   "*" : 0
\}

" insert に入った時にスイッチし、抜けた時に元に戻す
augroup test
    autocmd!
    autocmd InsertEnter * :PreciousSwitch
    autocmd InsertLeave * :PreciousReset
augroup END
" vim:fdm=marker
