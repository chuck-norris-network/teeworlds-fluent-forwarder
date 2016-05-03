config = require './config'
TeeworldsEcon = require 'teeworlds-econ'

servers = {}
consoles = {}

parseServers = (serversString) ->
  throw new Error('Undefined Teeworlds servers list') unless serversString

  servers = {}

  items = serversString.split ','

  for item in items
    [ host, port, password ] = item.split ':'

    unless host and port and password
      throw new Error('Can\'t parse Teeworlds servers list')

    servers[host + ':' + port] = { host, port, password }

  return servers

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
consoles = setupConsoles servers

module.exports = {
  getServers
  getConsoles
}
