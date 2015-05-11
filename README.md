# opifex.m2x

This library provides an [opifex](https://github.com/WoTio/opifex) adapter integrating [AT&T M2X](https://m2x.att.com/) with the [wot.io](http://wot.io) operating environment (OE). As an adapter component, it requires a deployed wot.io OE to run as designed. [Contact wot.io](http://wot.io/about-wot-io/contact-us/) for more information.

wot.io is an IoT data service exchange<sup>TM</sup> for connected devices and data that lets current and future players in the IoT ecosystem--app creators, system integrators, analytics providers, and hardware companies--bring together applications and devices on any standard or connectivity, instantly and intuitively.

wot.io provides a cloud-based environment that reduces the friction in IoT deployment with a seamless, simple, and elegant operating environment. The result is a foundation for innovative solutions that unlocks value in data, delivers new service possibilities, and drives value-added services in what is becoming the largest market the world has ever known.

## Installation

To install, simply use the node package manager in the usual fashion:

	npm install opifex.m2x

## Usage

As with all opifex adapters, the `opifex.m2x` adapter is loaded dynamically by an `opifex` process that binds to a specific AMQP path. The `opifex` command takes the URI of an AMQP path to listen on and the adapter name as arguments:

	opifex 'amqp://<user>:<password>@<host>:<port>/<domain>/<exchange>/<key>/<queue>[/<dest-key>[/<dest-queue>]]' m2x

## Messages

The `opifex.m2x` adapter responds to the following messages:

* `[*, ...]` - default handler for m2x devices APIs

## Configuration

The `opifex.m2x` adapter can be configured via the following environment variables (default values shown):

	M2X_API_KEY='<M2X account API Key>'  # see https://m2x.att.com/signup
	M2X_API_WHITELIST='<comma-delimited list of messages to expose>'  # An empty list means, support all M2X API methods listed below

## Supported Messages

Message parameter lists correspond to the [M2X API documentation](https://m2x.att.com/developer/documentation/v2/device)

* [catalog](https://m2x.att.com/developer/documentation/v2/device#List-Search-Public-Devices-Catalog)
* [create](https://m2x.att.com/developer/documentation/v2/device#Create-Device)
* [createTrigger](https://m2x.att.com/developer/documentation/v2/device#Create-Trigger)
* [deleteDevice](https://m2x.att.com/developer/documentation/v2/device#Delete-Device)
* [deleteStream](https://m2x.att.com/developer/documentation/v2/device#Delete-Data-Stream)
* [deleteStreamValues](https://m2x.att.com/developer/documentation/v2/device#Delete-Data-Stream-Values)
* [deleteTrigger](https://m2x.att.com/developer/documentation/v2/device#Delete-Trigger)
* [Devices](https://m2x.att.com/developer/documentation/device)
* [list](https://m2x.att.com/developer/documentation/v2/device#List-Search-Devices)
* [location](https://m2x.att.com/developer/documentation/v2/device#Read-Device-Location)
* [log](https://m2x.att.com/developer/documentation/v2/device#View-Request-Log)
* [postValues](https://m2x.att.com/developer/documentation/v2/device#Post-Data-Stream-Values)
* [sampleStreamValues](https://m2x.att.com/developer/documentation/v2/device#Data-Stream-Sampling)
* [setStreamValue](https://m2x.att.com/developer/documentation/v2/device#Update-Data-Stream-Value)
* [stream](https://m2x.att.com/developer/documentation/v2/device#View-Data-Stream)
* [streams](https://m2x.att.com/developer/documentation/v2/device#List-Data-Streams)
* [streamStats](https://m2x.att.com/developer/documentation/v2/device#Data-Stream-Stats)
* [streamValues](https://m2x.att.com/developer/documentation/v2/device#List-Data-Stream-Values)
* [tags](https://m2x.att.com/developer/documentation/v2/device#List-Device-Tags)
* [testTrigger](https://m2x.att.com/developer/documentation/v2/device#Test-Trigger)
* [trigger](https://m2x.att.com/developer/documentation/v2/device#View-Trigger)
* [triggers](https://m2x.att.com/developer/documentation/v2/device#List-Triggers)
* [update](https://m2x.att.com/developer/documentation/v2/device#Update-Device-Details)
* [updateLocation](https://m2x.att.com/developer/documentation/v2/device#Update-Device-Location)
* [updateStream](https://m2x.att.com/developer/documentation/v2/device#Create-Update-Data-Stream)
* [updateStreams](https://m2x.att.com/developer/documentation/v2/device#Create-Update-Data-Stream)
* [updateTrigger](https://m2x.att.com/developer/documentation/v2/device#Update-Trigger)
* [view](https://m2x.att.com/developer/documentation/v2/device#View-Device-Details)

## License

Copyright (c) 2015 wot.io

Licensed under the Apache 2.0 license.
