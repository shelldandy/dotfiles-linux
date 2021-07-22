if $THEME_COLORS == 'gruvbox-dark'
  if HasPlug('gruvbox.nvim')
    let g:gruvbox_italic = 1
    let g:gruvbox_invert_selection = 0
    let g:gruvbox_sign_column = 'bg0'
    colorscheme gruvbox
    set background=dark
  endif

  if HasPlug("galaxyline.nvim")
    highlight StatusLine                                                                                                guifg=#3c3836
    highlight GalaxyLeftGitDiffAddActive                                                                  guibg=#3c3836 guifg=#27b31a
    highlight GalaxyLeftGitDiffInactive                                                                   guibg=#3c3836 guifg=#ebdbb2
    highlight GalaxyLeftGitDiffModifiedActive                                                             guibg=#3c3836 guifg=#fe811b
    highlight GalaxyLeftGitDiffRemoveActive                                                               guibg=#3c3836 guifg=#fb4632
    highlight GalaxyLeftLspInactive                                                                       guibg=#3c3836 guifg=#d5c4a1
    highlight GalaxyMapperCommon1                                                                         guibg=#3c3836 guifg=#504945
    highlight GalaxyMapperCommon2                                                                         guibg=#bdae93 guifg=#504945
    highlight GalaxyMapperCommon3                                                                         guibg=#3c3836 guifg=#ebdbb2
    highlight GalaxyMapperCommon4                                                                         guibg=#504945 guifg=#ebdbb2
    highlight GalaxyMapperCommon5                                                                         guibg=#3c3836 guifg=#d5c4a1
    highlight GalaxyMapperCommon6                                                                         guibg=#504945 guifg=#d5c4a1
    highlight GalaxyMapperCommon7                                                                         guibg=#504945 guifg=#bdae93
    highlight GalaxyMapperCommon8                                                                         guibg=#504945 guifg=#91a6ba
    highlight GalaxyMidFileStatusModified                                                                 guibg=#3c3836 guifg=#8ec07c
    highlight GalaxyMidFileStatusReadonly                                                                 guibg=#3c3836 guifg=#fe811b
    highlight GalaxyMidFileStatusRestricted                                                               guibg=#3c3836 guifg=#fb4632
    highlight GalaxyMidFileStatusUnmodified                                                               guibg=#3c3836 guifg=#d5c4a1
    highlight GalaxyRightLspErrorActive                                                                   guibg=#3c3836 guifg=#fb4632
    highlight GalaxyRightLspHintActive                                                                    guibg=#3c3836 guifg=#27b31a
    highlight GalaxyRightLspInformationActive                                                             guibg=#3c3836 guifg=#127fff
    highlight GalaxyRightLspWarningActive                                                                 guibg=#3c3836 guifg=#fe811b
    highlight GalaxyViModeCommandInverted                                                                 guibg=#504945 guifg=#fabd2f
    highlight GalaxyViModeCommandUnturned                                                                 guibg=#fabd2f guifg=#3c3836
    highlight GalaxyViModeCommonVisualInverted                                                            guibg=#504945 guifg=#fe811b
    highlight GalaxyViModeCommonVisualUnturned                                                            guibg=#fe811b guifg=#3c3836
    highlight GalaxyViModeEmptyInverted                                                                   guibg=#504945 guifg=#bdae93
    highlight GalaxyViModeEmptyUnturned                                                                   guibg=#bdae93 guifg=#3c3836
    highlight GalaxyViModeInsertInverted                                                                  guibg=#504945 guifg=#83a598
    highlight GalaxyViModeInsertUnturned                                                                  guibg=#83a598 guifg=#3c3836
    highlight GalaxyViModeNormalInverted                                                                  guibg=#504945 guifg=#bdae93
    highlight GalaxyViModeNormalUnturned                                                                  guibg=#bdae93 guifg=#3c3836
    highlight GalaxyViModeReplaceInverted                                                                 guibg=#504945 guifg=#8ec07c
    highlight GalaxyViModeReplaceUnturned                                                                 guibg=#8ec07c guifg=#3c3836
    highlight GalaxyViModeShellInverted                                                                   guibg=#504945 guifg=#d3869b
    highlight GalaxyViModeShellUnturned                                                                   guibg=#d3869b guifg=#3c3836
    highlight GalaxyViModeTerminalInverted                                                                guibg=#504945 guifg=#d3869b
    highlight GalaxyViModeTerminalUnturned                                                                guibg=#d3869b guifg=#3c3836
  endif

  if HasPlug('ale')
    exe 'highlight ALEErrorSign guifg=' . $VIM_ALE_ERROR_FG 'guibg=' . $VIM_ALE_ERROR_BG
    exe 'highlight ALEWarningSign guifg=' . $VIM_ALE_WARNING_FG 'guibg=' . $VIM_ALE_WARNING_BG
  endif
endif

if $THEME_COLORS == 'gruvbox-light'
  if HasPlug('gruvbox.nvim')
    let g:gruvbox_italic = 1
    colorscheme gruvbox
    set background=light
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
