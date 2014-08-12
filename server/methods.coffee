Meteor.methods
	toggleDone : (id) ->
		item = Items.findOne id 
		Items.update id,
			$set:
				done : not item.done

	titleNew : (txt) ->
		Items.insert
			title : txt

	titleUpdate : (id, txt) ->
		console.log 'Update: ', txt
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