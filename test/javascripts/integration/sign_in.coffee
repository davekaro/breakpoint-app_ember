module("sign in",
  setup: ->
    Ember.run ->
      getApplicationController().unauthenticate()
    $.removeCookie("auth_user")
    $.removeCookie("access_token")
)

test("visit homepage", ->
  expect(1)

  visit("/").then ->
    equal(find("h1").text(), "Welcome")
)

test("complete sign in", ->
  expect(1)

  visit("sign_in").then ->
    fillIn("input[name=email]", "dave@example.com")
    fillIn("input[name=password]", "password")
    click("button[type=submit]").then ->
      equal(find("h1").text(), "Users")
)