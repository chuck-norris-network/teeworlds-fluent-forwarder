gulp    = require 'gulp'
nodemon = require 'gulp-nodemon'

gulp.task 'develop', () ->
  nodemon {
    ext:   'js coffee'
    watch: ['./app', './bin']
  }

  return
