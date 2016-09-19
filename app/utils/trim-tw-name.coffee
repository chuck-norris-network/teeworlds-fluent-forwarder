module.exports = (input) ->
  return null unless input

  input
    .replace /^[! ]+/g, ''
    .replace /[! ]+$/g, ''
