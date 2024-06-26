#!/bin/bash
#######################################################################
# A script to collect the Bundle Version of Google Drive File Stream. #
#######################################################################

PATH_EXPR=(/Applications/*/Contents/MacOS/Google\ Drive*)
KEY="CFBundleVersion"

IFS=$'\n'
unset RESULTS
for BINARY in "${PATH_EXPR[@]}"; do
	PLIST=$(/usr/bin/dirname "${BINARY}")/../Info.plist
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