if $THEME_COLORS == 'gruvbox-dark'
  if HasPlug('gruvbox')
    let g:gruvbox_italic = 1
    colorscheme gruvbox
    set background=dark
    " https://github.com/morhetz/gruvbox/issues/179
    hi! link xmlTagN GruvboxBlue
  endif

  if HasPlug('vim-airline')
    let g:airline_theme='gruvbox'
  endif

  if HasPlug('ale')
    exe 'highlight ALEErrorSign guifg=' . $VIM_ALE_ERROR_FG 'guibg=' . $VIM_ALE_ERROR_BG
    exe 'highlight ALEWarningSign guifg=' . $VIM_ALE_WARNING_FG 'guibg=' . $VIM_ALE_WARNING_BG
  endif
endif

if $THEME_COLORS == 'gruvbox-light'
  if HasPlug('gruvbox')
    let g:gruvbox_italic = 1
    colorscheme gruvbox
    set background=light
  endif

  if HasPlug('vim-airline')
    let g:airline_theme='gruvbox'
  endif

  if HasPlug('ale')
    exe 'highlight ALEErrorSign guifg=' . $VIM_ALE_ERROR_FG 'guibg=' . $VIM_ALE_ERROR_BG
    exe 'highlight ALEWarningSign guifg=' . $VIM_ALE_WARNING_FG 'guibg=' . $VIM_ALE_WARNING_BG
  endif
endif

if $THEME_COLORS == 'pencil'
  if HasPlug('vim-colors-pencil')
    colorscheme pencil
    set background=light
  endif
endif

if $THEME_COLORS == 'pencil-dark'
  if HasPlug('vim-colors-pencil')
    colorscheme pencil
    set background=dark
  endif
endif

if HasPlug('vim-colors-pencil')
  " Neutral code background
  let g:pencil_terminal_italics = 1
  let g:airline_theme = 'pencil'
  let g:pencil#wrapModeDefault = 'soft'
  let g:pencil_spell_undercurl = 0
  " Add underlines to spellcheck errors
  hi SpellBad gui=underline
  hi SpellCap gui=underline
  hi SpellRare gui=underline
  hi SpellLocal gui=underline
endif
