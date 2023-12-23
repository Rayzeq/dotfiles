#!/usr/bin/env nix-shell
#!nix-shell -i bash -p bash
 
lock=" Lock"
logout=" Logout"
sleep=" Hibernate"
shutdown="襤 Poweroff"
reboot=" Reboot"
 
selected_option=$(echo "$lock
$logout
$sleep
$shutdown
$reboot" | rofi -dmenu -i -p "Powermenu" -l 5 -theme "~/.config/rofi/powermenu.rasi")

if [ "$selected_option" == "$lock" ]
then
  echo "lock"
elif [ "$selected_option" == "$logout" ]
then
  hyprctl dispatch exit
elif [ "$selected_option" == "$sleep" ]
then
  systemctl hibernate
elif [ "$selected_option" == "$shutdown" ]
then
  systemctl poweroff
elif [ "$selected_option" == "$reboot" ]
then
  systemctl reboot
else
  echo "No match"
fi