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
  compileCoffee false

gulp.task 'coffee-watch', ->
  compileCoffee true

compileCoffee = (shouldWatch = false) ->
  b = if shouldWatch then watchify browserify config.browserify else browserify config.browserify
  b.transform coffeeify
  if shouldWatch
    b.on 'log', (msg) ->
      console.log "Built [#{config.coffee.distName}] => #{msg}"
    b.on 'update', ->
      _compile(b)
      return
  _compile(b)

_compile = (b) ->
  b.bundle()
    .pipe source config.coffee.distName
    .pipe buffer() # collect stream
    .pipe ngAnnotate()
    .pipe uglify()
    .pipe gulp.dest config.coffee.dist

