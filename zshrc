# Just to force some apps to use color
export TERM=xterm-256color

# Set paths
export PATH=~/bin:$PATH
export CLASSPATH=~/java

# Load scala interpreter
if [ -d "$HOME/scala-2.9.0.1/bin" ] ; then
  PATH="$HOME/scala-2.9.0.1/bin:$PATH"
fi

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="abevoelker"
# Don't auto-update oh-my-zsh (really annoying)
export DISABLE_AUTO_UPDATE=true

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails ruby)

source $ZSH/oh-my-zsh.sh

RVM_DEFAULT=ruby-1.9.3-p194@home
if [ -x ~/.rvm/bin/rvm-prompt ] && [ "$(~/.rvm/bin/rvm-prompt)" != $RVM_DEFAULT ] ; then
  rvm use $RVM_DEFAULT
fi

# Spell correction annoys me (I'm a decent speller)
unsetopt correct_all

# Global aliases (needn't start at beginning of line)
alias -g NUL="> /dev/null 2>&1"
alias -g ENUL="2> /dev/null"

# Aliases
alias f='find . -name'
alias fd='find . -type d -name'
alias ff='find . -type f -name'
alias gitk='gitk --all'

# By @ieure; copied from https://gist.github.com/1474072
#
# It finds a file, looking up through parent directories until it finds one.
# Use it like this:
#
#   $ ls .tmux.conf
#   ls: .tmux.conf: No such file or directory
#
#   $ ls `up .tmux.conf`
#   /Users/grb/.tmux.conf
#
#   $ cat `up .tmux.conf`
#   set -g default-terminal "screen-256color"
#
function up()
{
    if [ "$1" != "" -a "$2" != "" ]; then
        local DIR=$1
        local TARGET=$2
    elif [ "$1" ]; then
        local DIR=$PWD
        local TARGET=$1
    fi
    while [ ! -e $DIR/$TARGET -a $DIR != "/" ]; do
        DIR=$(dirname $DIR)
    done
    test $DIR != "/" && echo $DIR/$TARGET
}
