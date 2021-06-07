if has_key(g:plugs, 'matchtagalways')
  let g:mta_filetypes = {
    \ 'javascript.jsx': 1,
    \ 'html' : 1,
    \ 'xml' : 1,
    \ 'liquid': 1,
    \ 'php': 1,
    \ }
endif

if has_key(g:plugs, 'ale')
  let g:airline#extensions#ale#enabled = 1

  let g:ale_linters = {}
  let g:ale_linters['javascript'] = ['eslint', 'stylelint']
  let g:ale_linters['jsx'] = ['eslint']
  let g:ale_linters['scss'] = ['stylelint']
  let g:ale_linters['html'] = ['htmlhint']

  let g:ale_fixers = {}
  let g:ale_fixers['javascript'] = ['eslint']
  let g:ale_fixers['jsx'] = ['eslint']
  let g:ale_fixers['scss'] = ['stylelint']
  let g:ale_fixers['typescript'] = ['tslint']
  let g:ale_fixers['python'] = ['black']
  let g:ale_fixers['sql'] = ['pgformatter']
endif

if has_key(g:plugs, 'supertab')
  let g:SuperTabDefaultCompletionType = "<c-n>"
endif

if has_key(g:plugs, 'ultisnips')
  let g:UltiSnipsExpandTrigger="<C-j>"
endif

if has_key(g:plugs, 'vim-closetag')
  let g:closetag_filenames = "*.html,*.js,*.jsx,*.liquid,*.php"
  let g:closetag_emptyTags_caseSensitive = 1
endif

if has_key(g:plugs, 'indentLine')
  let g:indentLine_char = '┆'
  let g:indentLine_fileTypeExclude = ['help']
  let g:indentLine_bufNameExclude = ['NERD_tree.*']
endif

if has_key(g:plugs, 'fzf.vim')
  let g:fzf_layout = { 'down': '~35%' }

  if isdirectory(".git")
      " if in a git project, use :GFiles
      nmap <silent> <leader>t :GitFiles --cached --others --exclude-standard<cr>
  else
      " otherwise, use :FZF
      nmap <silent> <leader>t :FZF<cr>
  endif

  nmap <silent> <leader>s :GFiles?<cr>

  nmap <silent> <leader>r :Buffers<cr>
  nmap <silent> <leader>e :FZF<cr>
  nmap <leader><tab> <plug>(fzf-maps-n)
  xmap <leader><tab> <plug>(fzf-maps-x)
  omap <leader><tab> <plug>(fzf-maps-o)

  " Insert mode completion
  imap <c-x><c-k> <plug>(fzf-complete-word)
  imap <c-x><c-f> <plug>(fzf-complete-path)
  imap <c-x><c-j> <plug>(fzf-complete-file-ag)
  imap <c-x><c-l> <plug>(fzf-complete-line)

  nnoremap <silent> <Leader>C :call fzf#run({
  \   'source':
  \     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
  \         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
  \   'sink':    'colo',
  \   'options': '+m',
  \   'left':    30
  \ })<CR>

  command! FZFMru call fzf#run({
  \  'source':  v:oldfiles,
  \  'sink':    'e',
  \  'options': '-m -x +s',
  \  'down':    '40%'})

  command! -bang -nargs=* Find call fzf#vim#grep(
      \ 'rg --column --line-number --no-heading --follow --color=always '.<q-args>.' || true', 1,
      \ <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)
  command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:50%', '?'), <bang>0)
  command! -bang -nargs=? -complete=dir GitFiles
      \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview('right:50%', '?'), <bang>0)
  function! RipgrepFzf(query, fullscreen)
      let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
      let initial_command = printf(command_fmt, shellescape(a:query))
      let reload_command = printf(command_fmt, '{q}')
      let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
      call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
  endfunction

  command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
endif

if has_key(g:plugs, 'goyo.vim')
  let g:goyo_height = '100%'
  function! s:goyo_enter()
    set wrap linebreak
  endfunction

  function! s:goyo_leave()
    set nowrap nolinebreak
  endfunction

  autocmd! User GoyoEnter nested call <SID>goyo_enter()
  autocmd! User GoyoLeaver nested call <SID>goyo_leave()
endif

if has_key(g:plugs, 'emmet-vim')
  let g:user_emmet_install_global = 0
  autocmd FileType html,css,liquid,scss,javascript.jsx,javascript,htmldjango,less EmmetInstall
endif

if has_key(g:plugs, 'vim-localvimrc')
  " Don't ask me each time I load a lvimrc file
  let g:localvimrc_ask = 0
endif

if has_key(g:plugs, 'vim-lexical')
  autocmd FileType markdown,mkd call lexical#init()
endif

if has_key(g:plugs, 'vim-pandoc')
  let g:pandoc#modules#disabled = ["folding"]
endif

if has_key(g:plugs, 'vim-pandoc-syntax')
  let g:pandoc#syntax#codeblocks#embeds#langs = [
    \ 'csharp=cs',
    \ 'bash=sh',
    \ 'ini=dosini',
    \ 'js=javascript',
    \ 'viml=vim',
  \]
endif
