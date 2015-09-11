#!/bin/sh
# Usage: send.sh <message>
# Assumes curl has been installed

# TODO: CHANGE THESE TO THE APPROPRIATE VALUES
USERNAME=test
PASSWORD=test
AMQP_HOST=localhost
AMQP_PORT=5672
PONTIFEX_HOST=localhost
VHOST=wot
EXCHANGE=test
KEY=test
QUEUE=test
TOKEN=test1234

MESSAGE=$1

export AMQP=amqp://$USERNAME:$PASSWORD@$AMQP_HOST:$AMQP_PORT/$VHOST
export AUTH=

echo Sending message...
echo "    $MESSAGE"
curl "http://$PONTIFEX_HOST/$VHOST/$EXCHANGE/$QUEUE/$KEY" -X PUT --data-ascii "$MESSAGE" -H "Content-Type: application/json" -H "Authorization: Bearer $TOKEN"
echo
