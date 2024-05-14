#!/bin/bash
# Default Jamf inventory collection does not collect versions of non-app bundles like authorization plugins.
# You can use this extension attribute to retrieve the installed version of Escrow Buddy.


BUNDLE_PATH="/Library/Security/SecurityAgentPlugins/Escrow Buddy.bundle"
VERSION_KEY="CFBundleShortVersionString"

if [ -f "$BUNDLE_PATH/Contents/Info.plist" ]; then
    RESULT=$(defaults read "$BUNDLE_PATH/Contents/Info.plist" "$VERSION_KEY")
else
    RESULT="Not Installed"
fi

echo "<result>$RESULT</result>"