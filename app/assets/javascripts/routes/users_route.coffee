BreakpointApp.UsersRoute = Ember.Route.extend
  model: ->
    BreakpointApp.User.find()

BreakpointApp.UsersNewRoute = Ember.Route.extend
  model: ->
    BreakpointApp.User.createRecord()

