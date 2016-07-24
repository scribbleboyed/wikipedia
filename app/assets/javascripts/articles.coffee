# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
app = angular.module('articles', [])

app.factory 'articleService', ($http) ->
  { async: ->
    $http.get '/api'
 }

app.controller 'MainCtrl', (articleService, $scope, $interval) ->
  $scope.autoload = true

  $scope.stopAutoload = ->
  	$scope.autoload = false
  	$interval.cancel $scope.intervalId

  $scope.intervalId = $interval((->
    articleService.async().then (response) ->
      $scope.articles = response.data.query.recentchanges
      return
    return
  ), 2000)
  return