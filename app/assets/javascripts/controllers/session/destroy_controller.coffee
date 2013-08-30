BreakpointApp.SessionDestroyController = Ember.Controller.extend
  actions:
    signOut: ->
      self = this
      $.ajax(
        url:  "/session"
        type: "DELETE"
      ).always (response) ->
        BreakpointApp.Session.setProperties
          accessToken: null
          authUserId:  null
        self.transitionToRoute("session.new")

