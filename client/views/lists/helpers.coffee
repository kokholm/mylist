Template.showLists.rendered = ->
	Session.set("listTitle", '')
	Session.set("titleId", '')

Template.showLists.helpers 
	lists : ->
		Lists.find()

Template.list.helpers 

Template.showLists.events
	'click #addList' : (e) ->
		title = $('#listNew').val()
		result = Lists.insert
			title : title
			userId : Meteor.userId()
		$('#listNew').val("")

	'click [name="title"]' : (e) ->
		listTitle  = $(e.currentTarget).parent('tr').attr('listTitle')
		href = $(e.currentTarget).attr('href')
		Session.set("listTitle", listTitle)
		# Session.set("titleId", listId)
		# console.log listTitle
		# Router.go "listItems"
		location.href = href

	'click [name="deleteList"]' : (e) ->
		listTitle  = $(e.currentTarget).parent('tr').attr('listTitle')
		listId = $(e.currentTarget).parent('tr').attr('titleId')
		if confirm('Remove "'+listTitle+'" ?')
			console.log listId
			Lists.remove(listId)




