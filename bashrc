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

alias la='ls -lhaG --color=auto'
alias ll='ls -lhG --color=auto'
alias ls='ls --color=auto'

alias vim="nvim"

alias df='df -h'
alias free='free -m'
alias grep='grep --color=auto'

alias psa="ps auxf"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

reset_color='\[\033[0m\]'
black_bg='\[\033[48;5;236m\]' # match #2E3440
git_fg_color='\[\033[38;5;39m\]' # match #81A1C1
git_bg_color='\[\033[48;5;39m\]' # match #81A1C1
git_text_color='\[\033[97m\]'
date_fg_color='\[\033[38;5;31m\]' # match #88C0D0
date_bg_color='\[\033[48;5;31m\]' # match #88C0D0
date_text_color='\[\033[97m\]'
dir_fg_color='\[\033[38;5;34m\]' # match #A3BE8C
dir_bg_color='\[\033[48;5;34m\]' # match #A3BE8C
dir_text_color='\[\033[97m\]'

semi_circle_left='◖'
semi_circle_right='◗'

git_block="${black_bg}${git_fg_color}${semi_circle_left}${reset_color}${git_bg_color}${git_text_color} \$(parse_git_branch) ${reset_color}${black_bg}${git_fg_color}${semi_circle_right}${reset_color}"
date_block="${black_bg}${date_fg_color}${semi_circle_left}${reset_color}${date_bg_color}${date_text_color} \$(current_date) ${reset_color}${black_bg}${date_fg_color}${semi_circle_right}${reset_color}"
dir_block="${black_bg}${dir_fg_color}${semi_circle_left}${reset_color}${dir_bg_color}${dir_text_color} \w ${reset_color}${black_bg}${dir_fg_color}${semi_circle_right}${reset_color}"

# Function to parse the current Git branch
parse_git_branch() {
    git branch 2>/dev/null | grep '^*' | colrm 1 2
}

# Function to get the current date
current_date() {
    date +"%H:%M"
}

set_prompt() {
    if git rev-parse --is-inside-work-tree &>/dev/null; then
        PS1="${date_block} ${git_block} ${dir_block} "
    else
        PS1="${date_block} ${dir_block} "
    fi
}

PROMPT_COMMAND=set_prompt

export PROMPT_COMMAND
