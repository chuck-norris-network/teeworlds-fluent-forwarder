config = require './config'
TeeworldsEcon = require 'teeworlds-econ'
{ parseServers } = require './utils'

servers = {}
consoles = {}

setupConsoles = (servers) ->
  consoles = {}

  for host, server of servers
    do (host, server) ->
      econ = new TeeworldsEcon server.host, server.port, server.password
      econ.on 'error', (err) ->
        console.log err.message
      econ.on 'reconnect', () ->
        console.log 'Connection to %s lost. Reconnecting...', host
      econ.on 'reconnected', () ->
        console.log 'Connection to %s restored', host
      console.log 'Connecting to Teeworlds on %s...', host
      econ.connect()
      consoles[host] = econ

  return consoles

getServers = () ->
  return servers

getConsoles = () ->
  return consoles

servers = parseServers config.teeworlds.servers
throw new Error('Can\'t parse Teeworlds server list') unless servers

consoles = setupConsoles servers

module.exports = {
  getServers
  getConsoles
}
