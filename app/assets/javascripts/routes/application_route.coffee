App.ApplicationRoute = Ember.Route.extend
  actions:
    error: (error, transition) ->
      alert(error.message)

