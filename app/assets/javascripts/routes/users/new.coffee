BreakpointApp.UsersNewRoute = BreakpointApp.AuthenticatedRoute.extend
  model: ->
    @store.createRecord("user")

  actions:
    save: ->
      @controller.get("content").save().then =>
        @transitionTo("users")

    cancel: ->
      @controller.get("content").deleteRecord()
      @transitionTo("users")

