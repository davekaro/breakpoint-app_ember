BreakpointApp.UsersRoute = Ember.Route.extend
  model: ->
    BreakpointApp.User.find()
  setupController: (controller, model) ->
    controller.set('content', model)
    @controllerFor('application').set('currentRoute', 'users')

BreakpointApp.UsersNewRoute = Ember.Route.extend
  model: ->
    BreakpointApp.User.createRecord()
  setupController: (controller, model) ->
    controller.set('content', model)

BreakpointApp.UserRoute = Ember.Route.extend
  setupController: (controller, model) ->
    controller.set('content', model)
    @controllerFor('application').set('currentRoute', 'users')

BreakpointApp.UsersShowRoute = BreakpointApp.UserRoute.extend()
BreakpointApp.UsersEditRoute = BreakpointApp.UserRoute.extend()

