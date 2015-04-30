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

* `[*, ...]` - default handler for m2x devices APIs

## Configuration

The `opifex.m2x` adapter can be configured via the following environment variables (default values shown):

	M2X_API_KEY='M2X account API Key, see https://m2x.att.com/signup'
	M2X_API_WHITELIST='comma delimited list of device API methods supported.  An empty list means, support all current API methods'

## Device API methods supported

* `catalog` - https://m2x.att.com/developer/documentation/v2/device#List-Search-Public-Devices-Catalog
* `create` - https://m2x.att.com/developer/documentation/v2/device#Create-Device
* `createTrigger` - https://m2x.att.com/developer/documentation/v2/device#Create-Trigger
* `deleteDevice` - https://m2x.att.com/developer/documentation/v2/device#Delete-Device
* `deleteStream` - https://m2x.att.com/developer/documentation/v2/device#Delete-Data-Stream
* `deleteStreamValues` - https://m2x.att.com/developer/documentation/v2/device#Delete-Data-Stream-Values
* `deleteTrigger` - https://m2x.att.com/developer/documentation/v2/device#Delete-Trigger
* `Devices` - https://m2x.att.com/developer/documentation/device
* `list` - https://m2x.att.com/developer/documentation/v2/device#List-Search-Devices
* `location` - https://m2x.att.com/developer/documentation/v2/device#Read-Device-Location
* `log` - https://m2x.att.com/developer/documentation/v2/device#View-Request-Log
* `postValues` - https://m2x.att.com/developer/documentation/v2/device#Post-Data-Stream-Values
* `sampleStreamValues` - https://m2x.att.com/developer/documentation/v2/device#Data-Stream-Sampling
* `setStreamValue` - https://m2x.att.com/developer/documentation/v2/device#Update-Data-Stream-Value
* `stream` - https://m2x.att.com/developer/documentation/v2/device#View-Data-Stream
* `streams` - https://m2x.att.com/developer/documentation/v2/device#List-Data-Streams
* `streamStats` - https://m2x.att.com/developer/documentation/v2/device#Data-Stream-Stats
* `streamValues` - https://m2x.att.com/developer/documentation/v2/device#List-Data-Stream-Values
* `tags` - https://m2x.att.com/developer/documentation/v2/device#List-Device-Tags
* `testTrigger` - https://m2x.att.com/developer/documentation/v2/device#Test-Trigger
* `trigger` - https://m2x.att.com/developer/documentation/v2/device#View-Trigger
* `triggers` - https://m2x.att.com/developer/documentation/v2/device#List-Triggers
* `update` - https://m2x.att.com/developer/documentation/v2/device#Update-Device-Details
* `updateLocation` - https://m2x.att.com/developer/documentation/v2/device#Update-Device-Location
* `updateStream` - https://m2x.att.com/developer/documentation/v2/device#Create-Update-Data-Stream
* `updateStreams` - https://m2x.att.com/developer/documentation/v2/device#Create-Update-Data-Stream
* `updateTrigger` - https://m2x.att.com/developer/documentation/v2/device#Update-Trigger
* `view` - https://m2x.att.com/developer/documentation/v2/device#View-Device-Details

## License

Copyright (c) 2015 wot.io

Licensed under the Apache 2.0 license.
