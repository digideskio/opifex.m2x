# opifex.m2x
# http://wot.io
#
# Copyright (c) 2015 wot.io
# Licensed under the Apache 2.0 license.

assert = require 'assert'
chai = require 'chai'
chai.expect()

context = {}
args = []
opifex = require('../lib/opifex').apply context, args

describe 'opifex.opifex adapter', () ->
	it 'opifex should load and be a function', () ->
		chai.expect(opifex).to.be.a('object')
	it 'opifex supports handling of arbitrary functions', () ->
		chai.expect(context["*"]).to.be.a('function')
