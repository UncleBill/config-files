set nocompatible               " be iMproved
filetype off                   " required!

"source Bundles list
call plug#begin('~/.vim/plugged')
so ~/.vim/Bundles.vim
call plug#end()


"================================================================================
"misc function
"================================================================================
"Random coloschemme function{{{
let s:colorfiles=[]
function! Ranlook()
	if empty(s:colorfiles)
		for f in split(globpath(&rtp,"colors/*.vim"),"\n")
			call add(s:colorfiles,get(matchlist(f,'\([^\\\/]\+\)\.vim'), 1))
		endfor
	endif
	exe "colo" get(s:colorfiles,localtime()%len(s:colorfiles))
endfunction
"}}}
"Random coloschemme function
command! Ranlook call Ranlook()

" css Uncompress
" ==============
function! CssUncompress()
    execute '%s/\([;,{}]\)/\1\r/g'
    normal gg=G
endfunction
autocmd FileType css command!  CssUncompress call CssUncompress()

let g:sdcv_notebook="~/.vim/extra/sdcv.dict"
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
    let s:sdcv_pre_winnr = winnr()
    let expl=system('sdcv -n ' . s:keyword)
    let failstr = "Nothing similar to ".s:keyword.", sorry :(\n"
    if expl == failstr
        echomsg "Can't find '".s:keyword."'"
        return
    endif
    let expl = expl.'___end___'
    " save to notebook
    " +-----------------------------------------+
    call vimproc#system('echo ' . s:keyword.' >> ' . g:sdcv_notebook)
    call vimproc#system('cat ' . g:sdcv_notebook . ' | sort | uniq > ' . g:sdcv_notebook)
    "echo expl
    windo if expand("%")=="sdcv-dict-tmp" | q! |  endif
    silent split sdcv-dict-tmp
    setlocal buftype=nofile bufhidden=delete noswapfile
    autocmd! BufLeave sdcv-dict-tmp execute s:sdcv_pre_winnr.'wincmd w'
    nnoremap <buffer> q <c-w>c
    nnoremap <buffer> <Esc> <c-w>c
    nnoremap <buffer> <Space><Space> <c-f>
    nnoremap <buffer> <2-LeftMouse> <c-w>c
    1s/^/\=expl/
    1
    wincmd J
    let maxheight = 30
    let num = min( [len(split(expl,"\n")), maxheight] )
    execute "resize ".num
endfunction

function! s:sdcv_look(...)
    if a:1 == ''
        return split( system('cat ' . g:sdcv_notebook) )
    endif
    " use neco-look's lazy-load function
    return halffuzzy#look(a:1)
endfunction

command! -nargs=* -complete=customlist,s:sdcv_look Sdcv call Sdcv(<f-args>)
nmap <silent><M-d> :Sdcv<cr>
nmap <silent><M-LeftMouse> :Sdcv<cr>

command! Sthissession call Sthissession()
function! Sthissession()
    if v:this_session == ''
        echomsg 'No session opened!'
        return
    endif
    execute 'mksession! ' . v:this_session
endfunction

command! -nargs=0 Save2Dict call Save2Dict()
function! Save2Dict()
    " save the dictionary basing on filetype
    let word = expand("<cword>")
    let dictdir = '~/Dropbox/works/Vim/dict/'
    for ft in split(&filetype,'\.')
        let file = dictdir.ft.'.dict'
        " echomsg "for loop"
        " echomsg file
        call vimproc#system('echo ' .word. ' >> '.file)
        call vimproc#system('cat ' .file. ' | sed -e "s/\r$//g" | sort | uniq > '.file)
    endfor
endfunction

function! s:TermRun(...) abort
  execute 'terminal ++close ' .. join(a:000, ' ')
endfunction
command! -nargs=* Run call s:TermRun(<f-args>)
command! -nargs=* Tig call s:TermRun('tig', <f-args>)

let g:prism_colorschemes = ['atom', 'badwolf',
      \ 'emacs',
      \ 'nord', 'northland', 'rigel',
      \ 'gruvbox', 'SlateDark', 'blueprint',
      \ 'Green', 'cyberpunk',
      \ 'Benokai', 'sierra', 'marklar',
      \ 'embark', 'tokyonight', 'maroloccio']

if has("gui_running")
  set cursorline
