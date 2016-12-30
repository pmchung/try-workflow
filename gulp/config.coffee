###
  Gulp & Structure configuration
###
module.exports =
  # root
  src: './src'
  dist: './dist'
  # Options - https://github.com/hiddentao/gulp-server-livereload#options
  webserver:
    livereload: true
  # Options - https://github.com/substack/node-browserify#browserifyfiles--opts
  browserify:
    entries: './src/app/'
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
