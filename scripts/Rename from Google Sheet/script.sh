#!/bin/sh
## postinstall

# the Google Sheet identifier from the published URL 
sheetID="$4"


# letter designation of the column in the sheet for the device serial numbers
# if following the default format from an Apple School Manager export this will be A
serialCol="A"

# letter designation of the colum in the sheet for the custom device name
nameCol="B"

# get the device serial number
serialNumber=$(system_profiler SPHardwareDataType | awk '/Serial/ {print $4}')

# uncomment for debug
# echo $serialNumber

#Look up serial number from Google Sheet using the Google visualization api
dname=$(curl --silent "https://docs.google.com/spreadsheets/d/$sheetID/gviz/tq?tqx=out:csv&tq=%20select%20$nameCol%20WHERE%20$serialCol%3D%27$serialNumber%27")

# Remove the header information and use quotes
dname=$(echo "$dname" | cut -d '"' -f 2)

# uncomment for debug
 echo "$dname"

#Test to see if the name return has zero length and use serial number instead
if test -z "$dname"
then 
dname=$serialNumber 
fi

# uncomment for debug
echo "$dname"

# local host name does not like spaces in the name, so this replaces any spaces with an underscore
dnameLocal=$(echo "$dname" | tr ' ' '-')
echo "$dnameLocal"

# Name the device using best value
/usr/sbin/scutil --set LocalHostName "$dnameLocal"
/usr/sbin/scutil --set ComputerName "$dname"
/usr/sbin/scutil --set HostName  "$dname"
/usr/bin/dscacheutil -flushcache

/usr/local/bin/jamf recon

exit 0      ## Success