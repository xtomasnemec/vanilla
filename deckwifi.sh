steamos-readonly disable
read -p "Enable or disable Vanilla Wi-Fi patch? [y/N] " answer
case "$answer" in
    [yY][eE][sS]|[yY])
        echo "Continuing..."
        mv /etc/NetworkManager/conf.d/wifi_backend.conf /etc/NetworkManager/conf.d/wifi_backend.conf.bak
        mv /usr/lib/NetworkManager/conf.d/10-steamos-defaults.conf /usr/lib/NetworkManager/conf.d/10-steamos-defaults.conf.bak
        systemctl restart NetworkManager
        killall iwd
        exit 0
        ;;
    [nN][oO]|[nN])
        echo "You chose NO."
        sudo mv /etc/NetworkManager/conf.d/wifi_backend.conf.bak /etc/NetworkManager/conf.d/wifi_backend.conf
        sudo mv /usr/lib/NetworkManager/conf.d/10-steamos-defaults.conf.bak /usr/lib/NetworkManager/conf.d/10-steamos-defaults.conf
        sudo systemctl restart NetworkManager
        exit 0
        ;;
    *)
        echo "Aborted."
        exit 1
        ;;
esac
steamos-readonly enable 