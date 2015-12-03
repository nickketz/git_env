#server aliases
myusr=UniUser
mylclusr=LocalUser
myport=LocalSSHPort
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

alias whatsmyip='dig +short myip.opendns.com @resolver1.opendns.com'

alias seedbox='ssh -p ${myport} ${mylclusr}@$myaliasip'

alias startvnc='ssh -p ${myport} ${mylclusr}@$myaliasip '\''screen -dmS vnc x11vnc -loop100 -many -usepw -display :0'\'';sleep 5;open vnc://192.168.1.125'

alias killvnc="ssh -p ${myport} ${mylclusr}@$myaliasip '\''killall -9 x11vnc'"

alias startsudovnc="ssh -tp ${myport} ${mylclusr}@$myaliasip '\''sudo screen -dmS vnc x11vnc -display :0 -auth /var/run/lightdm/root/:0 -usepw'"

#alias startsudovnc="ssh -tp ${myport} ${mylclusr}@$myaliasip '\''sudo screen -dmS vnc x11vnc -many -loop100 -display :0 -auth /var/run/lightdm/root/:0 -usepw';sleep 5;open vnc://192.168.1.125"

alias startvlc="ssh -p ${myport} ${mylclusr}@$myaliasip '\''export DISPLAY=:0; screen -dmS vlc vlc -I http'"

alias killvlc="ssh -p ${myport} ${mylclusr}@$myaliasip '\''killall -9 vlc'"

alias startkodi="ssh -p ${myport} ${mylclusr}@$myaliasip '\''export DISPLAY=:0; screen -dmS kodi kodi'"

alias killkodi="ssh -p ${myport} ${mylclusr}@$myaliasip '\''killall -9 kodi.bin'"

alias seedsshfs="sshfs {mylclusr}@${myaliasip}:~/Downloads ~/ubuntu -p ${myport}"

alias boulder='cd ~/Documents/Documents/boulder'
