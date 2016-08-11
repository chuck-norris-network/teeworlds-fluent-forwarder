TeeworldsEcon = require 'teeworlds-econ'

class TeeworldsConnection extends TeeworldsEcon

  constructor: () ->
    super
    @connect()

module.exports = TeeworldsConnection
