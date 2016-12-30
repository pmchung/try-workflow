gulp = require 'gulp'
config = require './config'
pug = require 'gulp-pug'
notify = require 'gulp-notify'
stylus = require 'gulp-stylus'
uglify = require 'gulp-uglify'
ngAnnotate = require 'gulp-ng-annotate'
coffeeify = require 'coffeeify'
browserify = require 'browserify'
watchify = require 'watchify'
plumber = require 'gulp-plumber' # prevents gulp crashing from error
source = require 'vinyl-source-stream' # convert browserify stream to vinyl stream
buffer = require 'vinyl-buffer' # buffer up the stream

# Pug
gulp.task 'pug', ->
  gulp.src config.pug.src
    .pipe plumber
      errorHandler: notify.onError 'Pug: <%= error.message %>'
    .pipe pug()
    .pipe gulp.dest config.pug.dist

# Stylus
gulp.task 'stylus', ->
  gulp.src config.stylus.src
    .pipe plumber
      errorHandler: notify.onError 'Stylus: <%= error.message %>'
    .pipe stylus config.stylus.options
    .pipe gulp.dest config.stylus.dist

# Coffee + Browserify + ngAnnotate + Uglify
gulp.task 'coffee', ->
  b = browserify config.coffee.options
  b.transform coffeeify
  compileCoffee(b)

# Coffee + Browserify + Watchify + ngAnnotate + Uglify
gulp.task 'coffee-watch', ->
  b = watchify browserify config.browserify
  b.transform coffeeify
  b.on 'log', (msg) ->
    console.log '🚀', " Built '#{config.coffee.distName}' => #{msg}"
  b.on 'update', ->
    compileCoffee(b)
    return
  compileCoffee(b)

compileCoffee = (b) ->
  b.bundle()
    .pipe plumber
      errorHandler: notify.onError 'Coffee: <%= error.message %>'
    .pipe source config.coffee.distName
    .pipe buffer() # collect stream
    .pipe ngAnnotate()
    .pipe uglify()
    .pipe gulp.dest config.coffee.dist
