# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
app = angular.module('articles', [])

app.factory 'articleService', ($http) ->
  { async: ->
    $http.get '/api'
 }

app.controller 'MainCtrl', (articleService, $scope, $interval) ->

  getArticles = ->
    articleService.async().then (response) ->
      $scope.articles = response.data.query.recentchanges
    return

  startAutoload = ->
  	$scope.intervalId = $interval(getArticles, 5000)

  stopAutoload = ->
  	$interval.cancel $scope.intervalId

  $scope.autoload = true

  $scope.toggleAutoload = ->
  	if $scope.autoload
    	$scope.autoload = false
    	stopAutoload()
    else
    	$scope.autoload = true
    	getArticles()
    	startAutoload()

  getArticles()
  startAutoload()