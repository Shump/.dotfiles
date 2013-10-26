
# ARCH:
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# END ARCH TODO: Check os!



eval "`gdircolors`"
alias ls='gls -h --color'
alias ll='ls -lah'
alias la='ls -ah'
alias vim='mvim -v'
alias gvim='mvim'


function mk
{
	command mkdir $1 && cd $1
}

function copy
{
  for name in $*
  do
    cp $name "$name".copy
  done
}

function realpath
{
  dirname=`perl -e 'use Cwd "abs_path";print abs_path(shift)' $0`
  echo $dirname
}

# homebrew bash completion
source `brew --prefix`/Library/Contributions/brew_bash_completion.sh

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

function de
{
	mv $1 ~/.Trash
}
