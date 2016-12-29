###
  Project's file structure
###
module.exports =
  # root
  src: './src'
  dist: './dist'
  # compiler specific
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
