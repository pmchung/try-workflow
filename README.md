#try-workflow

Gulpfiles for CoffeeScript, Browserify, Watchify, Stylus, Pug (Jade)
___

###Install

`npm install`

###Run development mode
Starts [gulp-server-livereload](https://github.com/hiddentao/gulp-server-livereload) and watches `.coffee` (through Watchify), `.styl`, `.pug`

`npm start` or `gulp`

###Build only

`gulp build`

___

###Why gulp-server-livereload?
- Newly compiled CSS is injected instead of reloading the page.

###Why Browserify instead of gulp.concat?
- Allow use of `require` to grab dependencies.
- Don't need to worry about concat order.

___

##Todo
- [ ] Sourcemaps
- [x] Build error notifications
- [x] Stylus/Pug minification
