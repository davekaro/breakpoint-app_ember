BreakpointApp.UsersNewController = Ember.ObjectController.extend
  actions:
    save: ->
      @content.save().then =>
        @transitionToRoute("users")

    cancel: ->
      @content.deleteRecord()
      @transitionToRoute "users"

  buttonTitle: "Create"
  headerTitle: "Creating"

