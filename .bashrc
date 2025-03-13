#
# ~/.bashrc
#
# /usr/share/X11/xkb/symbols/us --> keymap location

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias yoink='sudo pacman -S'
alias yeet='sudo pacman -R'
alias flashbang='sudo xbacklight -set 100'
alias owl='sudo xbacklight -set 10'
alias brightness='sudo xbacklight -set'
alias arch='neofetch'
alias archgit='pacman -Qqen > ~/pkg/pkglist.txt && pacman -Qqem > ~/pkg/pkglist_aur.txt && cp ~/gitignore/archconfig/.gitignore ~/.gitignore && git --git-dir=.gitarchconfig'
alias orggit='cp ~/gitignore/orgdocs/.gitignore ~/.gitignore && git --git-dir=.gitorgdocs'
alias luvm='qemu-system-x86_64 -m 8192 -usbdevice tablet -smp 12 -vga virtio -device virtio-blk-pci,drive=hd0 -drive if=none,id=hd0,file=/home/miyako/qemu/LucrumVM/Lucrum.img,format=raw -enable-kvm'
alias matlab='/usr/local/MATLAB/R2024b/bin/matlab'
PS1='[\u@\h \W]\$ '


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/miyako/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/miyako/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/miyako/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/miyako/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

