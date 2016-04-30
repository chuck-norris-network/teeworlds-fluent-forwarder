config = require './config'
FluentLogger = require 'fluent-logger'

{ host, port, tagPrefix } = config.fluent

console.log 'Connecting to Fluent...'
fluent = FluentLogger.createFluentSender tagPrefix, {
  host: host
  port: port
}

fluent.on 'error', (err) ->
  console.log err.message

module.exports = fluent
