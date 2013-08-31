BreakpointApp.AuthenticatedRESTAdapter = DS.RESTAdapter.extend
  ajax: (url, type, hash) ->
    hash         = hash || {}
    hash.headers = hash.headers || {}
    hash.headers['HTTP_AUTHORIZATION'] = BreakpointApp.Session.get("accessToken")
    @_super(url, type, hash)

BreakpointApp.Store = DS.Store.extend
  adapter: BreakpointApp.AuthenticatedRESTAdapter.create()

