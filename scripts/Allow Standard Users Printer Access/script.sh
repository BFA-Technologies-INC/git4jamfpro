#!/bin/bash

# Allow staff to add printers and manage print queue without administrative rights
/usr/sbin/dseditgroup -o edit -a everyone -t group lpadmin

exit 0