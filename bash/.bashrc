#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#--------------------My crap follows--------------------

#Startx automatically
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" = 1 ]; then
  exec startx
fi

#aliases
alias shut="sudo shutdown now"
alias reeb="sudo reboot now"
alias up="amixer -D pulse sset Master 5%+"
alias down="amixer -D pulse sset Master 5%-"

neofetch

