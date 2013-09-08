App.UsersNewRoute = Ember.Route.extend
  model: ->
    @get("store").createRecord("user")

  actions:
    save: ->
      @modelFor("users.new").save().then =>
        @transitionTo("users")

    cancel: ->
      @modelFor("users.new").deleteRecord()
      @transitionTo("users")

