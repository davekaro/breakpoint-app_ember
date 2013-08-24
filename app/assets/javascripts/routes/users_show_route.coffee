BreakpointApp.UsersShowRoute = Ember.Route.extend
  model: (params) ->
    BreakpointApp.User.find(params.user_id)
  setupController: (controller, model) ->
    controller.set('content', model)
    @controllerFor('application').set('currentRoute', 'users')

