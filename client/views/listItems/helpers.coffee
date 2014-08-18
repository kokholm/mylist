Template.listItems.helpers 
	listItem : ->
 		Items.find()


Template.item.helpers 
 	itemClass : ->
 		if Items.findOne(@_id).beingUpdated
 			return 'warning'
 		else
 			if Items.findOne(@_id).done
 				return 'active'
 			else
 				return ''

 	doneClass : ->
 		if Items.findOne(@_id).done
 			return 'btn-success'
 		else
 			return 'btn-default'



 	beingUpdatedIcon : ->
 		if Items.findOne(@_id).beingUpdated
 			return 'ion-refreshing'

 		else
 			return 'ion-trash-b'

Template.listItems.events
	'click [name=done]' : (e) ->
		Meteor.call 'toggleDone', @_id

	'change input[name=titleNew]' : (e) ->
		Meteor.call 'titleNew', e.currentTarget.value
		$(e.currentTarget).val('')

	'click td[name=title]' : (e) ->
		txt = $(e.currentTarget).children('#titleText').text()
		if !Items.findOne(@_id).beingUpdated
			$(e.currentTarget).children('#titleText').addClass('hidden')
			$(e.currentTarget).children('#titleInput').val(txt).removeClass('hidden').focus()
			Meteor.call 'titleEnterUpdate', @_id

	'keyup input[name=title]' : (e) ->		
		Meteor.call 'titleUpdate', @_id, e.currentTarget.value
		if e.which == 13
			$(e.currentTarget).focusout()

	'focusout td[name=title]' : (e) ->		
		$(e.currentTarget).children('#titleText').removeClass('hidden')
		$(e.currentTarget).children('#titleInput').addClass('hidden')
		Meteor.call 'titleExitUpdate', @_id

	'click [name=bin]' : (e) ->
		titleId = $(e.currentTarget).parents('tr').attr('titleId')
		Items.remove(titleId);
		console.log 'Delete: ', titleId

	# 'change input[name=title]' : (e) ->
	# 	Meteor.call 'titleUpdate', @_id, e.currentTarget.value
	# 	$(e.currentTarget).val('')

	# 'change input[name=title]' : (e) ->
