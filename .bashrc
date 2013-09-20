# PATH and common settings go here, .bashrc is loaded when new windows are opened
#
# .bash_profile is executed for login shells, while .bashrc is executed for
# interactive non-login shells.
# http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html
 
bind "set completion-ignore-case on"
 
source '/usr/local/etc/bash_completion.d/git-prompt.sh'
source '/usr/local/etc/bash_completion.d/git-completion.bash'
source '/usr/local/etc/bash_completion.d/npm'
 

# Check that terminfo exists before changing TERM var to xterm-256color
# Prevents prompt flashing in Mac OS X 10.6 Terminal.app
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
    export TERM='xterm-256color'
fi

tput sgr 0 0

# Base styles and color palette
# Solarized colors
# https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized
BOLD=$(tput bold)
RESET=$(tput sgr0)
SOLAR_YELLOW=$(tput setaf 136)
SOLAR_ORANGE=$(tput setaf 166)
SOLAR_RED=$(tput setaf 124)
SOLAR_MAGENTA=$(tput setaf 125)
SOLAR_VIOLET=$(tput setaf 61)
SOLAR_BLUE=$(tput setaf 33)
SOLAR_CYAN=$(tput setaf 37)
SOLAR_GREEN=$(tput setaf 64)
SOLAR_WHITE=$(tput setaf 254)

style_user="\[${RESET}${SOLAR_ORANGE}\]"
style_host="\[${RESET}${SOLAR_YELLOW}\]"
style_path="\[${RESET}${SOLAR_GREEN}\]"
style_chars="\[${RESET}${SOLAR_WHITE}\]"
style_branch="${SOLAR_CYAN}"

if [[ "$SSH_TTY" ]]; then
    # connected via ssh
    style_host="\[${BOLD}${SOLAR_RED}\]"
elif [[ "$USER" == "root" ]]; then
    # logged in as root
    style_user="\[${BOLD}${SOLAR_RED}\]"
fi

is_git_repo() {
    $(git rev-parse --is-inside-work-tree &> /dev/null)
}

is_git_dir() {
    $(git rev-parse --is-inside-git-dir 2> /dev/null)
}

get_git_branch() {
    local branch_name

    # Get the short symbolic ref
    branch_name=$(git symbolic-ref --quiet --short HEAD 2> /dev/null) ||
    # If HEAD isn't a symbolic ref, get the short SHA
    branch_name=$(git rev-parse --short HEAD 2> /dev/null) ||
    # Otherwise, just give up
    branch_name="(unknown)"

    printf $branch_name
}

# Git status information
prompt_git() {
    local git_info git_state uc us ut st

    if ! is_git_repo || is_git_dir; then
        return 1
    fi

    git_info=$(get_git_branch)

    # Check for uncommitted changes in the index
    if ! $(git diff --quiet --ignore-submodules --cached); then
        uc="+"
    fi

    # Check for unstaged changes
    if ! $(git diff-files --quiet --ignore-submodules --); then
        us="!"
    fi

    # Check for untracked files
    if [ -n "$(git ls-files --others --exclude-standard)" ]; then
        ut="?"
    fi

    # Check for stashed files
    if $(git rev-parse --verify refs/stash &>/dev/null); then
        st="$"
    fi

    git_state=$uc$us$ut$st

    # Combine the branch name and state information
    if [[ $git_state ]]; then
        git_info="$git_info[$git_state]"
    fi

    printf "${SOLAR_WHITE} on ${style_branch}${git_info}"
}


# Set the terminal title to the current working directory
PS1="\[\033]0;\w\007\]"
# Build the prompt
PS1+="\n" # Newline
PS1+="${style_user}\u" # Username
PS1+="${style_chars}@" # @
PS1+="${style_host}\h" # Host
PS1+="${style_chars}: " # :
PS1+="${style_path}\w" # Working directory
PS1+="\$(prompt_git)" # Git details
PS1+="\n" # Newline
PS1+="${style_chars}\$ \[${RESET}\]" # $ (and reset color)
 
 
export PATH=/usr/local/bin:$PATH

# export COLOR_NONE='\[\e[0m\]' # No Color
# export COLOR_LIGHT_PURPLE='\[\e[1;35m\]'
# export COLOR_ELECTRIC_YELLOW='\[\e[0;93m\]'
 
# # Get the name of the branch we are on
# git_prompt_info() {
#   branch_prompt=$(__git_ps1)
#   if [ -n "$branch_prompt" ]; then
#     status_icon=$(git_status)
#     echo $branch_prompt $status_icon
#   fi
# }
 
# # Show character if changes are pending
# git_status() {
#   if current_git_status=$(git status | grep 'added to commit' 2> /dev/null); then
#     echo '☠'
#   fi
# }
 
 
# # PS1='\u@\h: \w $(git_prompt_info " (%s)")\n'$COLOR_ELECTRIC_YELLOW'⚡  '$COLOR_LIGHT_PURPLE'→ '$COLOR_NONE
# PS1='\u@\h: \w $(git_prompt_info " (%s)")\n'$COLOR_ELECTRIC_YELLOW'⚡  '$COLOR_NONE