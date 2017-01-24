gulp             = require 'gulp'
coffeelint       = require 'gulp-coffeelint'
excludeGitignore = require 'gulp-exclude-gitignore'

gulp.task 'coffeelint', () ->
  gulp.src '**/*.coffee'
    .pipe excludeGitignore()
    .pipe coffeelint()
    .pipe coffeelint.reporter('fail')
