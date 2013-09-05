BreakpointApp.UsersRoute = BreakpointApp.AuthenticatedRoute.extend
  model: ->
    @store.findAll("user")

BreakpointApp.UsersNewRoute = BreakpointApp.AuthenticatedRoute.extend
  model: ->
    @store.createRecord("user")

