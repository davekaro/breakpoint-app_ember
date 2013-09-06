BreakpointApp.UsersEditRoute = BreakpointApp.AuthenticatedRoute.extend
  actions:
    destroy: ->
      @controller.get("content").deleteRecord()
      @store.commit()
      @transitionTo("users")

    save: ->
      @controller.get("content").save().then =>
        @transitionTo("users")

    cancel: ->
      if @controller.get("content").get("isDirty")
        @controller.get("content").rollback()
      @transitionTo("users")

