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
	#	console.log(data)
	#	console.log(config.feed,data[2], { value: (new Date(data[4].arrive) - new Date()) })
		station = data[2].replace(/[^a-zA-Z0-9]+/g,'_')
		console.log station, (new Date(data[4].arrive) - new Date()) 
		return m2x.feeds.updateStream(config.feed,station, { value: (new Date(data[4].arrive) - new Date())  }, (res) -> console.log(station, res) )

