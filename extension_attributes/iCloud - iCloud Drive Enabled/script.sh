#!/bin/bash

# Determine if iCloud Drive is enabled

#Variable to determine major OS version (maybe only use this script if we know a device is running > 10.12)
#ProductVersion=$(sw_vers | grep "ProductVersion" | awk '{ print $2; }')

# who is local user
loggedInUser=$(/usr/bin/stat -f%Su "/dev/console")

if [[ -e "/Users/$loggedInUser/Library/Mobile Documents/com~apple~CloudDocs/" ]] ; then
	
	DocSyncStatus="Yes"
else
	DocSyncStatus="No"
fi

# Report result.
echo "<result>$DocSyncStatus</result>"

exit 0