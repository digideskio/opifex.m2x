'use strict';

module.exports = function(grunt) {
	// Show elapsed time at the end
	require('time-grunt')(grunt);

	// Load all grunt tasks
	require('load-grunt-tasks')(grunt);
	grunt.loadNpmTasks('grunt-env');
	grunt.loadNpmTasks('grunt-license');
	grunt.loadNpmTasks('grunt-contrib-watch');

	// Project configuration.
	grunt.initConfig({
		env: {
			options: { },
			test: {
				NODE_ENV: 'test'
			}
		},
		
		coffee: {
			all: {
				files: {
					'lib/m2x.js': 'lib/m2x.coffee',
					'test/m2x.js': 'test/m2x.coffee'
				}
			}
		},
		
		jshint: {
			options: {
				jshintrc: '.jshintrc',
				reporter: require('jshint-stylish')
			},
			all: {
				src: ['Gruntfile.js', 'lib/**/*.js', 'bin/**/*.js', 'test/**/*.js']
			}
		},
		mochacli: {
			options: {
				reporter: 'spec',
				files: ['test/*.js'],
				bail: false
			},
			spec: {
				options: {
					reporter: 'spec',
					bail: true
				}
			},
			dot: {
				options: {
					reporter: 'dot'
				}
			},
			json: {
				options: {
					reporter: 'json'
				}
			},
			jsonstream: {
				options: {
					reporter: 'json-stream'
				}
			},
			jsoncov: {
				options: {
					reporter: 'json-cov'
				}
			},
			htmlcov: {
				options: {
					reporter: 'html-cov'
				}
			},
			doc: {
				options: {
					reporter: 'doc'
				}
			}
		},
		watch: {
			gruntfile: {
				files: '<%= jshint.gruntfile.src %>',
				tasks: ['jshint:gruntfile']
			},
			bin: {
				files: '<%= jshint.bin.src %>',
				tasks: ['jshint:bin']
			},
			lib: {
				files: '<%= jshint.lib.src %>',
				tasks: ['jshint:lib', 'mochacli']
			},
			test: {
				files: '<%= jshint.test.src %>',
				tasks: ['jshint:test', 'mochacli']
			}
		},
		license: {
			all: {
				include: 'dependencies',  // TODO: grunt-license and/or license-checker support for this is broken
				output: 'licenses.json'
			}
		},
		'verify-licenses': {
			whitelist: ['MIT', 'Apache.*', 'BSD.*']
		}
	});

	// Register tasks

	grunt.registerTask('verify-licenses', 'Check licenses for all dependencies', function() {
		grunt.task.requires('license');

		var key,
		status = true,
		licenses = grunt.file.readJSON(grunt.config.get('license.all.output')),
		check = function(pkg, license) {
			var list = grunt.config.get('verify-licenses.whitelist') || 'MIT',
			re = new RegExp(list.join('|'));
			if (license && license.licenses && license.licenses.match(re)) {
				// the license exists and is acceptable
			} else {
				var msg = 'Please check into the license details for: ' + pkg + '\n' +
					'\tIf the license is acceptable, add it to the whitelist in the Gruntfile\n' +
					'\tLicense information detected:\n' +
					'\t\t' + license.licenses + ' (' + license.repository + ')';
				grunt.log.error(msg);
				status = false;
			}
		};

		for (key in licenses) {
			if (licenses.hasOwnProperty(key)) {
				check(key, licenses[key]);
			}
		}

		return status;
	});

	grunt.registerTask('check-licenses', ['license', 'verify-licenses']);
	grunt.registerTask('default', ['jshint', 'mochacli:spec', 'license']);
	grunt.registerTask('test', ['env:test', 'coffee', 'mochacli:spec']);
};
