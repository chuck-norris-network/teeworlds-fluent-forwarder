require('dotenv').config(silent: true)
{ parseServers, filter } = require './utils'

module.exports = {
  'teeworlds servers': parseServers(filter(process.env, /_SERVERS$/))
  'teeworlds status cron': process.env.TEEWORLDS_STATUS_CRON ? null
  'teeworlds raw': if process.env.TEEWORLDS_RAW then !!parseInt process.env.TEEWORLDS_RAW else false

  'fluent host': process.env.FLUENT_HOST ? 'localhost'
  'fluent port': if process.env.FLUENT_PORT then parseInt process.env.FLUENT_PORT else 24224
  'fluent reconnect interval': 30000
}
