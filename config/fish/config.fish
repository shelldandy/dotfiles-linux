# Colors
source ~/.themes/gruvbox-dark.sh

# Exports
set -x TERM xterm-256color
set -x GPG_TTY (tty)

set -x LANGUAGE en_US.UTF8
set -x LANG en_US.UTF8
set -x LC_CTYPE en_US.UTF8
set -x LC_TYPE en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x NNN_USE_EDITOR '1'
set -x COMPOSE_HTTP_TIMEOUT '180' # Docker lol

set -U  fish_user_paths ~/.bin
set -gx FZF_DEFAULT_COMMAND  'rg --files --hidden'
set -gx FZF_CTRL_T_COMMAND   $FZF_DEFAULT_COMMAND
set -gx EVENT_NOKQUEUE       1
set -gx EDITOR               nvim

test -d $HOME/.bin ; and set PATH $HOME/.bin $PATH
test -d $HOME/.local/bin ; and set PATH $HOME/.local/bin $PATH

# Making syntax highlight work with Fish
set hilite (which src-hilite-lesspipe.sh)
set -x LESSOPEN "| $hilite %s"
set -x LESS " -R -X -F "

# Fuck!
# https://github.com/nvbn/thefuck
thefuck --alias | source

rvm default

# Vim mode
fish_vi_key_bindings
