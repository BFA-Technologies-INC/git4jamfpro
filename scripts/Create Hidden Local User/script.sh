#!/bin/sh

#setting Jamf binary variable
jamf=$(which jamf)

# Create a hidden user
myUser_long=$4

myUser_short=$5

myUser_passwd=$6


#creating hidden user
"$jamf" createAccount -username "$myUser_short" -realname "$myUser_long" -password "$myUser_passwd" –home /private/var/$myUser_short –shell “/bin/bash” -hiddenUser -admin
