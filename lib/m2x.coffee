# opifex.m2x
# http://wot.io
#
# Copyright (c) 2015 wot.io
# Licensed under the Apache 2.0 license.

M2XConfig = require 'config'
M2XClient = require 'm2x'

class M2X
	constructor: () ->
		@config = M2XConfig
		@whitelist = @config?.api?.whitelist and @config.api.whitelist.split(/[\s,]+/) or []
		@m2x = new M2XClient (@config?.apiKey or '')
		console.log "Opifex M2X is running with the following parameters: #{JSON.stringify @config}"

	'*': (m2xMethod, parameters...) ->
		if (not @whitelist?.length or m2xMethod in @whitelist) and @m2x?.devices?[m2xMethod]
			console.log "Executing: #{m2xMethod} with #{JSON.stringify parameters}"
			try
				@m2x.devices[m2xMethod].apply @m2x, (parameter for parameter in parameters).concat (result) =>
					@send ["response", m2xMethod, result.status, result.json]
			catch e
				console.error "ERROR: #{e}"
		else
			console.error "Invalid M2X method: #{m2xMethod}"

module.exports = M2X
