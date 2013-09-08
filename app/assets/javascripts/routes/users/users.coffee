App.UsersRoute = Ember.Route.extend
  model: ->
    @get("store").findAll("user")

