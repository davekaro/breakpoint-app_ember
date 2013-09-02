BreakpointApp.UsersRoute = BreakpointApp.AuthenticatedRoute.extend
  model: ->
    this.store.find("user")

BreakpointApp.UsersNewRoute = BreakpointApp.AuthenticatedRoute.extend
  model: ->
    this.store.createRecord("user")

