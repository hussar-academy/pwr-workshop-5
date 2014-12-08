angular.module('DigApp').config ($stateProvider, $urlRouterProvider, $locationProvider) ->
  $locationProvider.html5Mode(false)

  $urlRouterProvider.otherwise '/'

  $stateProvider
    .state 'index',
      url: '/',
      controller: 'DigsCtrl'
      resolve:
        digs: (Dig) ->
          Dig.index()
      templateUrl: '/assets/index.html'

    .state 'dig',
      url: '/dig/:id'
      controller: 'DigCtrl'
      resolve:
        dig: ($stateParams, Dig) ->
          Dig.show($stateParams.id)
      templateUrl: '/assets/dig.html'

    .state 'comment',
      url: '/dig/:id/comments/:commentID'
      controller: 'CommentCtrl'
      resolve:
        comment: ($stateParams, Dig) ->
          Dig.comment($stateParams.id, $stateParams.commentID)
      templateUrl: '/assets/comment.html'

