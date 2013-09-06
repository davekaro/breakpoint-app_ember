BreakpointApp.UsersNewRoute = BreakpointApp.AuthenticatedRoute.extend
  model: ->
    @store.createRecord("user")

  actions:
    save: ->
      @modelFor("users.new").save().then =>
        @transitionTo("users")

    cancel: ->
      @modelFor("users.new").deleteRecord()
      @transitionTo("users")

