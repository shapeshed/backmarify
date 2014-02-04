module.exports = function(config) {
  config.set({
    basePath: '',
    frameworks: ['mocha', 'browserify'],
    files: [
      'test/**/*.js'
    ],
    exclude: [
      '**/*.swp'
    ],
    reporters: ['progress'],
    port: 9876,
    colors: true,
    logLevel: config.LOG_DEBUG,
    autoWatch: true,
    browsers: ['PhantomJS'],
    captureTimeout: 60000,
    browserify: {
      watch: true,
    },
    preprocessors: {'test/*': ['browserify']},
    singleRun: true
  });
};
