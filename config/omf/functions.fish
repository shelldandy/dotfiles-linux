# Navigation
function ..       ; cd .. ; end
function ...      ; cd ../.. ; end
function ....     ; cd ../../.. ; end
function .....    ; cd ../../../.. ; end
function ......   ; cd ../../../../.. ; end
function c        ; clear ; end

# Utilities
function rst      ; exec fish ; end
function v        ; nvim $argv ; end
function g        ; git $argv ; end
function dc       ; docker-compose $argv ; end
function bat      ; batcat $argv ; end
function gs       ; git status ; end
function gaa      ; git add . ; end
function oa       ; open -a $argv ; end
function rm       ; trash $argv ; end

function ys       ; yarn add $argv ; end
function yd       ; yarn add --dev $argv ; end
function ydl      ; youtube-dl $argv ; end
function icat     ; kitty +kitten icat $argv ; end

# Fun

function moo # Random cowsay
  set cows_dir /usr/share/cowsay/cows
  set avatar (ls $cows_dir | shuf -n1|cut -d'.' -f1)
  fortune | cowsay -f $avatar | lolcat -t
end

# PMosh open man pages in pdf format
function pmosh
  man -t $argv | ps2pdf - /tmp/$argv.pdf
  open /tmp/$argv.pdf
end

# gif2mp4
# https://rigor.com/blog/2015/12/optimizing-animated-gifs-with-html5-video
function gif2mp4
  ffmpeg -i $argv -movflags faststart -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" $argv.mp4
end

function removeSound
  ffmpeg -i $argv -vcodec copy -an muted.$argv
end

function mov2mp4
  ffmpeg -i $argv -vcodec copy -acodec copy $argv.mp4
end

function mp3extract
  ffmpeg -i $argv $argv.mp3
end

function wavextract
  set name (removeExtension $argv)
  ffmpeg -i $argv $name.wav
end

# Update nvm
# https://github.com/creationix/nvm#install-script
function nvm-update
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash
end

function update --argument-names "extras"
  lolcow 'Updating apt'
  sudo apt update
  sudo apt upgrade
  sudo apt autoremove
  lolcow 'Flatpak'
  flatpak update
  lolcow 'Updating Neovim...'
  nvim -c 'PlugUpdate' -c 'qa'
  lolcow 'Back to business lets get it! #HUSTLE'
end

function update_extras
  lolcow 'Updating gems'
  gem update
  lolcow 'Updating pips'
  pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U
  pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U
  lolcow 'Back to business lets get it! #HUSTLE'
end

function lolcow
  set cows_dir /usr/share/cowsay/cows
  set avatar (ls $cows_dir | shuf -n1|cut -d'.' -f1)
  echo $argv | cowsay -f $avatar | lolcat
end

# Completions
function make_completion --argument-names alias command
    echo "
    function __alias_completion_$alias
      set -l cmd (commandline -o)
      set -e cmd[1]
      complete -C\"$command \$cmd\"
    end
    " | .
    complete -c $alias -a "(__alias_completion_$alias)"
end

function ydp
  set currentPath (pwd)
  set url (xclip -o)
  cd ~/Downloads
  youtube-dl $url
  cd $currentPath
end

function yda
  set currentPath (pwd)
  set url (xclip -o)
  cd ~/Downloads
  youtube-dl $url -x --audio-format mp3 --audio-quality 0
  cd $currentPath
end

function ydw
  set currentPath (pwd)
  set url (xclip -o)
  cd ~/Downloads
  youtube-dl $url -x --audio-format wav --audio-quality 0
  cd $currentPath
end

function man
  command man $argv | batcat
end

function my_ip
  curl ifconfig.co
end

function cani
  set -l feat (ciu | sort -rn | eval "fzf --ansi --header='[caniuse:features]'" | sed -e 's/^.*%\ *//g' | sed -e 's/   .*//g')
end

function removeExtension --argument-names "filename"
  echo (basename "$filename" | sed 's/\(.*\)\..*/\1/')
end
