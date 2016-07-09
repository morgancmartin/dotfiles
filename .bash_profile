#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH=/opt/bin:$PATH

export PATH=/home/morgan/.npm-global/lib:$PATH

export PATH=/home/morgan/.myscripts:$PATH
source ~/.profile
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
