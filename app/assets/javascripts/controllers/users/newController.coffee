BreakpointApp.UsersNewController = Ember.ObjectController.extend
  save: ->
    @content.save().then =>
      @transitionToRoute('users.show', @content)

  cancel: ->
    @content.deleteRecord()
    @transitionToRoute 'users.index'

  buttonTitle: 'Create'
  headerTitle: 'Creating'

