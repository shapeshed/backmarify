var $ = require('jquery');
var Backbone = require('backbone');
Backbone.$  = $;
var Marionette = require('backbone.marionette');

var MyApp = new Marionette.Application();
MyApp.addInitializer(function(options){
  console.log('initialised app');
});
MyApp.start();
