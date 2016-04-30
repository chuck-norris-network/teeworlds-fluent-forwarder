gulp        = require 'gulp'
glob        = require 'glob'
runSequence = require 'run-sequence'

glob.sync('./gulp/*.coffee').forEach (task) -> require task

gulp.task 'dist', (done) ->
  runSequence(
    'coffeelint'
    'rpm'
    done
  )

gulp.task 'default', ['develop', 'coffeelint']
