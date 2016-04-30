teeworlds = require './teeworlds'
fluent = require './fluent'

teeworlds.on 'enter', (player) -> fluent.emit 'enter', { player }
teeworlds.on 'leave', (player) -> fluent.emit 'leave', { player }
teeworlds.on 'chat', (player, message) -> fluent.emit 'chat', { player, message }
teeworlds.on 'pickup', (player, weapon) -> fluent.emit 'pickup', { player, weapon }
teeworlds.on 'kill', (killer, victim, weapon) -> fluent.emit 'kill', { killer, victim, weapon }
