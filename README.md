# Teeworlds Log Collector

[![GitHub tag][github-image]][github-url] ![License][license-image]

Teeworlds Log Collector is a lightweight Node.js application that allows you to collect logs from [Teeworlds](https://www.teeworlds.com/) servers and forward game events  to [Fluentd](http://www.fluentd.org/) (data collector for unified logging layer).

# Configuration

Collector is configured using environment variables.

`*_SERVERS` — Comma separated list of Teeworlds servers. Asterisk transforms to Fluentd tag.

`TEEWORLDS_STATUS_CRON` — Execute `status` command by schedule.

`FLUENT_HOST` — Fluentd daemon host.

`FLUENT_PORT` — Fluentd daemon port.

# Example

```
TEEWORLDS_DM_SERVERS="localhost:8303:secret" \
TEEWORLDS_CTF_SERVERS="localhost:8304:secret" \
TEEWORLDS_STATUS_CRON="0 */10 * * * *" \
./bin/teeworlds-fluent-forwarder
```

will produce following JSON:

```json
teeworlds.dm.enter: {"hostname":"localhost:8303","name":"Teeworlds DM server","player":"nameless tee","team":"spectators","client":"8.8.8.8:55555"}
teeworlds.dm.kill: {"hostname":"localhost:8303","name":"Teeworlds DM server","killer":"nameless tee","victim":"nameless tee","weapon":"rocket"}
teeworlds.dm.leave: {"hostname":"localhost:8303","name":"Teeworlds DM server","player":"nameless tee"}
teeworlds.ctf.enter: {"hostname":"localhost:8304","name":"Teeworlds CTF server","player":"nameless tee","team":"spectators","client":"8.8.8.8:55555"}
teeworlds.dm.status: {"hostname":"localhost:8304","name":"Teeworlds DM server","players":[{"cid":0,"client":"8.8.8.8:55555","player":"nameless tee","score":21,"admin":false}],"online":1}
teeworlds.ctf.status: {"hostname":"localhost:8303","name":"Teeworlds CTF server","players":null,"online":0}
```

## License

MIT

[github-image]: https://img.shields.io/github/tag/chuck-norris-network/teeworlds-fluent-forwarder.svg?style=flat-square
[github-url]: https://github.com/chuck-norris-network/teeworlds-fluent-forwarder
[license-image]: https://img.shields.io/npm/l/teeworlds-econ.svg?style=flat-square
