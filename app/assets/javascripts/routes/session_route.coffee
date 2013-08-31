BreakpointApp.SessionDestroyRoute = BreakpointApp.AuthenticatedRoute.extend
  beforeModel: ->
    self = this
    $.ajax(
      url:  "/session"
      type: "DELETE"
    ).always (response) ->
      $.removeCookie("access_token")
      $.removeCookie("auth_user")
      window.location.replace("/")

