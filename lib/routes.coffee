
Router.configure
  layoutTemplate: "layout"
  loadingTemplate: "loading"
  # waitOn: ->
  #   Meteor.subscribe "listItems"

Router.map ->
  @route "showLists",
    path: "/"

  @route "login",
    path: "/login"

  @route "listItems",
    path: "/items"
  return

mustBeSignedIn = (pause) ->
  if !Meteor.user() && @ready
    Router.go "login"
    pause()
  return

goToDashboard = (pause) ->
  if Meteor.user() && @ready
    Router.go "showLists"
    pause()
  return

Router.onBeforeAction "loading"

Router.onBeforeAction mustBeSignedIn,
  except: ["login"]

Router.onBeforeAction goToDashboard,
  only: ["login"]
