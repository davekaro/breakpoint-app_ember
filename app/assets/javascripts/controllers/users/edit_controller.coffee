BreakpointApp.UsersEditController = Ember.ObjectController.extend
  actions:
    destroy: ->
      @content.deleteRecord()
      @store.commit()
      @transitionToRoute("users")

    save: ->
      @content.save().then =>
        @transitionToRoute("users")

    cancel: ->
      if @content.get("isDirty")
        @content.rollback()
      @transitionToRoute("users")

  buttonTitle: "Save"
  headerTitle: "Editing"

