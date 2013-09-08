App.ApplicationRoute = Ember.Route.extend
  actions:
    error: (error, transition) ->
      console.log(error.message)

    signOut: ->
      applicationController = @controllerFor("application")
      $.ajax(
        url:  "/session"
        headers: 'Authorization': 'Token token="' + applicationController.get("accessToken") + '"'
        type: "DELETE"
      ).always (response) ->
        applicationController.unauthenticate()
        $.removeCookie("access_token", path: "/")
        $.removeCookie("auth_user", path: "/")
        window.location.replace("/")

