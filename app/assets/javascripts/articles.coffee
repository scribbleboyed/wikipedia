# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
app = angular.module('articles', [])

app.controller 'MainCtrl', ($scope, $http) ->
	$scope.test = [1,2,3,4,5]
	$http.get '/api'
	# $http.get('https://crossorigin.me/https://en.wikipedia.org/w/api.php?action=query&list=recentchanges&rcprop=title%7Cids%7Csizes%7Cflags%7Cuser&rclimit=3&format=json')
		.then (response) ->
		  $scope.results = response.data.query.recentchanges
		  $scope.next_page = response.data.continue.rccontinue
		  return