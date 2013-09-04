BreakpointApp.Router.map ()->
  @resource "users", ->
    @route "new"
    @route "edit", path: ":user_id/edit"

  @resource "session", ->
    @route "new"
    @route "destroy"

