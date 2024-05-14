#!/bin/zsh

#Call Dialog, and set options. The \ at the end of each line is to escape the carriage return in order to make this readable.
/usr/local/bin/dialog \
--title "Action Requested" \
--titlefont "name=Avenir,colour=#FF0000,size=24" \
--message "**Your IT Department needs help!**\n\nLoremIpsum. \n\nPlease click 'Self Service' to resolve" \
--width 300 --height 300 \
--messagefont size=14 \
--position topright \
--ontop \
--messagealignment centre \
--messageposition centre \
--centericon \
--icon "/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/Actions.icns" \
--button1text "Self Service" \
--button1action "jamfselfservice://content?entity=policy&id=2&action=execute" 
#--button2
#If you wanted to include a Cancel button, uncomment the line above ^^^

