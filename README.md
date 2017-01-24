# Teeworlds Log Collector

[![GitHub tag][github-image]][github-url] ![License][license-image]

Teeworlds Log Collector is a lightweight Node.js application that allows you to collect logs from [Teeworlds](https://www.teeworlds.com/) servers and forward game events  to [Fluentd](http://www.fluentd.org/) (data collector for unified logging layer).

# Requirements

- [Enabled Teeworlds econ](https://www.teeworlds.com/forum/viewtopic.php?id=8275).
- [Fluentd](http://www.fluentd.org/).

# Configuration

Collector is configured using environment variables.

`*_SERVERS` — Comma separated list of Teeworlds servers. Asterisk transforms to Fluentd tag.

`TEEWORLDS_STATUS_CRON` — Execute `status` command by schedule. Disabled by default.

`TEEWORLDS_RAW` — Emit raw log messages with `server-name.raw` tag. Disabled by default.

`FLUENT_HOST` — Fluentd daemon host.

`FLUENT_PORT` — Fluentd daemon port.

# Example

Create simple `fluentd.conf`:

```
<source>
  @type forward
  port 24224
  bind 127.0.0.1
</source>

<match **>
  @type stdout
</match>
```

...and start Fluentd with this command: `fluentd -c fluentd.conf`.

Then run `./bin/teeworlds-log-collector` with necessary environment variables:

```
TEEWORLDS_DM_SERVERS="localhost:8303:secret" \
TEEWORLDS_CTF_SERVERS="localhost:8304:secret" \
TEEWORLDS_STATUS_CRON="0 */10 * * * *" \
./bin/teeworlds-log-collector
```

Log collector will produce following output:

```json
teeworlds.dm.enter: {"hostname":"localhost:8303","name":"Teeworlds DM server","player":"nameless tee","team":"spectators","client":"8.8.8.8:55555"}
teeworlds.dm.kill: {"hostname":"localhost:8303","name":"Teeworlds DM server","killer":"nameless tee","victim":"nameless tee","weapon":"rocket"}
teeworlds.dm.leave: {"hostname":"localhost:8303","name":"Teeworlds DM server","player":"nameless tee"}
teeworlds.ctf.enter: {"hostname":"localhost:8304","name":"Teeworlds CTF server","player":"nameless tee","team":"spectators","client":"8.8.8.8:55555"}
teeworlds.dm.status: {"hostname":"localhost:8304","name":"Teeworlds DM server","players":[{"cid":0,"client":"8.8.8.8:55555","player":"nameless tee","score":21,"admin":false}],"online":1}
teeworlds.ctf.status: {"hostname":"localhost:8303","name":"Teeworlds CTF server","players":null,"online":0}
```

Also check out [this awesome Fluentd plugins](http://www.fluentd.org/dataoutputs) and build your own data management and analytic system.

## License

MIT

[github-image]: https://img.shields.io/github/tag/chuck-norris-network/teeworlds-log-collector.svg?style=flat-square
[github-url]: https://github.com/chuck-norris-network/teeworlds-log-collector
[license-image]: https://img.shields.io/npm/l/teeworlds-econ.svg?style=flat-square
