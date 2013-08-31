BreakpointApp.SessionDestroyRoute = BreakpointApp.AuthenticatedRoute.extend
  beforeModel: ->
    self = this
    $.ajax(
      url:  "/session"
      headers: 'Authorization': 'Token token="' + BreakpointApp.Session.get("accessToken") + '"'
      type: "DELETE"
    ).always (response) ->
      $.removeCookie("access_token")
      $.removeCookie("auth_user")
      window.location.replace("/")

