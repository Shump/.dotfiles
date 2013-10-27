
if [[ `uname` == 'Linux' ]]; then
	# ARCH:
	# ~/.bashrc
	#

	# If not running interactively, don't do anything
	[[ $- != *i* ]] && return

	eval "`dircolors`"
	alias ls='ls --color=auto'
	PS1='[\u@\h \W]\$ '

	# END ARCH TODO: Check os!
fi


if [[ `uname` == 'Darwin' ]]; then
	eval "`gdircolors`"
	alias ls='gls -h --color'
	alias vim='mvim -v'
	alias gvim='mvim'
fi
alias ll='ls -lah'
alias la='ls -ah'


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

function de
{
	mv $1 ~/.Trash
}

if [[ `uname` == 'Darwin' ]]; then
	# homebrew bash completion
	source `brew --prefix`/Library/Contributions/brew_bash_completion.sh

	[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

	if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
	fi
fi
