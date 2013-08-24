BreakpointApp.UsersEditController = Ember.ObjectController.extend
  destroy: ->
    @content.deleteRecord()
    @store.commit()
    @transitionToRoute('users.index')

  save: ->
    @content.save().then =>
      @transitionToRoute('users.show', @content)

  cancel: ->
    if @content.get('isDirty')
      @content.rollback()
    @transitionToRoute('users.show', @content)

  buttonTitle: 'Edit'
  headerTitle: 'Editing'

