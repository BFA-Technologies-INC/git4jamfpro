#!/bin/sh

ATTR="com.TeamViewer.ConfigurationId"
CONFIG_ID="$4"
TVHOST="/Applications/TeamViewerQS.app"
STATUS=$(/usr/bin/xattr -l "$TVHOST")

# If no extended attribute present, write it
if [ "$STATUS" = "" ]; then
  /bin/echo "Writing TeamViewer Host configuration ID ..."
  /usr/bin/xattr -w "$ATTR" "$CONFIG_ID" "$TVHOST"
else
  /bin/echo "TeamViewer Host configuration ID already present."
fi

exit