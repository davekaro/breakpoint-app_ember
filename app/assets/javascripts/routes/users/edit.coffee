BreakpointApp.UsersEditRoute = BreakpointApp.AuthenticatedRoute.extend
  actions:
    deleteUser: ->
      if confirm("Are you sure you want to delete the selected author? Click OK to continue.")
        user = @controller.get("content")

        user.deleteRecord()
        user.save().then(=>
            @transitionTo("users")
          (error) ->
            user.rollback()
            alert("An error occured - Please try again")
        )

    save: ->
      @controller.get("content").save().then =>
        @transitionTo("users")

    cancel: ->
      if @controller.get("content").get("isDirty")
        @controller.get("content").rollback()
      @transitionTo("users")

