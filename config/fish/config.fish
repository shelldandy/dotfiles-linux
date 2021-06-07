# Colors
source ~/.themes/gruvbox-dark.sh

# Exports
set -x EDITOR nvim
set -x TERM xterm-256color
set -x GPG_TTY (tty)

set -x LANGUAGE en_US.UTF8
set -x LANG en_US.UTF8
set -x LC_CTYPE en_US.UTF8
set -x LC_TYPE en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x NNN_USE_EDITOR '1'
set -x COMPOSE_HTTP_TIMEOUT '180' # Docker lol

test -d $HOME/.bin ; and set PATH $HOME/.bin $PATH
test -d $HOME/.local/bin ; and set PATH $HOME/.local/bin $PATH

# Making syntax highlight work with Fish
set hilite (which src-hilite-lesspipe.sh)
set -x LESSOPEN "| $hilite %s"
set -x LESS " -R -X -F "

# Fuck!
# https://github.com/nvbn/thefuck
thefuck --alias | source

# Fishy Fixes for the prompt with default theme
set fish_pager_color_progress cyan
function fish_right_prompt
  set_color white
  date "+%H:%M:%S"
  set_color normal
  printf "\n"
end

# Trying a fancy fishy prompt
# You can override some default options with config.fish:
function fish_prompt
  set -l last_command_status $status
  set -l cwd

  if test "$theme_short_path" = 'yes'
    set cwd (basename (prompt_pwd))
  else
    set cwd (prompt_pwd)
  end

  set -l fish     "⋊>"
  set -l ahead    "↑"
  set -l behind   "↓"
  set -l diverged "⥄ "
  set -l dirty    "⨯"
  set -l none     "◦"

  set -l normal_color     (set_color normal)
  set -l success_color    (set_color $fish_pager_color_progress ^/dev/null; or set_color cyan)
  set -l error_color      (set_color $fish_color_error ^/dev/null; or set_color red --bold)
  set -l directory_color  (set_color $fish_color_quote ^/dev/null; or set_color brown)
  set -l repository_color (set_color $fish_color_cwd ^/dev/null; or set_color green)


  if git_is_repo

    if test "$theme_short_path" = 'yes'
      set root_folder (command git rev-parse --show-toplevel ^/dev/null)
      set parent_root_folder (dirname $root_folder)
      set cwd (echo $PWD | sed -e "s|$parent_root_folder/||")

      echo -n -s $directory_color $cwd $normal_color
    else
      echo -n -s $directory_color $cwd $normal_color
    end

    echo -n -s " on " $repository_color (git_branch_name) $normal_color " "

    if git_is_touched
      echo -n -s $dirty
    else
      echo -n -s (git_ahead $ahead $behind $diverged $none)
    end

  else
    echo -n -s " " $directory_color $cwd $normal_color
  end

  printf "\n"

  if test $last_command_status -eq 0
    echo -n -s $success_color $fish $normal_color " "
  else
    echo -n -s $error_color $fish $normal_color " "
  end
end
set -g fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
