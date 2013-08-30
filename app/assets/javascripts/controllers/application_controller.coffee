BreakpointApp.ApplicationController = Ember.Controller.extend
  currentUser: (->
    BreakpointApp.Session.get("user")
  ).property("BreakpointApp.Session.user")

  isAuthenticated: (->
    BreakpointApp.Session.get("isAuthenticated")
  ).property("BreakpointApp.Session.isAuthenticated")

