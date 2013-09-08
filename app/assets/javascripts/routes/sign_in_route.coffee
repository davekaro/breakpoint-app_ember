App.SignInRoute = Ember.Route.extend
  actions:
    signIn: ->
      self = this
      controller = @controllerFor("signIn")
      data = controller.getProperties("email", "password", "rememberMe")
      if !Ember.isEmpty(data.email) && !Ember.isEmpty(data.password)
        Ember.$.post("/session", data).done((response) ->
          apiKey = response.api_key || {}

          applicationController = self.controllerFor("application")
          savedTransition = applicationController.get("savedTransition")

          expiresAt = new Date(apiKey.expired_at)
          if data.rememberMe
            $.cookie("access_token", apiKey.access_token, path: "/", expires: expiresAt)
            $.cookie("auth_user", apiKey.user_id, path: "/", expires: expiresAt)
          else
            $.cookie("access_token", apiKey.access_token, path: "/")
            $.cookie("auth_user", apiKey.user_id, path: "/")

          applicationController.authenticate()

          if savedTransition
            savedTransition.retry()
          else
            self.transitionTo("users")

        ).fail (response) ->
          controller.set("invalidCredentials", true)
      else
        controller.set("invalidCredentials", true)