else
  colo desert
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
" nnoremap <silent><C-p> :Unite file_rec/async -auto-resize<cr>
" nnoremap <silent> <C-p> :<C-u>Unite -no-split -auto-preview -buffer-name=files file_mru  file_rec/async:!<CR>
" let g:unite_source_grep_command = "ag"
" let g:unite_source_grep_default_opts = "--nogroup --nocolor"
" let g:unite_source_grep_max_candidates=500
" let g:unite_source_file_mru_limit=300
" nnoremap <silent><space>/ :Unite grep:. -auto-resize -auto-preview -immediately<cr>
" nnoremap <silent><space>? :Unite grep:. -auto-resize -auto-preview -immediately<cr><c-r><c-w><cr>
" nnoremap <silent><space>y :Unite grep:. -auto-resize -auto-preview -immediately<cr><c-r>"<cr>
" nnoremap <silent><space>r :Unite grep -resume<cr>
" nnoremap <silent><space>o :Unite outline -auto-resize -auto-preview -immediately<cr>
" nnoremap <silent><space>O :Unite outline -auto-preview -tab -immediately<cr>
" nnoremap <silent><space>b :Unite buffer -auto-resize<cr>
" nnoremap <silent><space>B :Unite buffer -immediately<cr>
" nnoremap <silent><space>t :Unite tab -auto-resize<cr>
nnoremap <silent><space>k :bprevious<cr>
nnoremap <silent><space>j :bnext<cr>
nnoremap <silent><Space><Tab> :buffer #<cr>
" autocmd BufEnter preview :set previewheight=25
" autocmd BufEnter * if &pvw | resize 30 | endif
" autocmd BufLeave * if &pvw | resize 12 | endif
" nnoremap <silent><C-x> :Unite file_mru -auto-resize -immediately<cr>
" nnoremap <silent><space>s :Unite -quick-match buffer -immediately<cr>
" let g:unite_winheight = 30
" let g:unite_enable_start_insert = 1
" let g:unite_split_rule = 'botright'
" call unite#custom#profile('default', 'context', {
" \   'start_insert': 1,
" \   'prompt_direction': 'top',
" \})
" autocmd FileType unite call s:unite_my_settings()
" function! s:unite_my_settings() "{{{
"     " Overwrite settings.
"
"     nmap <buffer> <ESC>      <Plug>(unite_exit)
"     imap <buffer> jj      <Plug>(unite_insert_leave)
"     "imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
"
"     imap <buffer><expr> j unite#smart_map('j', '')
"     imap <buffer> <TAB>   <Plug>(unite_select_next_line)
"     imap <buffer> <c-j>   <Plug>(unite_select_next_line)
"     imap <buffer> <c-k>   <Plug>(unite_select_previous_line)
"     imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
"     imap <buffer> '     <Plug>(unite_quick_match_default_action)
"     nmap <buffer> '     <Plug>(unite_quick_match_default_action)
"     imap <buffer><expr> x
"                 \ unite#smart_map('x', "\<Plug>(unite_quick_match_choose_action)")
"     nmap <buffer> x     <Plug>(unite_quick_match_choose_action)
"     nmap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
"     imap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
"     imap <buffer> <C-y>     <Plug>(unite_narrowing_path)
"     nmap <buffer> <C-y>     <Plug>(unite_narrowing_path)
"     nmap <buffer> <C-j>     <Plug>(unite_toggle_auto_preview)
"     nmap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
"     imap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
"     nnoremap <silent><buffer><expr> l
"                 \ unite#smart_map('l', unite#do_action('default'))
"     nnoremap <silent><buffer><expr> v
"                 \ unite#smart_map('v', unite#do_action('vsplit'))
"     nnoremap <silent><buffer><expr> s
"                 \ unite#smart_map('s', unite#do_action('split'))
"
"     let unite = unite#get_current_unite()
"     if unite.buffer_name =~# '^search'
"         nnoremap <silent><buffer><expr> r     unite#do_action('replace')
"     else
"         nnoremap <silent><buffer><expr> r     unite#do_action('rename')
"     endif
"
"     nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
"     nnoremap <buffer><expr> S      unite#mappings#set_current_filters(
"                 \ empty(unite#mappings#get_current_filters()) ?
"                 \ ['sorter_reverse'] : [])
"
"     " Runs "split" action by <C-s>.
"     imap <silent><buffer><expr> <C-s>     unite#do_action('split')
"     imap <silent><buffer><expr> <C-v>     unite#do_action('vsplit')
" endfunction "}}}


