config = require './config'
{ FluentConnection, TeeworldsConnection } = require './lib/connections'
binds = require './lib/binds'
{ Bind } = binds

config['teeworlds servers'].forEach (server) ->
  teeworlds = new TeeworldsConnection server, {
    cron: config['teeworlds status cron']
    raw: config['teeworlds raw']
  }

  fluent = new FluentConnection server.tag, {
    host: config['fluent host']
    port: config['fluent port']
    reconnectInterval: config['fluent reconnect interval']
    milliseconds: false
  }

  binding = new Bind()
  binding.addConnection teeworlds
  binding.addConnection fluent

  binds.use binding
