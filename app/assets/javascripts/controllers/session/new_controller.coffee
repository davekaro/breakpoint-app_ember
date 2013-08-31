BreakpointApp.SessionNewController = Ember.Controller.extend
  actions:
    signIn: ->
      self = this
      data = @getProperties('email', 'password')
      if !Ember.isEmpty(data.email) && !Ember.isEmpty(data.password)
        Ember.$.post('/session', data).done (response) ->
          apiKey = response.api_key || {}
          BreakpointApp.Session.setProperties
            accessToken: apiKey.access_token
            authUserId:  apiKey.user_id

          attemptedTransition = BreakpointApp.Session.get('attemptedTransition')
          if attemptedTransition
            BreakpointApp.Session.set('attemptedTransition', null)
            attemptedTransition.retry()
          else
            self.transitionToRoute('users')

