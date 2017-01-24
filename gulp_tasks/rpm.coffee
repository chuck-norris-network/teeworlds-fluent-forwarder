gulp  = require 'gulp'
brass = require 'gulp-brass'
npm   = require 'gulp-brass-npm'
path  = require 'path'
del   = require 'del'

pkg = require '../package.json'
options = npm.getOptions pkg
options.version = options.version.replace '-', '.'
options.installDir = "/usr/lib/#{options.name}"
options.service = {
  type:        'systemd'
  name:        options.name
  description: options.description
  exec:        "/usr/bin/#{options.name}"
  user:        options.name
  group:       options.name
}

rpm = brass.create options

gulp.task 'rpm:clean', () ->
  del './brass_build'

gulp.task 'rpm:setup', ['rpm:clean'], rpm.setupTask()

gulp.task 'rpm:source', ['rpm:setup'], npm.sourceTask(pkg, rpm)

gulp.task 'rpm:files', ['rpm:source'], () ->
  gulp.src '**/*', rpm.globOptions
    .pipe gulp.dest(path.join(rpm.buildRoot, options.installDir))
    .pipe brass.util.stream (file, done) ->
      if file.relative == pkg.scripts.start.replace /\.\//, ''
        file.attr = ['0775', 'root', 'root']
      done null, file
    .pipe rpm.files()

gulp.task 'rpm:service', ['rpm:setup'], () ->
  gulp.src './dist/teeworlds-log-collector.service.hbs'
    .pipe brass.util.rename("#{options.service.name}.service")
    .pipe brass.util.template(options.service)
    .pipe gulp.dest(path.join(rpm.buildRoot, '/lib/systemd/system'))
    .pipe rpm.files()

gulp.task 'rpm:config', ['rpm:setup'], () ->
  gulp.src '.env.example'
    .pipe brass.util.rename(options.service.name)
    .pipe gulp.dest(path.join(rpm.buildRoot, '/etc/sysconfig'))
    .pipe brass.util.stream (file, done) ->
      file.config = true
      file.noreplace = true
      done null, file
    .pipe rpm.files()

gulp.task 'rpm:binaries', ['rpm:files'], npm.binariesTask(pkg, rpm)

gulp.task 'rpm:spec', ['rpm:files', 'rpm:binaries', 'rpm:service', 'rpm:config'], () ->
  gulp.src 'dist/teeworlds-log-collector.spec.hbs'
    .pipe brass.util.rename("#{options.service.name}.spec")
    .pipe rpm.spec()
    .pipe gulp.dest(rpm.buildDir_SPECS)

gulp.task 'rpm', ['rpm:spec'], rpm.buildTask()
