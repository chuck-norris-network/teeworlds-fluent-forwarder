gulp = require 'gulp'
path = require 'path'
ncu  = require 'npm-check-updates'

gulp.task 'current', (done) ->
  options = {
    packageFile: path.resolve('package.json')
    jsonUpgraded: false
    loglevel: 'info'
    upgrade: true
    upgradeAll: true
  }

  ncu.run(options).then done

  return
