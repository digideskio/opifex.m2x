# opifex.m2x
# http://wot.io
#
# Copyright (c) 2015 wot.io
# Licensed under the Apache 2.0 license.
#

M2XAdapter = require('./m2x')

opifex = () ->
	self = this
	adapter = new M2XAdapter()
	adapter.send = () -> self.send.apply self, arguments

	self['*'] = (message...) ->
		adapter['*'].apply adapter, message

	self

module.exports = opifex
