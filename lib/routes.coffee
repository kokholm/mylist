Router.configure
  layoutTemplate: "layout"
  loadingTemplate: "loading"
  # waitOn: ->
  #   Meteor.subscribe "listItems"

Router.map ->
  @route "listItems",
    path: "/"

  return

Router.onBeforeAction "loading"
