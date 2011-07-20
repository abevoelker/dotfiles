# Just to force some apps to use color
export TERM=xterm-256color

export PATH=/home/abe/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

# Load scala interpreter
if [ -d "$HOME/scala-2.9.0.1/bin" ] ; then
  PATH="$HOME/scala-2.9.0.1/bin:$PATH"
fi

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="abevoelker"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails ruby)

source $ZSH/oh-my-zsh.sh

# Spell correction can be annoying for some apps
alias mv='nocorrect mv'
alias cp='nocorrect cp'
alias mkdir='nocorrect mkdir'
alias spec='nocorrect spec'
alias rspec='nocorrect rspec'
alias tmux='nocorrect tmux'
alias spotify='nohup wine ~/.wine/drive_c/Program\ Files/Spotify/spotify.exe >/dev/null 2>&1 &'

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

