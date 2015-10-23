#server aliases
myusr=ADDUSERHERE
mylclusr=ANOTHERUSERHERE
alias csci="ssh -CX ${myusr}@elra-01.cs.colorado.edu" 

alias janus='ssh ${myusr}@login.rc.colorado.edu'

alias blanca='ssh ${myusr}@blogin01.rc.colorado.edu'

alias grey='ssh ${mylclusr}@grey.colorado.edu'


#blanca interactive port forwarding
function blancaint() { ssh -f ${myusr}@blogin01.rc.colorado.edu -L ${1}:localhost\
:${1} -N ;}


#proxy switch
alias proxyoff='networksetup -setwebproxystate wi-fi off'

alias proxyon='networksetup -setwebproxystate wi-fi on'


#misc local stuff
myaliasip=alisoncartwright.com

alias whatsmyip="curl -s checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"

alias seedbox='ssh -p 2222 ${mylclusr}@$myaliasip'

alias startsudovnc="ssh -tp 2222 ${mylclusr}@$myaliasip '\''sudo screen -dmS vnc x11vnc -xkb -noxrecord -noxfixes -noxdamage -display :0 -auth /var/run/lightdm/root/:0 -nopw >> /home/nketz/screenerror.log';/Applications/'Chicken.app'/Contents/MacOS/'Chicken' 192.168.1.125&"

alias startvnc='ssh -p 2222 ${mylclusr}@$myaliasip '\''screen -dmS vnc x11vnc -nopw -display :0'\'';/Applications/JollysFastVNC.app/Contents/MacOS/JollysFastVNC&'

alias seedsshfs="sshfs {mylclusr}@${myaliasip}:/home/nketz/Downloads ~/ubuntu -p 2222"

alias boulder='cd ~/Documents/Documents/boulder'
