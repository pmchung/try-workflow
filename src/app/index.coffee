appComponent =
  templateUrl: 'app/app.view.html'
  controller: class AppComponent
    constructor: (helloService) ->
      'ngInject'
      @helloService = helloService
      return

    $onInit: ->
      @msg = 'hello'
      setTimeout (=> console.log @msg), 1000
      @helloService
        .hello()
        .then (res) =>
          console.log res.data
          @msg = res.data.hello
      return

angular.module 'app', []
.factory 'helloService', require('./services/helloService')
.component 'app', appComponent
