App.Router.map ()->
  @resource("authenticated", path: "/", ->
    @resource "users", ->
      @route "new"
      @route "edit", path: ":user_id/edit"
  )

  @resource "sign_in"

