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
	this['*'] = (data...) ->
		key = data[4].replace(/\W+/g,'_')
		value = Math.max(0,(new Date(data[7]*1000) - new Date())/60000)
		return m2x.feeds.updateStream(config.feed,key, { value: value }, (res) -> console.log(key, res) )

