BreakpointApp.SessionDestroyRoute = BreakpointApp.AuthenticatedRoute.extend
  redirect: ->
    self = this
    $.ajax(
      url:  "/session"
      type: "DELETE"
    ).always (response) ->
      BreakpointApp.Session.setProperties
        accessToken: ""
        authUserId:  ""
      self.transitionTo("session.new")

