if HasPlug('vim-polyglot')
  let g:javascript_plugin_jsdoc = 1
  let g:jsx_ext_required = 0
endif

if HasPlug('vim-jsx')
  let g:jsx_ext_required = 0
endif

if HasPlug('vim-javascript')
  let g:javascript_plugin_jsdoc = 1
endif

if HasPlug('ultisnips')
  let g:UltiSnipsJumpForwardTrigger="<c-b>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"
  let g:UltiSnipsExpandTrigger="<C-j>"
  :imap ,us <C-J>
  :imap ,uu <C-J>
endif

if HasPlug('deoplete.nvim')
  autocmd InsertEnter * call deoplete#enable()
endif

if HasPlug('deoplete-ternjs')
  let g:deoplete#sources#ternjs#filetypes = [
  \ 'jsx',
  \ 'javascript.jsx',
  \ 'vue',
  \ ]
endif

if HasPlug('tern_for_vim')
  let g:tern_request_timeout = 1
  let g:tern_show_signature_in_pum = 1
  let g:tern#command = ["tern"]
  let g:tern#arguments = ["--persistent"]
  let g:tern_show_argument_hints = 'on_hold'
  "autocmd FileType javascript,javascript.jsx setlocal omnifunc=ternjs#Complete
  " Helpful commands from the docs
  nnoremap <Leader>td :TernDoc<CR>
  nnoremap <Leader>tb :TernDocBrowse<CR>
endif
