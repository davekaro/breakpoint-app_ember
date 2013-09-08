App.ApplicationController = Ember.Controller.extend
  accessToken: $.cookie("access_token")

  authUserId: (->
    $.cookie("auth_user")
  ).property("accessToken")

  isAuthenticated: (->
    !Ember.isEmpty(@get("accessToken"))
  ).property("accessToken")

  currentUser: (->
    userId = @get("authUserId")
    if !Ember.isEmpty(userId)
      @get("store").find("user", userId)
    else
      null
  ).property("authUserId")

  savedTransition: null

  authenticate: ->
    @setProperties
      accessToken: $.cookie("access_token")
      savedTransition: null

  unauthenticate: -> @set("accessToken", null)

