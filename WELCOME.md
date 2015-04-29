# Welcome

Congratulations! You are now the proud owner of a fully functional opifex adapter.

After reading this file, you'll probably want to just delete it. There is certainly no need to commit it to your project!

## Next Steps

Feel free now to proceed with your normal `node.js` development process. To get you started, we've added some basic [Grunt.js](http://gruntjs.com) tasks. For example, go ahead and try 

	grunt test

to run the [Mocha](http://mochajs.org) test suite,

	grunt jshint

to run the [jshint](http://www.jshint.com) linter, or

	grunt check-licenses

to recursively scan your project dependencies for acceptable licenses. Check the `Gruntfile.js` for the complete list of pre-defined tasks.

But while all of that is convenient, you will probably want to do something useful with your shiny new opifex adapter. So you'll most likely want to edit the example module located in `lib/m2x.coffee`.

As the design for your adapter evolves, you will probably want to 

* update this file to serve as the documentation for your module. In particular, make sure to document the messages that your adapter responds to. These comprise the API for interacting with your adapter.
* update the test fixtures in `test/m2x.coffee` 
* make sure you keep the package metadata in `package.json` current. 
* use `Grunt.js` if it's useful to you, ignore it if it's not. Of course, you can continue to use all of the pre-defined `Grunt.js` tasks throughout your development process, and you can easily add your own as well.
