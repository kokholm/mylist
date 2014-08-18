Meteor.methods
	toggleDone : (id) ->
		item = Items.findOne id 
		Items.update id,
			$set:
				done : not item.done

	titleNew : (txt) ->
		newTitle = Items.insert
			title : txt

	titleUpdate : (id, txt) ->
		Items.update id,
			$set:
				title : txt

	titleEnterUpdate : (id) ->
		Items.update id,
			$set:
				beingUpdated : true

	titleExitUpdate : (id) ->
		Items.update id,
			$set:
				beingUpdated : false