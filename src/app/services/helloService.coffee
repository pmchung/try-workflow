module.exports = ($http) ->
  'ngInject'
  getHello = ->
    return $http.get('http://www.mocky.io/v2/58654680110000f70dcf8e06')
  hello: getHello
