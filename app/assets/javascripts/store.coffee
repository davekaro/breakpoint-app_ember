App.AuthenticatedRESTAdapter = DS.RESTAdapter.extend
  ajax: (url, type, hash) ->
    hash         = hash || {}
    hash.headers = hash.headers || {}
    hash.headers["Authorization"] = "Token token=#{App.Session.get("accessToken")}"
    @_super(url, type, hash)

App.ApplicationAdapter = App.AuthenticatedRESTAdapter.extend()

