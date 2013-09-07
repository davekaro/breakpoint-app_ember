BreakpointApp.AuthenticatedRESTAdapter = DS.RESTAdapter.extend
  ajax: (url, type, hash) ->
    hash         = hash || {}
    hash.headers = hash.headers || {}
    hash.headers["Authorization"] = "Token token=#{BreakpointApp.Session.get("accessToken")}"
    @_super(url, type, hash)

BreakpointApp.ApplicationAdapter = BreakpointApp.AuthenticatedRESTAdapter.extend()

