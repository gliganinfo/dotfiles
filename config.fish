#
# FISH shell config (~/.config/sfish/config.fish)
# Ronaldo David Gomes Gligan
#

# Removing fish greeting
function fish_greeting
end

set EDITOR "nvim"
set BROWSER "brave"

# ALIASES.
alias ls="lsd"
alias v="nvim"
alias vim="nvim"
alias r="reset"
alias llh="ls -lh"

# TMUX
abbr t    "tmux"
abbr tl   "tmux ls"
abbr ta   "tmux attach -t"
alias rt="reset && tmux" 

# Devour (window shallowing)
#alias mpv      "devour mpv"
#alias sxiv     "devour sxiv"
#alias viewnior "devour viewnior"
#alias zathura  "devour zathura"

# Hide subtitles by default in mpv
#alias mpv "mpv --no-sub-visibility"

# Misc
abbr sps  "sudo pacman -S"
abbr sys  "sudo yaourt -S"
abbr ys   "yaourt -S"
abbr y    "yay -S"
abbr spsy "sudo pacman -Sy"
abbr spr  "sudo pacman -Rcns"

abbr yta "youtube-dl -x --audio-format mp3 -o '%(title)s.%(ext)s' --no-playlist "
abbr ytv "youtube-dl -f mp4 -o '%(title)s.%(ext)s' --no-playlist"

alias untar "tar -xvf"

alias fc    "fc-cache -vf"

# ~/.bin/ (for my personal scripts), Deno, Rust and Ruby
export DENO_INSTALL="/home/ronaldo/.deno"
export PATH="$DENO_INSTALL/bin:$PATH:$HOME/.cargo/env:/var/lib/snapd/snap/bin:$HOME/.gem/ruby/2.7.0/bin:$HOME/.bin/"

# mkdir + cd
function mkcd
  mkdir $argv
  cd $argv
end
