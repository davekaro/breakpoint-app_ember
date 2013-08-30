BreakpointApp.SessionsDestroyRoute = BreakpointApp.AuthenticatedRoute.extend
  renderTemplate: (controller, model) ->
    controller.actions.logout()

