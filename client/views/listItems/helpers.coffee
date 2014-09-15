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
			return 'fa-check-square-o '
		else
			return 'fa-square-o'

	beingUpdatedIcon : ->
		if Items.findOne(@_id).beingUpdated
			return 'fa fa-spinner fa-spin fa-2x'
		else
			return 'fa fa-trash'

	beingUpdatedName : ->
		if Items.findOne(@_id).beingUpdated
			return 'updating'
		else
			return 'bin'


Template.listItems.events
	'click [name=done]' : (e) ->
		item = Items.findOne @_id
		Items.update @_id,
			$set:
				done : not item.done

	'change input[name=titleNew]' : (e) ->
		newTitle = Items.insert
			title : e.currentTarget.value
		$(e.currentTarget).val('')

	'click td[name=title]' : (e) ->
		txt = $(e.currentTarget).children('#titleText').text()
		$(e.currentTarget).children('#titleText').addClass('hidden')
		$(e.currentTarget).children('#titleInput').val(txt).removeClass('hidden').focus()
		Items.update @_id,
			$set:
				beingUpdated : true

	'keyup input[name=title]' : (e) ->		
		Items.update @_id,
			$set:
				title : e.currentTarget.value
		if e.which == 13
			$(e.currentTarget).focusout()

	'focusout td[name=title]' : (e) ->		
		$(e.currentTarget).children('#titleText').removeClass('hidden')
		$(e.currentTarget).children('#titleInput').addClass('hidden')
		Items.update @_id,
			$set:
				beingUpdated : false

	'click [name=bin]' : (e) ->
		titleId = $(e.currentTarget).parents('tr').attr('titleId')
		Items.remove(titleId);
		console.log 'Delete: ', titleId
