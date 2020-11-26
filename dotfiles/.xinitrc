exec openbox-session
default_user        gibranlp

case "$1" in
    openbox) exec openbox-session ;;
     qtile) exec qtile-session ;;
     
     *) exec $DEFAULTSESSION ;;
esac