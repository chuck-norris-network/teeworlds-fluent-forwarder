config = require './config'
TeeworldsEcon = require 'teeworlds-econ'

{ host, port, password } = config.teeworlds

throw new Error('Teeworlds password is undefind') unless password

teeworlds = new TeeworldsEcon host, port, password

teeworlds.on 'error', (err) ->
  console.log err.message

console.log 'Connecting to Teeworlds server...'
teeworlds.connect()

module.exports = teeworlds
