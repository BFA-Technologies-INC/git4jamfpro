#!/bin/bash


# Determine if iCloud Drive is syncing Desktop and Documents folder

#Variable to determine major OS version (maybe only use this script if we know a device is running > 10.12)
#ProductVersion=$(sw_vers | grep "ProductVersion" | awk '{ print $2; }')

# who is local user
loggedInUser=$(/usr/bin/stat -f%Su "/dev/console")

filePath="/Users/$loggedInUser/Library/Mobile Documents/com~apple~CloudDocs/Documents"

if [[ -L "$filePath" ]] ; then
	
	DesktopSyncStatus="Yes"
else
	DesktopSyncStatus="No"
fi

# Report result.
echo "<result>$DesktopSyncStatus</result>"

exit 0