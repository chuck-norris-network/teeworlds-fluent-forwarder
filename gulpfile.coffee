gulp        = require 'gulp'
requireGlob = require 'require-glob'

requireGlob.sync './gulp/*.coffee'

gulp.task 'static', ['coffeelint']

gulp.task 'default', ['static', 'develop']
