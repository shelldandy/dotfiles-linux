"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

" Themes
Plug 'mhartington/oceanic-next'                                     " Oceanic Next
Plug 'morhetz/gruvbox'                                              " Gruvbox
Plug 'whatyouhide/vim-gotham'
Plug 'sonph/onehalf', { 'rtp': 'vim/' }
Plug 'rakr/vim-one'
Plug 'reedes/vim-colors-pencil'                                     " iA Writer mode
Plug 'junegunn/seoul256.vim'

" Syntax Highlights
if has_key(g:plugs, 'vim-polyglot')
  let g:polyglot_disabled = ['markdown']
endif
Plug 'sheerun/vim-polyglot'                                         " Syntax Highlight and Snippets for tons of languages
Plug 'godlygeek/tabular'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ap/vim-css-color'
Plug 'shelldandy/shopify.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'Quramy/vim-js-pretty-template'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc'

Plug 'Shougo/neco-vim'
Plug 'othree/csscomplete.vim'

" Javascript
Plug 'styled-components/vim-styled-components'                      " Vim Styled Components
Plug 'styled-components/vim-styled-components', {
  \   'branch': 'main'
  \   }
" JS Tools
Plug 'SirVer/ultisnips'                                             " Ultimate Snippets
Plug 'honza/vim-snippets'
Plug 'ternjs/tern_for_vim', {
  \   'do': 'npm install --no-package-lock'
  \   }
Plug '1995eaton/vim-better-javascript-completion'
" Wanna be autocomplete-paths
Plug 'othree/jspc.vim'
Plug 'heavenshell/vim-jsdoc'                                        " JSDocs on Demand
Plug 'rhysd/vim-fixjson'                                            " Autofix json

" General/Movement
Plug 'ervandew/supertab'                                            " Tab autocomplete
Plug 'scrooloose/nerdtree'                                          " NerdTree
Plug 'jiangmiao/auto-pairs'                                         " Auto close brackets smartly
Plug 'airblade/vim-gitgutter'                                       " Git Situation on my Lines like Atom
Plug 'tpope/vim-fugitive'                                           " Vim Fugitive Awesome git shortcuts on vim
Plug 'gregsexton/gitv', {'on': ['Gitv']}                            " Vim Fugitive Git Log Extension
Plug 'tpope/vim-unimpaired'                                         " Quickly move around buffers etc
Plug 'brooth/far.vim'                                               " Search and replace
Plug 'valloric/matchtagalways'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', {
 \    'dir': '~/.fzf',
 \    'do': './install --bin'
 \    }
Plug 'junegunn/fzf.vim'
Plug 'wesQ3/vim-windowswap'                                         " Quickly swap panes <Leader>ww

" Linters
Plug 'w0rp/ale'

" Life Quality Stuff
Plug 'alvan/vim-closetag'                                           " Autoclose html tags
Plug 'vim-airline/vim-airline'                                      " Vim Airline
Plug 'scrooloose/nerdcommenter'                                     " Nerd Commenter
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-ragtag'                                             " Endings for html/xml
Plug 'tpope/vim-surround'                                           " Quickly change parens quotes, etc
Plug 'reedes/vim-pencil'                                            " Pencil / Write Mode
Plug 'vim-scripts/BufOnly.vim'                                      " Clear buffers
Plug 'vim-scripts/loremipsum'                                       " Lorem Ipsum Generator
Plug 'rizzatti/dash.vim'                                            " Dash Documentation
Plug 'krisajenkins/vim-projectlocal'                                " Per Project Vim Files
Plug 'embear/vim-localvimrc'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/goyo.vim'                                            " Focus mode like iA Writer
Plug 'junegunn/limelight.vim'                                       " Limelight
Plug 'metakirby5/codi.vim'
Plug 'vimlab/split-term.vim'
Plug 'iamcco/markdown-preview.nvim', {
  \   'do': 'cd app & yarn install'
  \   }
Plug 'mattn/emmet-vim'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-sleuth'                                             " Detect indent style

" Vim Ranger
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'

" Spellcheck powers
Plug 'reedes/vim-lexical'
Plug 'arecarn/vim-spell-utils'

Plug 'ryanoasis/vim-devicons'                                       " Vim Icons Load LAST
call plug#end()
