Template.postSubmit.events "submit form": (e) ->
  e.preventDefault()
  post =
    url: $(e.target).find("[name=url]").val()
    title: $(e.target).find("[name=title]").val()

  Meteor.call "postInsert", post, (error, result) ->
    
    # display the error to the user and abort
    return alert(error.reason)  if error
    
    # show this result but route anyway
    alert "This link has already been posted"  if result.postExists
    Router.go "postPage",
      _id: result._id

    return

  return
