"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

" Themes
Plug 'morhetz/gruvbox'                                              " Gruvbox
Plug 'reedes/vim-colors-pencil'                                     " iA Writer mode

" Syntax Highlights
let g:polyglot_disabled = ['markdown']
Plug 'sheerun/vim-polyglot'                                         " Syntax Highlight and Snippets for tons of languages
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ap/vim-css-color'
Plug 'shelldandy/shopify.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'Quramy/vim-js-pretty-template'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc'
Plug 'styled-components/vim-styled-components', {
  \   'branch': 'main'
  \   }

Plug 'othree/csscomplete.vim'

" Javascript
" JS Tools
Plug 'SirVer/ultisnips'                                             " Ultimate Snippets
Plug 'honza/vim-snippets'
" Wanna be autocomplete-paths
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
\}
Plug 'rhysd/vim-fixjson'                                            " Autofix json

" General/Movement
Plug 'scrooloose/nerdtree'                                          " NerdTree
Plug 'jiangmiao/auto-pairs'                                         " Auto close brackets smartly
Plug 'airblade/vim-gitgutter'                                       " Git Situation on my Lines like Atom
Plug 'tpope/vim-fugitive'                                           " Vim Fugitive Awesome git shortcuts on vim
Plug 'gregsexton/gitv', {'on': ['Gitv']}                            " Vim Fugitive Git Log Extension
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

" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Others
Plug 'alvan/vim-closetag'                                           " Autoclose html tags
Plug 'vim-airline/vim-airline'                                      " Vim Airline
Plug 'scrooloose/nerdcommenter'                                     " Nerd Commenter
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-ragtag'                                             " Endings for html/xml
Plug 'tpope/vim-surround'                                           " Quickly change parens quotes, etc
Plug 'reedes/vim-pencil'                                            " Pencil / Write Mode
Plug 'vim-scripts/BufOnly.vim'                                      " Clear buffers
Plug 'vim-scripts/loremipsum'                                       " Lorem Ipsum Generator
Plug 'krisajenkins/vim-projectlocal'                                " Per Project Vim Files
Plug 'embear/vim-localvimrc'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/goyo.vim'                                            " Focus mode like iA Writer
Plug 'junegunn/limelight.vim'                                       " Limelight
Plug 'vimlab/split-term.vim'                                        " Fun with inner terminals
Plug 'iamcco/markdown-preview.nvim', {
  \   'do': 'cd app & yarn install'
  \   }
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-sleuth'                                             " Detect indent style
" Spellcheck powers
Plug 'reedes/vim-lexical'
Plug 'arecarn/vim-spell-utils'
call plug#end()
