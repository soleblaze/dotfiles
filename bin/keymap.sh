xmodmap ~/.Xmodmap
sleep 2

if pgrep -x "xcape" > /dev/null
then
    pkill xcape
fi
xcape -e 'Control_R=Escape;Super_R=Tab'
