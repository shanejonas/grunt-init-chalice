handleify = require 'handleify'
coffeeify = require 'coffeeify'
uglify = require 'uglify-js2'
shim = require 'browserify-shim'

module.exports = (grunt)->

  beforeHook = (bundle)->
    bundle.transform coffeeify
    bundle.transform handleify
    shim bundle,
      $: path: './vendor/zepto', exports: 'Zepto'

  @initConfig
    regarde:
      styles:
        files: ['stylesheets/**/*']
        tasks: ['clean:styles', 'stylus:dev', 'livereload']
      app:
        files: ['src/**/*']
        tasks: ['clean:build', 'browserify2:dev', 'express:app', 'livereload']
    express:
      app: './server.coffee'
    clean:
      build: ['public/application.js']
      styles: ['public/style.css']
    browserify2:
      dev:
        expose:
          backbone: './node_modules/backbone/backbone.js'
        entry: './src/app/application.coffee'
        compile: './public/application.js'
        debug: yes
        beforeHook: beforeHook
      build:
        expose:
          backbone: './node_modules/backbone/backbone.js'
        entry: './src/app/application.coffee'
        compile: './public/application.js'
        beforeHook: beforeHook
        afterHook: (src)->
          result = uglify.minify src, fromString: true
          result.code
    stylus:
      dev:
        options:
          debug: yes
          use: ['nib']
          import: ['nib']
        files:
          'public/style.css': 'stylesheets/**/*.styl'
      build:
        options:
          debug: no
          use: ['nib']
          import: ['nib']
        files:
          'public/style.css': 'stylesheets/**/*.styl'
    watch:
      scripts:
        files: ['**/*.coffee'],
        tasks: ['default']

  @loadNpmTasks 'grunt-contrib-clean'
  @loadNpmTasks 'grunt-contrib-stylus'
  @loadNpmTasks 'grunt-contrib-livereload'
  @loadNpmTasks 'grunt-browserify2'
  @loadNpmTasks 'grunt-regarde'
  @loadNpmTasks 'grunt-devtools'
  @loadTasks 'tasks'

  @registerTask 'default', ['clean', 'stylus:dev', 'browserify2:dev', 'express:app', 'livereload-start', 'regarde']
  @registerTask 'build', ['clean', 'stylus:build', 'browserify2:build']
  @registerTask 'serve', ['express:app', 'express-keepalive']
  @registerTask 'dev', ['browserify2:dev', 'stylus:dev']
