BreakpointApp.SessionDestroyRoute = BreakpointApp.AuthenticatedRoute.extend
  beforeModel: ->
    self = this
    $.ajax(
      url:  "/session"
      headers: 'Authorization': 'Token token="' + BreakpointApp.Session.get("accessToken") + '"'
      type: "DELETE"
    ).always (response) ->
      BreakpointApp.Session.reset()
      window.location.replace("/")

