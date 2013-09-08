App.AuthenticatedRoute = Ember.Route.extend
  beforeModel: (transition) ->
    if !App.Session.get("isAuthenticated")
      Ember.RSVP.reject(status: 401)

  actions:
    error: (error, transition) ->
      if error.status == 401
        App.Session.set("attemptedTransition", transition)
        @transitionTo("session.new")

