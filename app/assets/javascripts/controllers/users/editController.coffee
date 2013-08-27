BreakpointApp.UsersEditController = Ember.ObjectController.extend
  destroy: ->
    @content.deleteRecord()
    @store.commit()
    @transitionToRoute('users.index')

  save: ->
    @content.save().then =>
      @transitionToRoute('user', @content)

  cancel: ->
    if @content.get('isDirty')
      @content.rollback()
    @transitionToRoute('user', @content)

  buttonTitle: 'Edit'
  headerTitle: 'Editing'

