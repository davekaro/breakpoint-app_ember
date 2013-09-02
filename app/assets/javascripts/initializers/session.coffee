Ember.Application.initializer
  name: "session"

  initialize: (container, application) ->
    BreakpointApp.Session = Ember.Object.extend(
      init: ->
        @_super()
        @set("accessToken", $.cookie("access_token"))
        @set("authUserId", $.cookie("auth_user"))

      #store:
      #  container.lookup("store:main")

      accessTokenChanged: (->
        accessToken = @get("accessToken")
        @setCookie("access_token", accessToken)
      ).observes("accessToken")

      authUserIdChanged: (->
        authUserId = @get("authUserId")
        @setCookie("auth_user", authUserId)
       # if !Ember.isEmpty(authUserId)
       #   @set("user", @store.find("user", authUserId))
       # else
       #   @set("user", null)
      ).observes("authUserId")

      isAuthenticated: (->
        !Ember.isEmpty(@get("accessToken"))
      ).property("accessToken")

      reset: ->
        @setProperties
          accessToken: ""
          authUserId:  ""
          rememberMe:  false
          expiresAt:   -1
        $.removeCookie("access_token", path: "/")
        $.removeCookie("auth_user", path: "/")

      setCookie: (name, value) ->
        if @get("rememberMe")
          $.cookie(name, value, path: "/", expires: @get("expiresAt"))
        else
          $.cookie(name, value, path: "/")
    ).create()

