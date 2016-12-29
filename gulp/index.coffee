gulp = require 'gulp'
config = require './config'
build = require './build'
webserver = require 'gulp-server-livereload'

gulp.task 'watch', ['coffee-watch', 'stylus', 'pug'], ->
  # coffee handled by watchify
  gulp.watch config.pug.src, ['pug']
  gulp.watch config.stylus.src, ['stylus']

gulp.task 'dev-server', ['watch'], ->
  gulp.src config.dist
    .pipe webserver config.webserver

gulp.task 'build', ['coffee', 'pug', 'stylus'] # build only
gulp.task 'default', ['dev-server'] # full dev mode
