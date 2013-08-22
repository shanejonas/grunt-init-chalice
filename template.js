/*
 * grunt-init-node
 * https://gruntjs.com/
 *
 * Copyright (c) 2012 "Cowboy" Ben Alman, contributors
 * Licensed under the MIT license.
 */

'use strict';

// Basic template description.
exports.description = 'Create a Chalice application with node.js and npm';

// Template-specific notes to be displayed before question prompts.
exports.notes = '_Project name_ shouldn\'t contain "node" or "js" and should ' +
  'be a unique ID not already in use at search.npmjs.org.';

// Template-specific notes to be displayed after question prompts.
exports.after = 'You should now install project dependencies with _npm ' +
  'install_. After that, you may execute project tasks with _grunt_. For ' +
  'more information about installing and configuring Grunt, please see ' +
  'the Getting Started guide:' +
  '\n\n' +
  'http://gruntjs.com/getting-started';

// Any existing file or directory matching this wildcard will cause a warning.
exports.warnOn = '*';

// The actual init template.
exports.template = function(grunt, init, done) {

  init.process({type: 'node'}, [
    // Prompt for these values.
    init.prompt('name'),
    init.prompt('description'),
    init.prompt('version'),
    init.prompt('repository'),
    init.prompt('homepage'),
    init.prompt('bugs'),
    init.prompt('licenses'),
    init.prompt('author_name'),
    init.prompt('author_email'),
    init.prompt('author_url'),
    init.prompt('node_version', '>= 0.8.0'),
    init.prompt('main')
  ], function(err, props) {
    props.keywords = [];
    props.dependencies = {
      "backbone": "~1.0.0",
      "underscore": "~1.5.1",
      "express": "~3.1.0",
      "connect": "~2.7.3",
      "handlebars": "1.0.12",
      "chalice": "0.0.0"
    };
    props.devDependencies = {
      "grunt": "~0.4.0",
      "grunt-devtools": "~0.1.0-7",
      "grunt-browserify2": "~0.1.6",
      "grunt-contrib-coffee": "~0.6.0",
      "grunt-contrib-clean": "~0.4.0",
      "grunt-contrib-stylus": "~0.5.0",
      "handleify": "git://github.com/shanejonas/node-handleify.git#master",
      "coffeeify": "0.3.0",
      "should": "~1.2.2",
      "mocha": "~1.8.2",
      "uglify-js2": "~2.1.11",
      "grunt-contrib-livereload": "~0.1.2",
      "grunt-regarde": "~0.1.1",
      "browserify-shim": "~2.0.3"
    };

    // Files to copy (and process).
    var files = init.filesToCopy(props);

    // Add properly-named license files.
    init.addLicenseFiles(files, props.licenses);

    // Actually copy (and process) files.
    init.copyAndProcess(files, props);

    // Generate package.json file.
    init.writePackageJSON('package.json', props);

    // All done!
    done();
  });

};
