#!/bin/bash

# unlock the sysprefs before unlocking specific panes: 
security authorizationdb write system.preferences allow 

# unlock energysaver: 
security authorizationdb write system.preferences.energysaver allow

#unlock network:
security authorizationdb write system.preferences.network allow

exit 0