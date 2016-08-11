module.exports = (env) ->
  servers = []

  for key, value of env
    tag = key
      .replace(/_SERVERS$/, '')
      .replace('_', '.')
      .toLowerCase()

    for server in value.split ','
      [ host, port, password ] = server.split ':'
      port = parseInt port

      return false unless tag or host or port or password

      servers.push { tag, host, port, password }

  return servers
