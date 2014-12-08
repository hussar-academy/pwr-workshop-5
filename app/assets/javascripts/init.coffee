DigApp = angular.module 'DigApp', ['ui.router']

DigApp.config ($locationProvider) ->
  $locationProvider.html5Mode false

DigApp.config ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] =
    angular.element(
      document.querySelector('meta[name=csrf-token]')
    ).attr('content')

DigApp.config ($provide, $httpProvider, Rails) ->
  $provide.factory 'railsAssetsInterceptor', ->
    request: (config)->
      if assetUrl = Rails.templates[config.url]
        config.url = assetUrl
      config

  $httpProvider.interceptors.push 'railsAssetsInterceptor'

