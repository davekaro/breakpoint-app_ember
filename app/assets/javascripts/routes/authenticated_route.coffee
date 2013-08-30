BreakpointApp.AuthenticatedRoute = Ember.Route.extend
  redirectToLogin: (transition) ->
    BreakpointApp.Session.set("attemptedTransition", transition)
    @transitionTo("sessions.new")

  beforeModel: (transition) ->
    @redirectToLogin(transition) if !BreakpointApp.Session.get("isAuthenticated")

