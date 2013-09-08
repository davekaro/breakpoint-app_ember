App.SessionDestroyRoute = App.AuthenticatedRoute.extend
  beforeModel: ->
    self = this
    $.ajax(
      url:  "/session"
      headers: 'Authorization': 'Token token="' + App.Session.get("accessToken") + '"'
      type: "DELETE"
    ).always (response) ->
      App.Session.reset()
      window.location.replace("/")

