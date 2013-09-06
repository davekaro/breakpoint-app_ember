BreakpointApp.UsersEditRoute = BreakpointApp.AuthenticatedRoute.extend
  actions:
    deleteUser: ->
      if confirm("Are you sure you want to delete the selected author? Click OK to continue.")
        @modelFor("users.edit").deleteRecord()
        @modelFor("users.edit").save().then(=>
            @transitionTo("users")
          (error) ->
            @modelFor("users.edit").rollback()
            alert("An error occured - Please try again")
        )

    save: ->
      @modelFor("users.edit").save().then =>
        @transitionTo("users")

    cancel: ->
      if @modelFor("users.edit").get("isDirty")
        @modelFor("users.edit").rollback()
      @transitionTo("users")

