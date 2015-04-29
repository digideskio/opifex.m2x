#!/bin/sh
# Usage: listen.sh
# Assumes the opifex package (http://github.com/WoTio/opifex) has been installed and 
# the contents of its bin/ directory are in your PATH

# TODO: CHANGE THESE TO THE APPROPRIATE VALUES
USERNAME=test
PASSWORD=test
AMQP_HOST=bus00.beta.wot.io
AMQP_PORT=5672
VHOST=wot
EXCHANGE=test
KEY=test
QUEUE=test

CMD="opifex \"amqp://$USERNAME:$PASSWORD@$AMQP_HOST:$AMQP_PORT/$VHOST/$EXCHANGE/$KEY/$QUEUE\" m2x"
echo Listening on AMQP...
echo $CMD
$CMD
