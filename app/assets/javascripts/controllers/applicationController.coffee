BreakpointApp.ApplicationController = Ember.Controller.extend
  isUsers: (->
    @get('currentRoute') == 'users'
  ).property('currentRoute')

