#!/bin/bash

#link the usb drive dirs into the /gaadata
cd /media/games
for D in *; do
    if [ -d "${D}" ]; then
        ln -s /media/games/${D} /gaadata/${D}
    fi
done

#backup the original db file from the console itself 
dbfile=/media/games/regional.ori.db
if [ ! -f "$dbfile" ]; then
    cp /gaadata/databases/regional.db /media/games/regional.ori.db 
fi 

#install our custom db
cp /media/games/custom.db /gaadata/databases/regional.db

#sync usb drive
sync

#Execute PCSX ESC menu while pressing select+triangle on controller
sleep 5s
export PCSX_ESC_KEY=2
killall ui_menu
sleep 5s
cd /data/AppData/sony/pcsx
/usr/sony/bin/ui_menu --power-off-enable
sync 

# kill the ui process
killall ui_menu

# restart ui
/usr/sony/bin/ui_menu

# sleep forever so the usb is never unmounted
while :; do sleep 10; done