"================================================================================
"sourcing
"================================================================================
" settings
source ~/.vim/setting.vim
" mapping after setting
source ~/.vim/mapping.vim
" autocmd
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
            \ 'running_mark' : 'May the force be with you!',
            \ 'into' : 0,
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
            \ 'command': 'open',
            \ }
let g:quickrun_config.matlab = {
            \ 'command': 'octave',
            \ 'exec': '%C -q',
            \ }
let g:quickrun_config.cs = {
            \ 'command': 'donet',
            \ 'exec': '%C -q',
            \ }

" =============================================================================
" Use ranger as vim file manager
if !has('gui_running')
    function! Ranger()
        " Get a temp file name without creating it
        let tmpfile = substitute(system('mktemp -u'), '\n', '', '')
        " Launch ranger, passing it the temp file name
        silent exec '!RANGER_RETURN_FILE='.tmpfile.' ranger'
        " If the temp file has been written by ranger
        if filereadable(tmpfile)
            " Get the selected file name from the temp file
            let filetoedit = system('cat '.tmpfile)
            exec 'edit '.filetoedit
            call delete(tmpfile)
        endif
        redraw!
    endfunction
    nmap <leader>r :call Ranger()<cr>
endif

" check if current tab contains a terminal window
function! s:termintab () abort
  for wnr in range(1, winnr('$'))
    if getwinvar(wnr, '&buftype') ==# 'terminal'
      return wnr
    endif
  endfor
  return 0
endfunction

" 轮换 terminal
" TODO open last terminal
function! TerminalRoll (create) abort
  let split = winwidth(0) * 2 < winheight(0) * 5 ? "" : "vertical "
  if !a:create
    let curbuftype = getbufvar('%', '&buftype')
    let checkingbuf = 1
    let numofbuf = bufnr('$')
    let checked = 0
    let curIsTerminal = 0
    if curbuftype ==# 'terminal'
      " from current buffer
      let checkingbuf = bufnr('%')
      let curIsTerminal = 1
    endif
    while checked < numofbuf
      " 从头再来
      if checkingbuf == numofbuf
        let checkingbuf = 0
      endif
      let checkingbuf = checkingbuf + 1
      if bufexists(checkingbuf) && getbufvar(checkingbuf, '&buftype') ==# 'terminal'
        " switch to
        if curIsTerminal == 1
          execute "buffer " . checkingbuf
        else
          let wnr = s:termintab()
          if wnr
            execute wnr . 'wincmd w'
          else
            execute split . "sbuffer " . checkingbuf
          endif
        endif
        return
      endif
      let checked = checked + 1
    endwhile
  endif
  " create new terminal
  execute split . "terminal"
endfunction

nnoremap <silent> <F2> :call TerminalRoll(0)<cr>
tnoremap <silent> <F2> <c-w>:call TerminalRoll(0)<cr>
nnoremap <silent> <M-F2> :call TerminalRoll(1)<cr>
tnoremap <silent> <M-F2> <c-w>:call TerminalRoll(1)<cr>
tnoremap <silent> <D-F2> <c-w>q
hi Terminal ctermbg=black ctermfg=white guibg=black guifg=white

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

if filereadable(expand("<sfile>:p/locals.vim"))
  source ~/.vim/locals.vim
endif

" function! s:help()
"     augroup my-help
"         autocmd!
"         autocmd InsertEnter <buffer> :PreciousSwitch
"         autocmd InsertLeave <buffer> :PreciousReset
"     augroup END
" endfunction
" autocmd FileType help call s:help()
" カーソル移動時の自動切り替えを無効化
" このオプションは filetype ごとに設定可能
" "*" は全ての filetype に影響する
" let g:precious_enable_switch_CursorMoved = {
" \   "*" : 0
" \}
" let g:precious_enable_switch_CursorMoved_i = {
" \   "*" : 0
" \}

" insert に入った時にスイッチし、抜けた時に元に戻す
" augroup test
"     autocmd!
"     autocmd InsertEnter * :PreciousSwitch
"     autocmd InsertLeave * :PreciousReset
" augroup END
" vim:fdm=marker
