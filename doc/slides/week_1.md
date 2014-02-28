# Pierwszy tydzień

### O czym warto pamiętać

_chaotyczne zestawienie ważnych aspektów poruszonych na ostatnich dwóch spotkaniach_

* Dostarczona maszyna wirtualna ma wszystko poinstalowane (włącznie z rubym) - nie trzeba nic instalować na własną rękę
* Przed developmentem należy wygenerować sobie klucz SSH i załadować go na GitHub
* Pracujemy na własnych forkach repozytorium
* Pamiętajcie, że slajdy z kolejnych wykładów pojawiają się na główym repozytorium (miksturait/ototeam) a nie na waszych forkach
* By uruchomić aplikację musimy utworzyć plik `database.yml` w katalogu `/config` - przykładowy plik do skopiowania znajduje się już w tym katalogu (`database.yml.example`)
* Bazę migrujemy (zmiany określone w migracjach _"aplikujemy"_ na bazę) poprzez `rake db:migrate`
    * Jeśli migracja coś nam się rzuca że "relation already exists" to najprościej jest najpierw usunąć bazę poprzez `rake db:drop`
* Serwer uruchamiamy z konsoli: bądź poprzez komendę `rails s` bądź komendę `guard`
* Z `guard`a wychodzimy wpisując `exit`
* Uważajmy na literówki - były one przyczyną większości problemów na ostanich warsztatach
* Bardzo pomocne jest przeglądanie poczynionych zmian (podsumowanie poprzez wywołanie `alt-2`)
* Jeśli coś sobie wygenerujemy podczas wykładu, to dobrym pomysłem jest usunięcie tego przed właściwym developmentem
    * Pamiętajmym, że nie zawsze generowane są wyłączenie nowe pliki - mogą być także modyfikowane istniejące (np. `config/routes.rb`)
* Generowanie rusztowań odbywa się poprzez wywołanie `rails g scaffold nazwa_modelu pole_1:string pole_2:integer pole_3:boolean pole_4:datetime`
    * pamiętamy o nazywaniu pól poprzez snake case, czyli nie `jakasNazwa` lub `JakasNazwa` tylko `jakas_nazwa` - konwencje w ruby są ważne
* Nie używamy polskich nazw w kodzie. Ograniczamy skróty do minimum - preferujemy pełne nazwy zmiennych, metod... wszystkiego. Kod powinien być ekspresyjny.
* Wygenerowane automatycznie routy (ścieżki / URL'e) możemy podglądnąć poprzez komendę `rake routes`
* Route domyślny ustawiamy w pliku `config/routes.rb` poprzez `root 'nazwa_resourcea#nazwa_akcji'` np `root 'posts#index'`
* Szlifujemy angielski - niestety większość dokumetacji jest w tym języku
* Warunkowe wywoływanie migracji realizujemy poprzez dodanie parametru `if:`, np. `if: ->{ jakis_warunek }`
* W pliku `seeds.rb` nie tworzymy klas, jeśli nie potrzeba. Wystarczą tam czyste skrypty ruby.
* Jak czytać komunikaty o błędach
    * [z przeglądarki](https://www.dropbox.com/s/pjomzxm3b8rlock/Screenshot%202014-02-28%2009.30.45.png)
    * [z konsoli](https://www.dropbox.com/s/athfnpoaj330986/Screenshot%202014-02-28%2009.33.56.png)
* Jeśli chcecie oglądać slajdy z zajęć tak jak są prezentowane przez nas, to odpalcie sobie serwer i wejdźcie na `localhost:3000/slides`
* Jeśli interesuje was jak powstawała krok po kroku aplikacja bazowa którą rozwijacie, zaglądnijcie na listę commitów -> https://github.com/miksturait/ototeam/commits/master
