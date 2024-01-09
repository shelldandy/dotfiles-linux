# Disable initial Fish Greeting
set fish_greeting
# Colors
source ~/.themes/gruvbox-dark.sh
source ~/.secrets.sh
source ~/.config/fish/functions.fish

# Exports
set -x TERM xterm-256color
set -x GPG_TTY (tty)

set -x LANGUAGE en_US.UTF8
set -x LANG en_US.UTF8
set -x LC_CTYPE en_US.UTF8
set -x LC_TYPE en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x NNN_USE_EDITOR 1
set -x COMPOSE_HTTP_TIMEOUT 180 # Docker lol

set -U fish_user_paths ~/.bin
set -gx FZF_DEFAULT_COMMAND 'rg --files --hidden'
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -gx EVENT_NOKQUEUE 1
set -gx EDITOR nvim
set -gx nvm_default_version v20.10.0

test -d $HOME/.bin; and set PATH $HOME/.bin $PATH
test -d $HOME/.local/bin; and set PATH $HOME/.local/bin $PATH

# Vim mode
fish_vi_key_bindings
#
# Abbreviations
abbr gc git commit
abbr gp git push
abbr gpt git push --tags
abbr gP git pull
abbr gb git branch
abbr gco git checkout
abbr gxo git checkout
abbr gr git rebase
abbr gl git lg
abbr gd git diff
abbr ll exa -lah
abbr x exit
abbr k kubectl

abbr r ranger
abbr f fuck

# git add remote
# for pushing to 2 remotes at once
# https://stackoverflow.com/questions/14290113/git-pushing-code-to-two-remotes#14290145
abbr gar git remote set-url --add --push origin

# Repeated paths
abbr df cd ~/dotfiles
abbr gf cd ~/git

make_completion g git
make_completion v nvim
make_completion dc docker-compose

### RANDOM COLOR SCRIPT ###
colorscript random
