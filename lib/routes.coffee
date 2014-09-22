Router.configure
  layoutTemplate: "layout"
  loadingTemplate: "loading"
  # waitOn: ->
  #   Meteor.subscribe "listItems"

Router.map ->
  @route "listItems",
    path: "/"

  @route "login",
    path: "/login"

  return


goToDashboard = (pause) ->
  if Meteor.user()
    Router.go "listItems"
    pause()
  return

Router.onBeforeAction "loading"

Router.onBeforeAction (->
  @redirect "/login"  if not Meteor.user() and @ready()
),
  except: ["login"]

Router.onBeforeAction goToDashboard,
  only: ["login"]