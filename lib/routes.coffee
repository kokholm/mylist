Router.configure
  layoutTemplate: "layout"
  loadingTemplate: "loading"
  # waitOn: ->
  #   Meteor.subscribe "listItems"

Router.map ->
  @route "listItems",
    path: "/"

  @route "listItems",
    path: "/add"

  return

Router.onBeforeAction "loading"
