BreakpointApp.UsersRoute = Ember.Route.extend
  model: ->
    BreakpointApp.User.find()

BreakpointApp.UsersNewRoute = BreakpointApp.AuthenticatedRoute.extend
  model: ->
    BreakpointApp.User.createRecord()

