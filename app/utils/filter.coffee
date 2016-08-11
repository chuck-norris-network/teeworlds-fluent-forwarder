module.exports = (obj, re) ->
  Object.keys(obj).filter (key) ->
    re.test key
  .reduce (res, key) ->
    res[key] = obj[key]
    return res
  , {}
