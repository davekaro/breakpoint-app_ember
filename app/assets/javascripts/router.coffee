BreakpointApp.Router.map ()->
  @resource "users", ->
    @resource "user", path: ":user_id"
    @route "new"
    @route "edit", path: ":user_id/edit"

  @resource "session", ->
    @route "new"
    @route "destroy"

