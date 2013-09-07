BreakpointApp.AuthenticatedRoute = Ember.Route.extend
  beforeModel: (transition) ->
    if !BreakpointApp.Session.get("isAuthenticated")
      Ember.RSVP.reject(status: 401)

  actions:
    error: (error, transition) ->
      if error.status == 401
        BreakpointApp.Session.set("attemptedTransition", transition)
        @transitionTo("session.new")

