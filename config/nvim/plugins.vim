if HasPlug('matchtagalways')
  let g:mta_filetypes = {
    \ 'javascript.jsx': 1,
    \ 'html' : 1,
    \ 'xml' : 1,
    \ 'liquid': 1,
    \ 'php': 1,
    \ }
endif

if HasPlug('ale')
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

if HasPlug('supertab')
  let g:SuperTabDefaultCompletionType = "context"
  " Make tab work top to bottom
  " let g:SuperTabContextDefaultCompletionType = "<c-n>"
  " Autoclose popup window
  let g:SuperTabClosePreviewOnPopupClose = 1
endif

if HasPlug('ultisnips')
  "let g:UltiSnipsExpandTrigger="<C-j>"
endif

if HasPlug('vim-closetag')
  let g:closetag_filenames = "*.html,*.js,*.jsx,*.liquid,*.php"
  let g:closetag_emptyTags_caseSensitive = 1
endif

if HasPlug('indentLine')
  let g:indentLine_char = '┆'
  let g:indentLine_fileTypeExclude = ['help']
  let g:indentLine_bufNameExclude = ['NERD_tree.*']
endif

if HasPlug('fzf.vim')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden -l -g ""'
  " https://github.com/junegunn/fzf/blob/master/man/man1/fzf.1#L211
  let g:fzf_files_options =
    \ '--color "border:#6699cc,info:#fabd2f" --preview "highlight -O ansi --force {} 2> /dev/null"'

  " Customize fzf colors to match your color scheme
  let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Clear'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }
  let g:fzf_history_dir = '~/.local/share/fzf-history'
  " Custom Ag command with preview window
  command! -bang -nargs=* Ag
    \ call fzf#vim#ag(<q-args>,
    \                 fzf#vim#with_preview('right:45%'),
    \                 <bang>0)
endif

if HasPlug('goyo.vim')
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

if HasPlug('emmet-vim')
  let g:user_emmet_install_global = 0
  autocmd FileType html,css,liquid,scss,javascript.jsx,javascript,htmldjango,less EmmetInstall
endif

if HasPlug('vim-localvimrc')
  " Don't ask me each time I load a lvimrc file
  let g:localvimrc_ask = 0
endif

if HasPlug('vim-lexical')
  autocmd FileType markdown,mkd call lexical#init()
endif

if HasPlug('vim-pandoc')
  let g:pandoc#modules#disabled = ["folding"]
endif

if HasPlug('vim-pandoc-syntax')
  let g:pandoc#syntax#codeblocks#embeds#langs = [
    \ 'csharp=cs',
    \ 'bash=sh',
    \ 'ini=dosini',
    \ 'js=javascript',
    \ 'viml=vim',
  \]
endif

if HasPlug('deoplete.nvim')
  let g:deoplete#enable_at_startup = 1
endif
