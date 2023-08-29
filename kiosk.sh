#!/bin/bash
# Disable screen blanking and screensavers
xset s noblank
xset s off
xset -dpms

# Hide the mouse cursor when it's idle
unclutter -idle 0.5 -root &

# Modify Chromium preferences to prevent error dialogs
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' /home/pi/.config/chromium/Default/Preferences
sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' /home/pi/.config/chromium/Default/Preferences

# Launch Chromium in kiosk mode
/usr/bin/chromium-browser --noerrdialogs --disable-infobars --kiosk https://youtube.com &

# Periodically switch between tabs every 10 seconds
while true; do
   xdotool keydown ctrl+Tab; xdotool keyup ctrl+Tab;
   sleep 10
done
