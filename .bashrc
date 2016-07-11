#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


bl() {
    local signal
    local cmd
    case "$1" in
        "") blockify-dbus get && return 0;;
        ex) signal='TERM';;       # Exit
        b) signal='USR1';;        # Block
        u) signal='USR2';;        # Unblock
        p) signal='RTMIN';;       # Previous song
        n) signal='RTMIN+1';;     # Next song
        t) signal='RTMIN+2';;     # Toggle play song
        tb) signal='RTMIN+3';;    # Toggle block song
        pi) signal='RTMIN+10';;   # Previous interlude song
        ni) signal='RTMIN+11';;   # Next interlude song
        ti) signal='RTMIN+12';;   # Toggle play interlude song
        tir) signal='RTMIN+13';;  # Toggle interlude resume
        *) echo "Bad option" && return 0;;
    esac
    pkill --signal "$signal" -f 'python.*blockify'
}

# Set VIM as default editor
export VISUAL="vim"
# Load RVM into a shell session *as a function*

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.npm-global/bin" # Add NPM to PATH

# Set gitignore on or off
function githome {
    if [ $1 ]; then
        if [ $1 == 'disable' ]; then
            mv ~/.git ~/.git_
            mv ~/.gitignore ~/.gitignore_
        elif [ $1 == 'enable' ]; then
            mv ~/.git_ ~/.git
            mv ~/.gitignore_ ~/.gitignore
        else
            echo "Unrecognized argument value $1, please specify 'enable' or 'disable'"
        fi
    else
        echo "Please specify 'enable' or 'disable'"
    fi
}
alias githome='githome'

# Set up an alias for copying and pasting
alias "c=xclip"
alias "v=xclip -o"
