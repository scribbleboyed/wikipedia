# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
app = angular.module('articles', [])

app.factory 'articleService', ($http) ->
  { async: ->
    $http.get '/api'
 }

app.controller 'MainCtrl', (articleService, $scope, $interval) ->
  $interval ( ->
  	articleService.async().then (response) ->
    	$scope.articles = response.data.query.recentchanges
    	return
  ), 2000

