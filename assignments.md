# Zadanie 1.

Rejestracja / Autentykacja użytkowników

#### 1.1
Na podstawie dokumentacji [BCrypt](https://github.com/codahale/bcrypt-ruby) dodaj moduł odpowiedzialny za autentykacje.
Pamiętaj aby utworzyć migracje z polem `password_digest`. Sprwadź w konsoli czy wszystko działa jak należy. Nie zapomnij o walidacjach.

#### 1.2
Stwórz railowsy kontroler `registrations_controller.rb`, odpowiedzialny za rejestracje nowych użytkowników.
Widok `new.slim` umieszczamy w katalogu `app/views/registrations`. Nie zapomnij dodać odpowiednich wpisówch do `routes.rb`

#### 1.3
Stwórz railowsy kontroler `sessions_controller.rb`, odpowiedzialny za logowanie i wylogowywaie użytkowników.
Użyj do tego celu modelu `User`, zmiennej `session`,  widok `new.slim` umieszczamy w katalogu `app/views/sessions`.
Nie zapomnij dodać odpowiednich wpisówch do `routes.rb`

#### 1.4
Zmodyfikuj `app/views/layouts/application.slim`, tak aby do Angularowej aplikacji wpuszczać tylko zalogowanych użytkowników.

Tip: aby mieć dostęp do zdefiniowanych metod z kontrolera w widoku użyj metody `helper_method`.

# Zadanie 2.

#### 2.1
Zrefaktoruj kontroller `api/digs_controller.rb`, tak aby nowe obiekty typu `Dig` i `Comment` były przypisane do zalogowanego usera.
Użyj methody `current_user` oraz dostępnych asocjacji np. `current_user.digs.create(dig_params)`

#### 2.2
Zabezpiecz API przed niepowołanym dostępem z zewnątrz. Tylko zalogowani użytkownicy powinni mieć dostęp do `http://localhost:3000/api/digs`.

Tip: utwórz `before_action` gdzie sprawdzasz czy użytkownik jest zalogowany jeśli nie zwróć 403.
