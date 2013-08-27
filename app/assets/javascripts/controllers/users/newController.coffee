BreakpointApp.UsersNewController = Ember.ObjectController.extend
  save: ->
    @content.save().then =>
      @transitionToRoute('user', @content)

  cancel: ->
    @content.deleteRecord()
    @transitionToRoute 'users.index'

  buttonTitle: 'Create'
  headerTitle: 'Creating'

