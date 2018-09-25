#!/bin/bash

# Telegram notify bot
# Send simple message to user by telegram

BOT_TOKEN="550153967:AAH6ov8B_rFPcUJpwpEhbmmcBs-QGUHBYq0"
USER_ID=315716801 		# use @userinfobot to know
MESSAGE="Notify message" # init with default value

# parse arguments
while [[ $1 != '' ]]; do
	case $1 in
		-m | --message )	shift
					MESSAGE=$1;
					;;
		-u | --target-user )	shift
					USER_ID=$1;
					;;
		* )			echo "Unknown argument: $1"
					exit 1
	esac
	shift
done

echo "Sending '$MESSAGE' to user-$USER_ID";
curl "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage?chat_id=${USER_ID}&text=${MESSAGE}";
