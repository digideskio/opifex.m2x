# opifex.m2x

This library provides an [Opifex](https://github.com/WoTio/opifex) adapter integrating m2x with the [wot.io](http://wot.io) operating environment.

## Installation

To install, simply use the node package manager in the usual fashion:

	npm install opifex.m2x

## Usage

As with all Opifex adapters, the `opifex.m2x` adapter is loaded dynamically by an `opifex` process that binds to a specific AMQP path. The `opifex` command takes the URI of an AMQP path to listen on and the adapter name as arguments:

	opifex 'amqp://<user>:<password>@<host>:<port>/<domain>/<exchange>/<key>/<queue>[/<dest-key>[/<dest-queue>]]' m2x

## Messages

The `opifex.m2x` adapter responds to the following messages:

* `["awesome"]` - returns the string `opifex.m2x is awesome`
* `["echo", message]` - returns all arguments as a string
* `["say", message]` - echoes `message` to the opifex system's console, preceded by the string configured via the `MESSAGE_PREFIX` environment variable
* `["forward", message]` - sends the `message` to the destination exchange and route
* `[*, ...]` - echoes all remaining arguments to the opifex system's console

## Configuration

The `opifex.m2x` adapter can be configured via the following environment variables (default values shown):

	MESSAGE_PREFIX='The message is: '

## License

Copyright (c) 2015 wot.io

Licensed under the Apache 2.0 license.
