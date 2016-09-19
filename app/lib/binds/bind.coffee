{ TeeworldsConnection, FluentConnection } = require '../connections'
{ trimTwName } = require '../../utils'

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
      'netban'
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
        @fluent.emit eventName, Object.assign { hostname: @teeworlds.hostname, name: trimTwName(@teeworlds.name) }, event

module.exports = Bind
