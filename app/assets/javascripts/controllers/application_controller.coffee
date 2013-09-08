App.ApplicationController = Ember.Controller.extend
  currentUser: (->
    App.Session.get("user")
  ).property("App.Session.user")

  isAuthenticated: (->
    App.Session.get("isAuthenticated")
  ).property("App.Session.isAuthenticated")

