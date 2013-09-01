Ember.Application.initializer
  name: 'session'

  initialize: (container, application) ->
    BreakpointApp.Session = Ember.Object.extend(
      init: ->
        @_super()
        @set('accessToken', $.cookie('access_token'))
        @set('authUserId', $.cookie('auth_user'))

      accessTokenChanged: (->
        accessToken = @get('accessToken')
        $.cookie('access_token', accessToken, path: '/')
      ).observes('accessToken')

      authUserIdChanged: (->
        authUserId = @get('authUserId')
        $.cookie('auth_user', authUserId, path: '/')
        if !Ember.isEmpty(authUserId)
          @set('user', BreakpointApp.User.find(authUserId))
        else
          @set('user', null)
      ).observes('authUserId')

      isAuthenticated: (->
        !Ember.isEmpty(@get('accessToken'))
      ).property('accessToken')

      reset: ->
        @setProperties accessToken: "", authUserId:  ""
    ).create()

