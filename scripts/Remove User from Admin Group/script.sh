#!/bin/bash

#get list of all users in the admin group
adminUsers=$(dscl . -read Groups/admin GroupMembership | cut -c 18-)

#runs loop for all users in admin to remove them from the admin group except root and bfaadmin
for user in $adminUsers
do
	if [ "$user" != "root" ]  && [ "$user" != "bfaadmin" ]
	then 
		dseditgroup -o edit -d $user -t user admin
		if [ $? = 0 ]; then echo "Removed user $user from admin group"; fi
	else
		echo "Admin user $user left alone"
	fi
done
