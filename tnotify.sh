#!/bin/bash

# Telegram notify bot
# Send simple message to user by telegram

source ./tnotifier.cfg

# Parse arguments
while [[ $1 != '' ]]; do
	case $1 in
		-m | --message )	shift
					MESSAGE=$1;
					;;
		-u | --target-user )	shift
					USER_ID=$1;
					;;
		-s | --sender-name )	SENDER_NAME=$(hostname)
					;;
		* )			echo "Unknown argument: $1"
					exit 1
	esac
	shift
done

# Attach sender name if required
if [[ $SENDER_NAME ]]; then
	MESSAGE="$SENDER_NAME: $MESSAGE"
fi

# Sendind
echo "Sending \"$MESSAGE\" to user-$USER_ID...";
TR_URL="https://api.telegram.org/bot${BOT_TOKEN}/sendMessage?chat_id=${USER_ID}&text=${MESSAGE}";
if ( curl -s "$TR_URL" | grep -q "\"ok\":true" ); then
	echo "Successful!";
else
	echo "Something went wrong =(";
fi
