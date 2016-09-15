# Teeworlds Fluent Forwarder

[![GitHub tag][github-image]][github-url] ![License][license-image]

Forwards Teeworlds game events to Fluentd using econ connection.

# Configuration

Forwarder is configured using environment variables.

`*_SERVERS` — Comma separated list of Teeworlds servers. Asterisk transforms to Fluentd tag.

`FLUENT_HOST` — Fluentd daemon host.

`FLUENT_PORT` — Fluentd daemon port.

# Example

```
TEEWORLDS_DM_SERVERS=localhost:8303:secret TEEWORLDS_CTF_SERVERS=localhost:8304:secret ./bin/teeworlds-fluent-forwarder
```

will produce following JSON:

```
teeworlds.dm.enter: {"hostname":"localhost:8303","player":"nameless tee","team":"spectators","ip":"127.0.0.1"}
teeworlds.dm.kill: {"hostname":"localhost:8303","killer":"nameless tee","victim":"nameless tee","weapon":"rocket"}
teeworlds.dm.leave: {"hostname":"localhost:8303","player":"nameless tee"}
teeworlds.ctf.enter: {"hostname":"localhost:8304","player":"nameless tee","team":"spectators","ip":"127.0.0.1"}
```

## License

MIT

[github-image]: https://img.shields.io/github/tag/chuck-norris-network/teeworlds-fluent-forwarder.svg?style=flat-square
[github-url]: https://github.com/chuck-norris-network/teeworlds-fluent-forwarder
[license-image]: https://img.shields.io/npm/l/teeworlds-econ.svg?style=flat-square
