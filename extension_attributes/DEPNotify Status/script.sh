#!/bin/bash

if [[ -e /var/tmp/depnotify.log ]]; then
	result=$(cat /var/tmp/depnotify.log | awk '/Status: Configuration Complete!/ {print $0}')
	if [[ ! -z "$result" ]]; then
		echo "<result>Has Run</result>"
		exit 0
	fi
	echo "<result>Has Not Run</result>"
	exit 0
fi
echo "<result>Has Not Run</result>"