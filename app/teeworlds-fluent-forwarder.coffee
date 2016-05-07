teeworlds = require './teeworlds'
fluent = require './fluent'
{ getTimestamp } = require './utils'

for hostname, econ of teeworlds.getConsoles()
  do (hostname, econ) ->
    econ.on 'enter', (e) ->
      fluent.emit 'enter', Object.assign({}, e, { hostname }), getTimestamp()
    econ.on 'leave', (e) ->
      fluent.emit 'leave', Object.assign({}, e, { hostname }), getTimestamp()
    econ.on 'chat', (e) ->
      fluent.emit 'chat', Object.assign({}, e, { hostname }), getTimestamp()
    econ.on 'pickup', (e) ->
      fluent.emit 'pickup', Object.assign({}, e, { hostname }), getTimestamp()
    econ.on 'kill', (e) ->
      fluent.emit 'kill', Object.assign({}, e, { hostname }), getTimestamp()
