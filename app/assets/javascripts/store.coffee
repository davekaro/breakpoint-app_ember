BreakpointApp.AuthenticatedRESTAdapter = DS.RESTAdapter.extend
  ajax: (url, type, hash) ->
    hash         = hash || {}
    hash.headers = hash.headers || {}
    hash.headers['Authorization'] = 'Token token="' + BreakpointApp.Session.get("accessToken") + '"'
    @_super(url, type, hash)

BreakpointApp.Store = DS.Store.extend
  adapter: BreakpointApp.AuthenticatedRESTAdapter.create()

DS.rejectionHandler = (reason) ->
  BreakpointApp.Session.reset() if reason.status == 401
  throw reason

