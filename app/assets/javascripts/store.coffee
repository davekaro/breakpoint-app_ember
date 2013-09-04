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

BreakpointApp.ApplicationSerializer = DS.RESTSerializer.extend
  normalize: (type, property, hash) ->
    normalized = {}

    for prop, value of hash
      if prop.substr(-3) == "_id"
        # belongsTo relationships
        normalizedProp = prop.slice(0, -3)
      else if prop.substr(-4) == "_ids"
        # hasMany relationship
        normalizedProp = Ember.String.pluralize(prop.slice(0, -4))
      else
        # regualarAttribute
        normalizedProp = prop

      normalizedProp = Ember.String.camelize(normalizedProp)
      normalized[normalizedProp] = value

    @_super(type, property, normalized)

  serialize: (record, options) ->
    json = {}

    record.eachAttribute (name) ->
      json[name.underscore()] = record.get(name)

    json

