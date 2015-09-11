#!/usr/bin/env coffee

test = require('tap').test

self = (method, message...)  ->
	$ = arguments.callee
	$[method].apply $, message

self.send = (msg, meta) ->

(require "../lib/m2x.coffee").apply(self)

method_names = [
	"*"
]

check = (method) ->
	test "has method #{method}", (t) ->
		t.ok(self.hasOwnProperty(method) and self[method] instanceof Function, "#{method} exists and is a function")
		t.end()

check method for method in method_names
