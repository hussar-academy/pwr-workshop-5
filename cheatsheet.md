[Poprzedni cheatsheet](https://github.com/hussar-academy/pwr-workshop-3/blob/master/cheatsheet.md)

# Slim

#### Linki do stanów (routes)

```slim
a ui-sref="kittens" All the kittens

# We would actually never write code like this:
a ui-sref="kitten({ id: 5 })" Kitten with the id == 5

# Instead, we would need the kitten object
a ui-sref="kitten({ id: kitten.id })" Current kitten
```

# AngularJS

#### Zdefiniowane controllera w `state`

```coffee
# app/assets/javascripts/routes.coffee
.state 'kittens',
  url: '/kittens'
  controller: 'KittensCtrl'
  templateUrl: '/assets/kittens.html'
```

Dzięki temu cały stan (wszystko wewnątrz `kittens.html`) dostaje dostęp do tego controllera.

#### Wydzielenie serwisu do komunikacji z API

```coffee
# app/assets/javascripts/services/kitten.coffee
angular.module('KittenApp').service 'Kitten', ($http) ->
  base = '/api/kittens'
  index: ->
    $http.get(base)
  create: (kitten) ->
    # This will send POST request with `kitten` parameter which contains this object
    $http.post(base, kitten: kitten)

# app/assets/javascripts/controllers/kittens-ctrl.coffee
#                We need to inject this service to controller ▼
angular.module('KittenApp').controller 'KittenCtrl', ($scope, Kitten) ->
```

Wtedy w controllerze możemy zamienić: ~~`$http.get('/api/kittens')`~~ na `Kitten.index()`

#### Wykorzystanie resolvera

```coffee
# app/assets/javascripts/routes.coffee
.state 'kittens',
  url: '/kittens'
  controller: 'KittensCtrl'
  resolve:
    # Note that we inject and use our Kitten service
    kittens: (Kitten) ->
      Kitten.index()
  templateUrl: '/assets/kittens.html'
```

Wtedy do controllera `KittensCtrl` możemy wstrzyknąć *(ugh)* zmienną, którą resolvujemy:

```coffee
# app/assets/javascripts/controllers/kittens-ctrl.coffee
#                                      These are our resolved kittens ▼
angular.module('KittenApp').controller 'KittenCtrl', ($scope, Kitten, kittens) ->
```

Dzięki temu możemy zamienić:

```coffee
Kitten.index().success (response) ->
  $scope.kittens = response
```

na

```coffee
# Note that we must use kittens.data, not just kittens!
$scope.kittens = kittens.data
```

#### Stan (route) przyjmujący parametr

```coffee
.state 'kitten',
  url: '/kitten/:id'
  resolve:
    kitten: ($stateParams, Kitten) ->
      Kitten.show($stateParams.id)
  …
```

Dzięki temu możemy przejść w przeglądarce pod adres `/kitten/5` i uzyskać kota o id == 5.

Zwróć uwagę na wykorzystanie serwisu `$stateParams`. Możemy go wstrzyknąć i wykorzystać również w innych miejscach aplikacji (na przykład w controllerze).

Pamiętaj również, że możemy przekazać więcej niż 1 parametr.

# Ruby on Rails

#### Wykorzystanie `member` i `collection` w routes'ach

Możemy zamienić

```ruby
resources :kittens
post 'kittens/:id/buy', to: 'kittens#buy'
get 'kittens/ginger', to: 'kittens#ginger'
```

na:

``` ruby
resources :kittens do
  member do
    post 'vote'
  end
  collection do
    get 'ginger'
  end
end
```

Dzięki takiej wersji jest mniej pisania i trochę więcej magii (co nie zawsze jest dobre, ale zawsze warto o tym wiedzieć :) )

Przy okazji: [co robi `resources :kittens`](https://twitter.com/andrzejkrzywda/status/536479476851695616)

