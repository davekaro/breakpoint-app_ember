BreakpointApp.UsersEditRoute = BreakpointApp.AuthenticatedRoute.extend
  actions:
    deleteUser: ->
      if confirm("Are you sure you want to delete the selected author? Click OK to continue.")
        @currentModel.deleteRecord()
        @currentModel.save().then(=>
            @transitionTo("users")
          (error) ->
            @currentModel.rollback()
            alert("An error occured - Please try again")
        )

    save: ->
      @currentModel.save().then =>
        @transitionTo("users")

    cancel: ->
      if @currentModel.get("isDirty")
        @currentModel.rollback()
      @transitionTo("users")

