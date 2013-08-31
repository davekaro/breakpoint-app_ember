BreakpointApp.SessionDestroyRoute = BreakpointApp.AuthenticatedRoute.extend
  renderTemplate: (controller, model) ->
    controller.actions.signOut()

