BreakpointApp.UsersRoute = Ember.Route.extend
  model: ->
    BreakpointApp.User.find()
  setupController: (controller, model) ->
    controller.set('users', model)
    @controllerFor('application').set('currentRoute', 'users')

