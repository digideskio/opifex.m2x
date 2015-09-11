#!/bin/sh
# Usage: listen.sh
# Assumes the opifex package (http://github.com/wotio/opifex) has been installed and 
# the contents of its bin/ directory are in your PATH

# TODO: CHANGE THESE TO THE APPROPRIATE VALUES
USERNAME=test
PASSWORD=test
AMQP_HOST=localhost
AMQP_PORT=5672
VHOST=wot
EXCHANGE=console
KEY=m2x
QUEUE=m2x
OPIFEX=node_modules/opifex/bin/opifex
export LOG_LEVEL=debug
export M2X_API_KEY=aacabbe65da2f5fa195040cbc3275531
export M2X_API_WHITELIST="list,create,updateStream,deleteDevice,setStreamValue,streams,postMultiple"

CMD="$OPIFEX amqp://$USERNAME:$PASSWORD@$AMQP_HOST:$AMQP_PORT/$VHOST/$QUEUE amqp://$USERNAME:$PASSWORD@$AMQP_HOST:$AMQP_PORT/$VHOST/$EXCHANGE/$KEY m2x"
echo Listening on AMQP...
echo $CMD
$CMD
