#!/bin/bash
# This extension attribute determines whether Escrow Buddy is correctly configured in the macOS authorization database.

DBENTRY="<string>Escrow Buddy:Invoke,privileged</string>"
if /usr/bin/security authorizationdb read system.login.console 2>/dev/null | grep -q "$DBENTRY"; then
    echo "<result>Configured</result>"
else
    echo "<result>Not Configured</result>"
fi