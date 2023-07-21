#!/bin/bash

#setting variables for logged in user and their home folder
currentUser=$(ls -l /dev/console | awk '{print $3}')
userHome=$(dscl . read /Users/$currentUser NFSHomeDirectory | awk '{print $2}')

#adding in items to the dock
/usr/local/bin/dockutil --add /Applications/Microsoft\ Word.app --no-restart $userHome
/usr/local/bin/dockutil --add /Applications/Microsoft\ PowerPoint.app --no-restart $userHome
/usr/local/bin/dockutil --add /Applications/Microsoft\ Excel.app --no-restart $userHome
/usr/local/bin/dockutil --add /Applications/Microsoft\ Outlook.app --no-restart $userHome
/usr/local/bin/dockutil --add /Applications/Google\ Chrome.app --no-restart $userHome
/usr/local/bin/dockutil --add /Applications/HighfiveApp.app --no-restart $userHome
/usr/local/bin/dockutil --add /Applications/Self\ Service.app --no-restart $userHome

#removing items from the dock
/usr/local/bin/dockutil --remove 'Launchpad' --no-restart $userHome
/usr/local/bin/dockutil --remove 'Mail' --no-restart $userHome
/usr/local/bin/dockutil --remove 'FaceTime' --no-restart $userHome
/usr/local/bin/dockutil --remove 'Messages' --no-restart $userHome
/usr/local/bin/dockutil --remove 'Maps' --no-restart $userHome
/usr/local/bin/dockutil --remove 'Photos' --no-restart $userHome
/usr/local/bin/dockutil --remove 'Contacts' --no-restart $userHome
/usr/local/bin/dockutil --remove 'Calendar' --no-restart $userHome
/usr/local/bin/dockutil --remove 'Reminders' --no-restart $userHome
/usr/local/bin/dockutil --remove 'Notes' --no-restart $userHome
/usr/local/bin/dockutil --remove 'Music' --no-restart $userHome
/usr/local/bin/dockutil --remove 'Podcasts' --no-restart $userHome
/usr/local/bin/dockutil --remove 'TV' --no-restart $userHome
/usr/local/bin/dockutil --remove 'News' --no-restart $userHome
/usr/local/bin/dockutil --remove 'App Store' --no-restart $userHome
/usr/local/bin/dockutil --remove 'Safari' --no-restart $userHome



#checks if specific app are installed, if they are, adds them to the dock
if [[ -e /Applications/Sketch.app ]]; then
	/usr/local/bin/dockutil --add /Applications/Sketch.app --no-restart $userHome
fi

if [[ -e /Applications/Adobe\ Acrobat\ DC/Adobe\ Acrobat.app ]]; then
	/usr/local/bin/dockutil --add /Applications/Adobe\ Acrobat\ DC/Adobe\ Acrobat.app --no-restart $userHome
fi

if [[ -e /Applications/Adobe\ Bridge\ CC\ 2019/Adobe\ Bridge\ 2019.app ]]; then
	/usr/local/bin/dockutil --add /Applications/Adobe\ Bridge\ CC\ 2019/Adobe\ Bridge\ 2019.app --no-restart $userHome
fi

if [[ -e /Applications/Adobe\ Illustrator\ CC\ 2019/Adobe\ Illustrator\ 2019.app ]]; then
	/usr/local/bin/dockutil --add /Applications/Adobe\ Illustrator\ CC\ 2019/Adobe\ Illustrator\ 2019.app --no-restart $userHome
fi

if [[ -e /Applications/Adobe\ InCopy\ CC\ 2019/Adobe\ InCopy\ CC\ 2019.app ]]; then
	/usr/local/bin/dockutil --add /Applications/Adobe\ InCopy\ CC\ 2019/Adobe\ InCopy\ CC\ 2019.app --no-restart $userHome
fi

if [[ -e /Applications/Adobe\ InDesign\ CC\ 2019/Adobe\ InDesign\ CC\ 2019.app ]]; then
	/usr/local/bin/dockutil --add /Applications/Adobe\ InDesign\ CC\ 2019/Adobe\ InDesign\ CC\ 2019.app --no-restart $userHome
fi

if [[ -e /Applications/Adobe\ Photoshop\ CC\ 2019/Adobe\ Photoshop\ CC\ 2019.app ]]; then
	/usr/local/bin/dockutil --add /Applications/Adobe\ Photoshop\ CC\ 2019/Adobe\ Photoshop\ CC\ 2019.app --no-restart $userHome
fi

if [[ -e /Applications/Adobe\ Premiere\ Pro\ CC\ 2019/Adobe\ Premiere\ Pro\ CC\ 2019.app ]]; then
	/usr/local/bin/dockutil --add /Applications/Adobe\ Premiere\ Pro\ CC\ 2019/Adobe\ Premiere\ Pro\ CC\ 2019.app --no-restart $userHome
fi


killall cfprefsd 2>&1
killall Dock 2>&1
exit 0