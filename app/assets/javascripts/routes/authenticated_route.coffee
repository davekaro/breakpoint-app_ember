BreakpointApp.AuthenticatedRoute = Ember.Route.extend
  beforeModel: (transition) ->
    if !BreakpointApp.Session.get("isAuthenticated")
      BreakpointApp.Session.set("attemptedTransition", transition)
      @transitionTo("session.new")

