App.AuthenticatedRoute = Ember.Route.extend
  beforeModel: (transition) ->
    applicationController = @controllerFor("application")
    if !Ember.isEmpty(@router.get("url"))
      if !applicationController.get("isAuthenticated")
        Ember.RSVP.reject(status: 401)

  actions:
    error: (error, transition) ->
      if error.status == 401
        @controllerFor("application").set("savedTransition", transition)
        @transitionTo("sign_in")
      else
        true

