gulp        = require 'gulp'
requireGlob = require 'require-glob'

requireGlob.sync './gulp_tasks/*.coffee'

gulp.task 'static', ['coffeelint']

gulp.task 'default', ['static', 'develop']
