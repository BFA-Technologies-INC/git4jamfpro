#!/bin/bash
#######################################################
# A script to collect the Version of Mozilla Firefox. #
#######################################################

PATH_EXPR=(/Applications/*/Contents/*/application.ini)
KEY="CFBundleShortVersionString"
RELEASE="mozilla-release"

IFS=$'\n'
unset RESULTS
for APP_INI in $(/usr/bin/grep -l "${RELEASE}" "${PATH_EXPR[@]}" 2>/dev/null); do
	PLIST=$(/usr/bin/dirname "${APP_INI}")/../Info.plist
	VERSION=$(/usr/bin/defaults read "${PLIST}" "${KEY}" 2>/dev/null)
	if [ -n "${VERSION}" ] ; then
		RESULTS+=("${VERSION}")
	fi
done
unset IFS

if [ ${#RESULTS[*]} -eq 0 ]; then
	/bin/echo "<result></result>"
else
	IFS="|"
	/bin/echo "<result>|${RESULTS[*]}|</result>"
	unset IFS
fi

exit 0