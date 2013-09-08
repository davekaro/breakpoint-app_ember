App.UsersRoute = App.AuthenticatedRoute.extend
  model: ->
    @store.findAll("user")

