#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vim='nvim'
alias yoink='sudo pacman -S'
alias yeet='sudo pacman -R'
alias flashbang='sudo xbacklight -set 100'
alias owl='sudo xbacklight -set 10'
alias screen='sudo xbacklight -set'
alias arch='neofetch'
alias archgit='pacman -Qqen > ~/pkg/pkglist.txt && pacman -Qqem > ~/pkg/pkglist_aur.txt && cp ~/gitignore/archconfig/.gitignore ~/.gitignore && git --git-dir=.gitarchconfig'
alias orggit='cp ~/gitignore/orgdocs/.gitignore ~/.gitignore && git --git-dir=.gitorgdocs'
PS1='[\u@\h \W]\$ '
