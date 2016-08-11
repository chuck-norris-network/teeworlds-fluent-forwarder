TeeworldsEcon = require 'teeworlds-econ'

class TeeworldsConnection extends TeeworldsEcon

  constructor: (host, port) ->
    super

    @hostname = host + ':' + port

    @on 'error', (err) -> console.error "#{@hostname}: #{err.message}"
    @on 'reconnected', () -> console.info "Connection to #{@hostname} restored"

    @connect()

module.exports = TeeworldsConnection
