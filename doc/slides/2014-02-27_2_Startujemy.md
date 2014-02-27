class: center

## Stoi na stacji lokomotywa, Ciężka, ogromna i pot z niej spływa

![Lokomotywa](http://image.ceneo.pl/data/products/13269365/i-eichhorn-czerwona-lokomotywa-na-baterie-4963.jpg)

---

## Pobieranie projektu

W Terminatorze klonujemy projekt z repozytorim Git, a następnie wchodzimy
do katalogu z projektem.

    git clone git@github.com:miksturait/ototeam.git
    cd ototeam

Przy wejściu do katalogu projektu sprawdzane są przez RVM dwa pliki:
`.ruby-version` oraz `.ruby-gemset`. Pierwszy aktywuje nam podaną wersję Rubiego,
a drugi aktywuje (a gdy nie istnieje to tworzy) podany gemset.

---

## Instalacja gemów

Jeżeli wymagana wersja Ruby'ego nie jest zainstalowana, to możemy ją
zainstalować przez RVM. Przykładowa instalacja Ruby 2.1.1:

    rvm install 2.1.1

Gemset to grupa / kontener dla bibliotek, które są instalowane pod
konkretną wersją Ruby na potrzeby danego projektu. Wymagane biblioteki zawiera się
w pliku `Gemfile`. Aby zainstalować gemy, wystarczy użyć komendy:

    bundle install

---

## Konfiguracja bazy danych

Konfiguracja jest przechowywana w pliku `config/database.yml`. Jest to jeden
z plików, których nie powinno się przechowywać w repozytorium. Dobrą praktyką jest
za to przechowywanie przykładowego pliku np. `config/database.yml.example`.

    development:
      adapter:  postgresql
      host:     localhost
      encoding: unicode
      database: ototeam_development
      pool:     5
      username: ototeam
      password: tajne-przez-poufne

---

## Konfiguracja bazy danych

W naszym przypadku wystarczy skopiować plik przykładowy:

    cp config/database.yml.example config/database.yml

Ostatnim krokiem przed uruchomieniem aplikacji jest przygotowanie bazy danych.
Robimy to wykonując w Terminalu rake task:

    rake db:setup

---

## Uruchomienie serwera

Aplikację Railsową uruchamiamy poleceniem:

    rails s

Aplikcja będzie domyślnie dostępna pod adresem:

    http://localhost:3000

---

## Uruchomienie konsoli Railsowej

Prace nad modelami / obiektami aplikacji Railsowej wykonujemy w konsoli:

    rails c

Jeżeli dokonujemy zmian w kodzie, zmieniamy implementację modeli,
to musimy przeładować konsolę poleceniem:

    reload!

---

## Uruchomienie testów automatycznych

Każda dobra aplikacja Railsowa powinna posiadać testy automatyczne, które
możemy uruchomić komendą `rspec <katalog lub plik z testami>`. Aby uruchomić
wszystkie testy wykonujemy:

    rspec spec

---
class: middle, center

## Czy można chcieć coś więcej?

Zawsze ;) Wykonanie pewnych poleceń można zautomatyzować dzięki gemowi Guard.
Wykonując w Terminatorze polecenie `guard`

![Guard logo](http://photos3.meetupstatic.com/photos/event/1/4/3/e/event_213425182.jpeg)

---

## Korzystanie z Guarda

Oto co otrzymujemy:

- uruchomienie serwera railsowego, który jest restartowany, gdy zachodzą
zmiany w konfiguracji aplikacji
- uruchamiane są testy automatyczne powiązane z aktualnie modyfikowanym kodem
- instalowane są gemy, jeżeli jest modyfikowany `Gemfile`
- odświeżana jest strona z aplikacją w przeglądarce, gdy dokonujemy zmian
w widokach, stylach, translacjach.

Guarda można konfigurować poprzez plik `Guardfile`



