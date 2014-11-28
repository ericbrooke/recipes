recipes = angular.module('recipes',[
  'templates',
  'ngRoute',
  'controllers',
])

recipes.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/',
        templateUrl: "index.html"
        controller: 'RecipesController'
      )
])

recipe_list = [
  {
    id: 1
    name: 'Pecan Pie with Chocolate'
  },
  {
    id: 2
    name: 'Cherry Pie'
  },
  {
    id: 3
    name: 'Bread and Butter Pudding'
  },
  {
    id: 4
    name: 'Timarsur'
  }
]

controllers = angular.module('controllers',[])
controllers.controller("RecipesController", [ '$scope', '$routeParams', '$location',
  ($scope, $routeParams, $location)->
    $scope.search = (keywords)->  $location.path("/").search('keywords',keywords)

    if $routeParams.keywords
      keywords = $routeParams.keywords.toLowerCase()
      $scope.recipe_list = recipe_list.filter (recipe)-> recipe.name.toLowerCase().indexOf(keywords) != -1
    else
      $scope.recipe_list = []
])
