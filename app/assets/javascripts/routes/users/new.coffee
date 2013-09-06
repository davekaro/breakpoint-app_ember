BreakpointApp.UsersNewRoute = BreakpointApp.AuthenticatedRoute.extend
  model: ->
    @store.createRecord("user")

  actions:
    save: ->
      @currentModel.save().then =>
        @transitionTo("users")

    cancel: ->
      @currentModel.deleteRecord()
      @transitionTo("users")

