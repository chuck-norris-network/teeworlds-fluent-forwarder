teeworlds = require './teeworlds'
fluent = require './fluent'

for hostname, econ of teeworlds.getConsoles()
  do (hostname, econ) ->
    econ.on 'enter', (player) -> fluent.emit 'enter', { player, hostname }
    econ.on 'leave', (player) -> fluent.emit 'leave', { player, hostname }
    econ.on 'chat', (player, message) -> fluent.emit 'chat', { player, message, hostname }
    econ.on 'pickup', (player, weapon) -> fluent.emit 'pickup', { player, weapon, hostname }
    econ.on 'kill', (killer, victim, weapon) -> fluent.emit 'kill', { killer, victim, weapon, hostname }
