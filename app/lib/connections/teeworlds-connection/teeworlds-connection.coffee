TeeworldsEcon = require 'teeworlds-econ'
{ CronJob } = require 'cron'
handlers = require './handlers'

class TeeworldsConnection extends TeeworldsEcon

  constructor: (server, @options) ->
    super(server)

    @hostname = server.host + ':' + server.port

    @on 'error', (err) -> console.error "#{@hostname}: #{err.message}"
    @on 'reconnected', () -> console.info "Connection to #{@hostname} restored"

    if @options.cron
      @on 'online', () -> new CronJob @options.cron, @cronTick, null, true
    if @options.raw
      this.addHandler handlers.handleRaw

    @connect()

  cronTick: () =>
    @status().then (players) => @emit 'status', {
      players: players
      online: if players then players.length else 0
    }

module.exports = TeeworldsConnection
