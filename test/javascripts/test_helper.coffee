#= require application
#= require_tree .
#= require_self

document.write('<div id="ember-testing-container"><div id="ember-testing"></div></div>')
document.write('<style>#ember-testing-container { position: absolute; background: white; bottom: 0; right: 0; width: 640px; height: 384px; overflow: auto; z-index: 9999; border: 1px solid #ccc; } #ember-testing { zoom: 50%; }</style>')

testing = ->
  helper =
    container: ->
      App.__container__
    controller: (name) ->
      helper.container().lookup('controller:' + name)
    path: ->
      helper.controller('application').get('currentPath')
  helper

Ember.Test.registerHelper 'path', ->
  testing().path();

Ember.Test.registerHelper 'getApplicationController', ->
  testing().controller('application');

App.rootElement = '#ember-testing'
App.setupForTesting()
App.injectTestHelpers()

QUnit.testStart ->
  App.reset()

exists = (selector) ->
  !!find(selector).length

