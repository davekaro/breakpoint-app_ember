BreakpointApp.Router.map ()->
  @resource 'users', ->
    @route 'show',
      path: '/:user_id'

