BreakpointApp.UsersRoute = BreakpointApp.AuthenticatedRoute.extend
  model: ->
    @store.find("user")

BreakpointApp.UsersNewRoute = BreakpointApp.AuthenticatedRoute.extend
  model: ->
    @store.createRecord("user")

