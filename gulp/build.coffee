gulp = require 'gulp'
config = require './config'
pug = require 'gulp-pug'
stylus = require 'gulp-stylus'
uglify = require 'gulp-uglify'
ngAnnotate = require 'gulp-ng-annotate'
coffeeify = require 'coffeeify'
browserify = require 'browserify'
watchify = require 'watchify'
source = require 'vinyl-source-stream' # convert browserify stream to vinyl stream
buffer = require 'vinyl-buffer' # buffer up the stream

# Pug
gulp.task 'pug', ->
  gulp.src config.pug.src
    .pipe pug()
    .pipe gulp.dest config.pug.dist

# Stylus
gulp.task 'stylus', ->
  gulp.src config.stylus.src
    .pipe stylus()
    .pipe gulp.dest config.stylus.dist

# Coffee + Browserify/Watchify + ngAnnotate + Uglify
gulp.task 'coffee', ->
  compileCoffee config.coffee.src

gulp.task 'coffee-watch', ->
  compileCoffee config.coffee.src, true

compileCoffee = (entry, shouldWatch = false) ->
  opt =
    entries: entry
    extensions: config.browserify.extensions
  b = if shouldWatch then watchify browserify opt else browserify opt
  b.transform coffeeify
  compile = ->
    b.bundle()
      .pipe source config.coffee.distName
      .pipe buffer() # collect stream
      .pipe ngAnnotate()
      .pipe uglify()
      .pipe gulp.dest config.coffee.dist
  if shouldWatch
    b.on 'log', (msg) ->
      console.log "Built [#{config.coffee.distName}] => #{msg}"
    b.on 'update', ->
      compile()
      return
  compile()
