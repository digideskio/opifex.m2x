#!/bin/sh
# Usage: send.sh <message>
# Assumes curl has been installed

# TODO: CHANGE THESE TO THE APPROPRIATE VALUES
USERNAME=test
PASSWORD=test
AMQP_HOST=bus00.beta.wot.io
AMQP_PORT=5672
PONTIFEX_HOST=http.beta.wot.io
VHOST=wot
EXCHANGE=test
KEY=test
QUEUE=test
TOKEN=test1234

MESSAGE=$1

export AMQP=amqp://$USERNAME:$PASSWORD@$AMQP_HOST:$AMQP_PORT/$VHOST
export AUTH=10.210.130.127

echo Sending message...
echo "    $MESSAGE"
curl "http://$PONTIFEX_HOST/$VHOST/$EXCHANGE/$KEY/$QUEUE" -X PUT --data-ascii "$MESSAGE" -H "Content-Type: application/json" -H "Authorization: Bearer $TOKEN"
echo
