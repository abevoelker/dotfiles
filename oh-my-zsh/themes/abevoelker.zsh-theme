# zsh theme requires 256 color enabled terminal
# i.e TERM=xterm-256color
# Color scheme based on sporty_256 theme

GIT_PROMPT_SEPARATOR="%F{154}|%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%F{154}±%{$GIT_PROMPT_SEPARATOR%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$GIT_PROMPT_SEPARATOR%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}%B✘%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[red]%}!%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}✔%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}◑"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[cyan]%}☔"
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{197}⇅"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{135}⚑"

# Prints a special char depending on if you are root or regular user
function prompt_char {
  if [[ $UID -eq 0 ]]; then
    print $2 # Print root prompt
  else
    print $1 # Print user prompt
  fi
}

function git_prompt_status_w_space {
  [[ -n $(git_prompt_status) ]] && echo " "$(git_prompt_status)
}

function rvm_prompt_info() {
  ruby_version=$(~/.rvm/bin/rvm-prompt 2> /dev/null) || return
  echo " %{$fg[cyan]%}‹$ruby_version›%{$reset_color%}"
}

# Overrides function in lib/git.zsh
function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/} $(parse_git_dirty)"\
"$(git_prompt_status_w_space)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# Taken from gnzh theme
# make some aliases for the colours: (coud use normal escap.seq's too)
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
  eval PR_$color='%{$fg[${(L)color}]%}'
done
eval PR_NO_COLOR="%{$terminfo[sgr0]%}"
eval PR_BOLD="%{$terminfo[bold]%}"
#local return_code="%(?..%{$PR_RED%}%?↵%{$PR_NO_COLOR%})"
function error_prompt_info() {
  return_code="%(?..%? ↵)"
  #return_code="%?↵"
  echo "RETURN CODE IS $return_code"
  [[ -n $return_code ]] && echo "%{$PR_RED%}[$return_code]%{$PR_NO_COLOR%}"
  #echo "$return_code"
  #[[ -n $(return_code) ]]
  #return_code && echo {$return_code}
}

# To change box style, see Unicode 'Box Drawing' code chart
PROMPT='┏╸%{$fg_bold[blue]%}$(git_prompt_info)%B%F{208}%~%b%{$reset_color%}$(rvm_prompt_info)%f
┗╸%{$fg_bold[white]%}$(prompt_char λ \#)%{$reset_color%} '
RPROMPT='$(error_prompt_info)%B%F{208}%n%f%{$fg_bold[white]%}@%F{039}%M %F{135}%y%f%{$reset_color%}'
