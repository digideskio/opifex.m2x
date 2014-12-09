# M2X.coffee
#
# © 2014 WoT.io
#
# TODO: License text goes here
#

config = require(process.env['HOME'] + '/.m2x')
M2X = (require 'm2x')
m2x = new M2X(config.api_key)

module.exports = () ->
	this['*'] = (key,value) ->
		return m2x.feeds.updateStream(config.feed,key, { value: value }, (res) -> console.log(key, res) )

