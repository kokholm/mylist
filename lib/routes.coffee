
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
    path: "/list/:_id"
    # waitOn : ->
    # 	Meteor.subscribe 'items', @params._id
    data : ->
    	listItem : Items.find listId: @params._id


mustBeSignedIn = (pause) ->
  if not Meteor.user()
    @render "login"
    pause()

Router.onBeforeAction "loading"

Router.onBeforeAction mustBeSignedIn