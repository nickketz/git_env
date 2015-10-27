#set prompt
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  SESSION_TYPE=remote/ssh
else
  case $(ps -o comm= -p $PPID) in
    sshd|*/sshd) SESSION_TYPE=remote/ssh;;
  esac
fi

#add git/svn info
source ~/.git-prompt.sh
source ~/.svngit_prompt.sh

function prompt
{
local red="\[\033[0;31m\]"
local RED="\[\033[1;31m\]"
local blue="\[\033[0;34m\]"
local BLUE="\[\033[1;34m\]"
local cyan="\[\033[0;36m\]"
local CYAN="\[\033[1;36m\]"
local NC="\[\033[0m\]"
local WHITE="\[\033[1;37m\]"
local BRIGHTGREEN="\[\033[1;32m\]"
local GREEN="\[\033[0;32m\]"
local CYAN="\[\033[0;36m\]"
local GRAY="\[\033[0;37m\]"
local PURPLE="\[\033[0;35m\]"
local purple="\[\033[1;35m\]"

if [[ "${SESSION_TYPE}" = "remote/ssh" ]]; then  
    HILIT=${red}   # remote machine: prompt will be partly red
else
    HILIT=${cyan}  # local machine: prompt will be partly cyan
fi
PS1="${WHITE}( ${HILIT}\u${BRIGHTGREEN}@${HILIT}\h ${GREEN}\w${PURPLE}\$(__git_svn_ps1)${WHITE} )
${GRAY}==> ${BRIGHTGREEN}"
}
prompt

# Looks best on a terminal with black background.....

printf "${CYAN}This is BASH ${RED}${BASH_VERSION%.*}\
#${CYAN} - DISPLAY on ${RED}$DISPLAY${NC}\n"
date


#-------------------
# Personnal Aliases
#-------------------

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# -> Prevents accidentally clobbering files.
alias mkdir='mkdir -p'

alias h='history'
alias j='jobs -l'
alias which='type -a'
alias ..='cd ..'
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'

alias du='du -kh'       # Makes a more readable output.
alias df='df -kh'

alias emacs='emacs -nw' #non-gui emacs

#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls)
#-------------------------------------------------------------
#alias ll="ls -l --group-directories-first"
alias ls='ls -hFG'  # add colors for filetype recognition
alias la='ls -Al'          # show hidden files
alias lx='ls -lXB'         # sort by extension
alias lk='ls -lSr'         # sort by size, biggest last
alias lc='ls -ltcr'        # sort by and show change time, most recent last
alias lu='ls -ltur'        # sort by and show access time, most recent last
alias lt='ls -ltr'         # sort by date, most recent last
alias lm='ls -al |more'    # pipe through 'more'
alias lr='ls -lR'          # recursive ls
alias tree='tree -Csu'     # nice alternative to 'recursive ls'

# If your version of 'ls' doesn't support --group-directories-first try this:
function ll(){ ls -l "$@"| egrep "^d" ; ls -lXB "$@" 2>&-| \
                egrep -v "^d|total "; }

# Find a file with a pattern in name:
function ff() { find . -type f -iname '*'$*'*' ; }

# Find a file with pattern $1 in name and Execute $2 on it:
function fe()
{ find . -type f -iname '*'${1:-}'*' -exec ${2:-file} {} \;  ; }

# Find a pattern in a set of files and highlight them:
# (needs a recent version of egrep)
function fstr()
{
    OPTIND=1
    local case=""
    local usage="fstr: find string in files.
Usage: fstr [-i] \"pattern\" [\"filename pattern\"] "
    while getopts :it opt
    do
        case "$opt" in
        i) case="-i " ;;
        *) echo "$usage"; return;;
        esac
    done
    shift $(( $OPTIND - 1 ))
    if [ "$#" -lt 1 ]; then
        echo "$usage"
        return;
    fi
    find . -type f -name "${2:-*}" -print0 | \
    xargs -0 egrep --color=always -sn ${case} "$1" 2>&- | more 

}

case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases.sh ]; then
    . ~/.bash_aliases.sh
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

export LESS="-R"
export EDITOR=emacs
export EMERGENT_PREFIX_DIR=$HOME
#export PYTHONSTARTUP=$HOME/.pythonrc.py
export TEXINPUTS="$HOME/tex"
export TEXCONFIG="$HOME/tex"
export BIBINPUTS="$HOME/tex"
export BSTINPUTS="$HOME/tex"
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

#virtual env wrapper
export WORKON_HOME=~/Envs
source /usr/local/bin/virtualenvwrapper.sh

#ipython qtconsole fix?
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
export QTDIR=/usr/local/Qt5.2.0/5.2.0/clang_64/

#misc
myip=$(curl -s checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//')

function sptest {
    curl --interface $1 http://speedtest.wdc01.softlayer.com/downloads/test10.zip > /dev/null
}