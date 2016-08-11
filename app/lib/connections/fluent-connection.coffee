{ FluentSender } = require 'fluent-logger/lib/sender'

class FluentConnection extends FluentSender

  constructor: (options) ->
    super undefined, options
    @_setupErrorHandler()

module.exports = FluentConnection
