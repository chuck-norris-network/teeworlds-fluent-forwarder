{ FluentSender } = require 'fluent-logger/lib/sender'

class FluentConnection extends FluentSender

  constructor: () ->
    super
    @_setupErrorHandler()

module.exports = FluentConnection
