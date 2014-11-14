# Local (client-only) collection
root = exports ? this
root.Errors = new Mongo.Collection(null)

@throwError = (message) ->
  Errors.insert message: message
  return
