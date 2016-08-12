{ TeeworldsConnection, FluentConnection } = require '../connections'

class Bind

  constructor: () ->
    @events = [
      'enter'
      'leave'
      'chat'
      'pickup'
      'kill'
      'capture'
      'flaggrab'
      'flagreturn'
    ]

    @teeworlds = null
    @fluent = null

  addConnection: (connection) ->
    if connection instanceof TeeworldsConnection
      @teeworlds = connection
      return

    if connection instanceof FluentConnection
      @fluent = connection
      return

    throw new Error 'Undefined connection type'

  bind: () ->
    @events.forEach (eventName) =>
      @teeworlds.on eventName, (event) =>
        @fluent.emit eventName, Object.assign { hostname: @teeworlds.hostname }, event

module.exports = Bind
