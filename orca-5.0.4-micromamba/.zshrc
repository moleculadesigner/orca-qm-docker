# The following lines were added by compinstall

zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/molecular/.zshrc'
zstyle ':completion:*' menu select

autoload -Uz compinit promptinit colors && colors
compinit
# End of lines added by compinstall

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install

# Prompt
promptinit
PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg_no_bold[green]%}%. %{$reset_color%}%# "

# Add Orca
ORCA_PATH="/home/orcauser/orca/"
export PATH="$ORCA_PATH:$PATH"
export LD_LIBRARY_PATH="$ORCA_PATH:$LD_LIBRARY_PATH"
