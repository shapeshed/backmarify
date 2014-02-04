var $ = require('jquery')(window);
var Backbone = require('backbone');
var Wreqr = require('./node_modules/backbone.marionette/node_modules/backbone.wreqr');
var Marionette = require('backbone.marionette');
Marionette.$ = Backbone.$ = $;
Backbone.Wreqr = Wreqr;

var MyApp = new Marionette.Application();
MyApp.addInitializer(function(options){
  console.log('initialised app');
});
MyApp.start();
