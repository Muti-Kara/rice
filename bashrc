HISTSIZE=2000
HISTFILESIZE=2000

export HISTCONTROL=ignoredups:erasedups
export EDITOR="nvim"

export MANPAGER="less"

[[ $- != *i* ]] && return

shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend # do not overwrite history
shopt -s checkwinsize # checks term size when bash regains control

bind "set show-all-if-ambiguous on"
bind "set completion-ignore-case on"
bind "TAB:menu-complete"

alias la='ls -lhaG'
alias ll='ls -lhG'

alias vim="nvim"

alias df='df -h'               # human-readable sizes
alias free='free -m'           # show sizes in MB
alias grep='grep --color=auto' # colorize output (good for log files)

alias psa="ps auxf"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

function parse_git_dirty {
  [[ $(git status --porcelain 2> /dev/null) ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_dirty))/"
}

export PS1="\n\t \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
