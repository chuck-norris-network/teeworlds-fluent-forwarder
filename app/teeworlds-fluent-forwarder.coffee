teeworlds = require './teeworlds'
fluent = require './fluent'
{ getTimestamp } = require './utils'

for hostname, econ of teeworlds.getConsoles()
  do (hostname, econ) ->
    econ.on 'enter', (player) -> fluent.emit 'enter', { player, hostname }, getTimestamp()
    econ.on 'leave', (player) -> fluent.emit 'leave', { player, hostname }, getTimestamp()
    econ.on 'chat', (player, message) -> fluent.emit 'chat', { player, message, hostname }, getTimestamp()
    econ.on 'pickup', (player, weapon) -> fluent.emit 'pickup', { player, weapon, hostname }, getTimestamp()
    econ.on 'kill', (killer, victim, weapon) -> fluent.emit 'kill', { killer, victim, weapon, hostname }, getTimestamp()
