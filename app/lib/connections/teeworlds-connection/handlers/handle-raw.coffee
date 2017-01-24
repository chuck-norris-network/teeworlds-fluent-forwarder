handleRaw = (econ, message) ->
  econ.emit 'raw', { message }

module.exports = handleRaw
