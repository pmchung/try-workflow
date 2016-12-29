###
  Gulp & Structure configuration
###
module.exports =
  # root
  src: './src'
  dist: './dist'
  webserver:
    livereload: true
  browserify:
    extensions: ['.coffee', '.json', '.js']
  coffee:
    src: './src/app/index.coffee'
    dist: './dist/js/'
    distName: 'app.js'
  pug:
    src: './src/**/*.pug'
    dist: './dist/'
  stylus:
    src: './src/styles/*.styl',
    dist: './dist/styles/'
