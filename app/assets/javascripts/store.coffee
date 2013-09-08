App.AuthenticatedRESTAdapter = DS.RESTAdapter.extend
  ajax: (url, type, hash) ->
    hash         = hash || {}
    hash.headers = hash.headers || {}
    hash.headers["Authorization"] = "Token token=#{$.cookie("access_token")}"
    @_super(url, type, hash)

App.ApplicationAdapter = App.AuthenticatedRESTAdapter.extend()

