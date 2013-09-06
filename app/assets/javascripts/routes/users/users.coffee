BreakpointApp.UsersRoute = BreakpointApp.AuthenticatedRoute.extend
  model: ->
    @store.findAll("user")

