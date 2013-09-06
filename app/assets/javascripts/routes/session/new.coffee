BreakpointApp.SessionNewRoute = Ember.Route.extend
  actions:
    signIn: ->
      self = this
      controller = @controller
      data = controller.getProperties("email", "password", "rememberMe")
      if !Ember.isEmpty(data.email) && !Ember.isEmpty(data.password)
        Ember.$.post("/session", data).done((response) ->
          apiKey = response.api_key || {}
          BreakpointApp.Session.setProperties
            accessToken: apiKey.access_token
            authUserId:  apiKey.user_id
            rememberMe:  data.rememberMe
            expiresAt:   new Date(apiKey.expired_at)

          attemptedTransition = BreakpointApp.Session.get("attemptedTransition")
          if attemptedTransition
            BreakpointApp.Session.set("attemptedTransition", null)
            attemptedTransition.retry()
          else
            self.transitionTo("users")
        ).fail (response) ->
          controller.set("invalidCredentials", true)
      else
        controller.set("invalidCredentials", true)

