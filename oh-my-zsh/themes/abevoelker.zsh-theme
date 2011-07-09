# zsh theme requires 256 color enabled terminal
# i.e TERM=xterm-256color
# Color scheme based on sporty_256 theme

# Prints a special char depending on if you are root or regular user
function prompt_char {
	if [[ $UID -eq 0 ]]; then
		print $2 # Print root prompt
	else
		print $1 # Print user prompt
	fi
}

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

function git_prompt_info2() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/} $(parse_git_dirty)" \
  "$(git_prompt_status)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# To change box style, see Unicode 'Box Drawing' code chart
PROMPT='┏╸%{$fg_bold[blue]%}$(git_prompt_info2)%B%F{208}%~%b%{$reset_color%}%f
┗╸%{$fg_bold[white]%}$(prompt_char λ \#)%{$reset_color%} '
RPROMPT='%B%F{208}%n%f%{$fg_bold[white]%}@%F{039}%m %F{135}%y%f%{$reset_color%}'

