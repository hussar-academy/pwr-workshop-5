# Zadanie 1.

Chcemy zrobić refactor kodu, który napisaliśmy na poprzednich zajęciach.
s
#### 1.1
Wszystkie wywołania metod serwisu `$http` chcemy wydzielić do osobnego, naszego serwisu. Robimy to po to, aby zawsze wiedzieć gdzie szukać punktów połączenia z API i zwiększyć czytelność kodu w controllerach.

**Zadanie:** Utwórz serwis `Dig` do którego wydzielisz wszystkie hity do API z `DigsCtrl`.

#### 1.2
W pliku `index.html.slim` cały kod trzymamy w `div`ie z dyrektywą `DigsCtrl`. Dzięki temu wszystko w tym `div`ie miało dostęp do tego controllera. W przypadku, kiedy controller dotyczy całej podstrony można go określić w `state` dla tej podstrony.

**Zadanie:** Przypisz `DigsCtrl` do stanu `index` w `routes.coffee`. Nie zapomnij usunąć starego wywołania controllera.

#### 1.3
Podobnie w `DigsCtrl` na samym początku wywołujemy kod do pobrania wszystkich Digów. W `routes.coffee` możemy wykorzystać `resolve`, który załaduje Digi przed załadowaniem strony i przekaże je do controllera.

**Zadanie:** Użyj resolvera do załadowania Digów w stanie `index`. Usuń stary kod odpowiedzialny za to i zastąp go zwykłym przypisaniem nowych danych.

#### 1.4
W `routes.rb` dla Railsów używamy brzydkiej konstrukcji:

```ruby
post 'digs/:id/vote', to: 'digs#vote'
```

Możemy wykorzystać fakt, że mamy zdefinowane `resources :digs` i użyć konstrukcji `member do … end`, aby zdefiniować tę ścieżkę.

**Zadanie:** Zastąp ścieżkę dla `vote` rozwiązaniem wykorzystującym `member`.

# Zadanie 2.

Chcemy mieć podstronę, na której pokażemy jednego Diga, żeby móc wysłać link znajomemu.

**Zadanie:** Utwórz nowy stan `dig` (przykładowa ścieżka: `/dig/1`), który jako parametr przyjmie ID Diga, który chcemy pokazać. Wyświetl w nim dane z tego Diga.

Proponowane kroki:

- Dodaj i uzupełnij metodę `show` do `Api::DigsController`
- Utwórz odpowiedni plik `.html.slim` w folderze `app/assets/templates/`
- Dodaj nowy controller Angularowy `DigCtrl`, który obsłuży wyświetlanie Diga
- Utwórz nowy stan w `routes.coffee`
- Przy każdym Digu na stronie głównej wyświetl link do niego. Wykorzystaj dyrektywę `ui-sref` z parametrem.

# Zadanie 3.

**Zadanie:** Na stronie Diga chcemy mieć przycisk, który wyświetli nam wszystkie komentarze do niego przypisane.

# Zadanie 4.

Analogicznie do utworzenia podstrony dla jednego Diga - chcemy móc przejść do jednego komentarza.

**Zadanie:**

- Utwórz zagnieżdżoną ścieżkę, która wyświetli tylko jeden komentarz (np. `/dig/1/comments/1`).
- Przy każdym komentarzu pokaż link do tego komentarza.
- Na stronie komentarza wyświetl również przycisk "Wstecz", który przeniesie użytkownika z powrotem do Diga.

Uwagi:

- Do przycisku powrotu wykorzystaj serwis `$stateParams`

