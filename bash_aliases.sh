#server aliases
myusr=ADDUSERHERE
mylclusr=ANOTHERUSERHERE
myport=PORTNUMBER
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

alias startvnc='ssh -p ${myport} ${mylclusr}@$myaliasip '\''screen -dmS vnc x11vnc -nopw -display :0'\'';/Applications/JollysFastVNC.app/Contents/MacOS/JollysFastVNC&'

alias seedsshfs="sshfs {mylclusr}@${myaliasip}:/home/nketz/Downloads ~/ubuntu -p ${myport}"

alias boulder='cd ~/Documents/Documents/boulder'
