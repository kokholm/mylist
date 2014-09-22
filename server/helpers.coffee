Lists.find().observe removed: (doc) ->
	listId = doc._id
	Items.remove({"listId" : listId})
	console.log 'Removing list id: '+listId
	return