BreakpointApp.AuthenticatedRESTAdapter = DS.RESTAdapter.extend
  ajax: (url, type, hash) ->
    hash         = hash || {}
    hash.headers = hash.headers || {}
    hash.headers["Authorization"] = "Token token=#{BreakpointApp.Session.get("accessToken")}"
    @_super(url, type, hash)

BreakpointApp.ApplicationAdapter = BreakpointApp.AuthenticatedRESTAdapter.extend()

DS.rejectionHandler = (reason) ->
  if reason.status == 401
    BreakpointApp.Session.reset()
    # TODO @transitionTo("session.new")
  throw reason

BreakpointApp.CamelizeSerializer = DS.RESTSerializer.extend
  normalize: (type, property, hash) ->
    json = {}

    # normalize the underscored properties
    for prop, value of hash
      json[prop.camelize()] = value

    @_super(type, property, json)

  serialize: (record, options) ->
    json = {}

    record.eachAttribute (name) ->
      json[name.underscore()] = record.get(name)

    json

