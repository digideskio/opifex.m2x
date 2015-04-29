# opifex.m2x
# http://wot.io
#
# Copyright (c) 2015 wot.io
# Licensed under the Apache 2.0 license.

config = require "config"
M2X = require 'm2x'
m2x = new M2X(config.api_key)

module.exports = () ->
	this['*'] = (key,value) ->
		return m2x.feeds.updateStream(config.feed,key, { value: value }, (res) -> console.log(key, res) )

