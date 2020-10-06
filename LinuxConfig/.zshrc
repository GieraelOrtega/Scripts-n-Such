################################################################################
#                                                                              #
#      _____                ____   ___  _                                      #
#     |__  /___ _   _ ___  / __ \ / _ \| |_   _ _ __ ___  _ __  _   _ ___      #
#       / // _ \ | | / __|/ / _` | | | | | | | | '_ ` _ \| '_ \| | | / __|     #
#      / /|  __/ |_| \__ \ | (_| | |_| | | |_| | | | | | | |_) | |_| \__ \     #
#     /____\___|\__,_|___/\ \__,_|\___/|_|\__, |_| |_| |_| .__/ \__,_|___/     #
#                          \____/         |___/          |_|                   #
#                _____    _         ____             __ _                      #
#               |__  /___| |__     / ___|___  _ __  / _(_) __ _                #
#                 / // __| '_ \   | |   / _ \| '_ \| |_| |/ _` |               #
#                / /_\__ \ | | |  | |__| (_) | | | |  _| | (_| |               #
#               /____|___/_| |_|   \____\___/|_| |_|_| |_|\__, |               #
#                                                         |___/                #
#                                                                              #
################################################################################

# Enable color support
export TERM="xterm-256color"

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/user/.oh-my-zsh"

# Current zsh theme
ZSH_THEME="powerlevel9k/powerlevel9k"

# Powerlevel Config
POWERLEVEL9K_MODE='DejaVuSansMono'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Set History Config
export HISTSIZE=500000
export SAVEHIST=500000

# Typing Tweaks
# Delete entire word
bindkey '^H' backward-kill-word

# Shortcut Aliases
alias c="clear"
alias cls="clear"
alias da="echo '' && grep 'alias' ~/.zshrc && echo ''"
alias h="history"
alias lh="history | lolcat"
alias ls="ls -hla"
alias lls="ls -hla | lolcat"
alias motd="clear && figlet ' -[ Welcome ]- ' | lolcat && echo '' && neofetch "
alias neof="neofetch"
alias p="pwd -P"
alias ss="source ~/.zshrc"

# Config Aliases
alias bashconf="code ~/.bashrc"
alias neofconf="code ~/.config/neofetch/config.conf"
alias omzconf="code ~/.oh-my-zsh"
alias zshconf="code ~/.zshrc"

# Initial MOTD/Welcome Message
figlet " -[ Welcome ]- " | lolcat && echo "" && neofetch