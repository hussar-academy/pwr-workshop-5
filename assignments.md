# Zadanie 1.

Rejestracja / Autentykacja użytkowników

#### 1.1
Na podstawie dokumentacji (BCrypt)[https://github.com/codahale/bcrypt-ruby] dodaj moduł odpowiedzialny autentykacje.
Pamiętaj aby utworzyć migracje z polem `password_digest`

#### 1.2
Stwórz railowsy kontroller `registrations_controler.rb`, odpowiedzialny za rejestracje nowych użytkowników.
Użyj do tego celu modelu `User`. Widok `new.slim` umieszczamy w katalogu `app/views/registrations`
Nie zapomnij dodać odpowiednich wpisówch do `routes.rb`

#### 1.3
Stwórz railowsy kontroller `sessions_controler.rb`, odpowiedzialny za logowanie i wylogowywaie użytkowników.
Użyj do tego celu modelu `User`, zmiennej `session`,  Widoki `new.slim` umieszczamy w katalogu `app/views/sessions`.
Nie zapomnij dodać odpowiednich wpisówch do `routes.rb`

#### 1.4
Zmodyfikuj `app/views/layouts/application.slim`, tak aby do Angularowej aplikacji wpuszczać tylko zalogowanych użytkowników.
Tip: aby mieć dostęp do zdefiniowanych metod z kontrolera w widoku użyj metody `helper_method`.

# Zadanie 2.

Zrefaktoruj kontroller `api/digs_controller.rb`, tak aby nowe obiekty typu `Dig` i `Comment` były przypisane do zalogowanego usera.
Użyj methody `current_user` oraz dostępnych asocjacji np `current_user.digs.create(dig_params)`

