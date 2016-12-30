###
  Gulp & Structure configuration
###
module.exports =
  # root
  src: './src'
  dist: './dist'
  # https://github.com/hiddentao/gulp-server-livereload#options
  webserver:
    livereload: true
  # https://github.com/substack/node-browserify#browserifyfiles--opts
  browserify:
    entries: './src/app/'
    extensions: ['.coffee', '.json', '.js']
  # https://github.com/jnordberg/coffeeify#options
  coffee:
    src: './src/app/index.coffee'
    dist: './dist/js/'
    distName: 'app.js'
  # https://pugjs.org/api/reference.html
  pug:
    src: './src/**/*.pug'
    dist: './dist/'
  # https://github.com/stevelacy/gulp-stylus/blob/master/examples/gulpfile.js
  stylus:
    options:
      compress: true
    src: './src/styles/*.styl',
    dist: './dist/styles/'
