
Template._loginButtonsLoggedInDropdown.events "click #login-buttons-edit-profile": (event) ->
  event.stopPropagation()
  Template._loginButtons.toggleDropdown()
  Router.go "profileEdit"
  return


Template.navigation.events
	'click [id=buttonAddListItem]' : (e) ->
		result = Items.insert
			title : ''

		$("[titleId='"+result+"']").children("td[name=title]").click()
		console.log 'Result: ', result