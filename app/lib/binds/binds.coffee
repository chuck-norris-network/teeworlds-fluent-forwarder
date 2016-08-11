class Binds

  constructor: () ->
    @bindings = []

  use: (binding) ->
    @bindings.push binding
    binding.bind()

module.exports = Binds
