class: center, middle

# Deployment

![deployment](http://www.extremetech.com/wp-content/uploads/2013/03/falcon-9-launch-640x353.jpg)

---

## Czym się wyróżnia środowisko produkcyjne?

- aplikacja pracuje na skompilowanych assetach. Pliki javascriptowe są łączone i kompresowane
w jednen plik application.js. Taki sam zabieg przechodzą pliki css.

- błędy działania aplikacji są zapisywane w logach, lecz nie są wyświetlane na interfejsie w momencie
wystąpienia (zmiast tego jest "bardziej przyjazny" komunikat).

- wykorzystywane są wszystkie gemy, które zostały zdefiniowane w grupie `:production` w Gemfile.

- włączone jest cachowanie klas (są one wczytywane tylko raz)

- aplikacja korzysta z docelowych kont / usług, przeznaczonych pod środowisko produkcyjne

---

## Gdzie stawiać środowisko produkcyjne?

- Własny serwer (posiadający rvm, bazę danych, itp.) - do deploymentu wykorzystywany gem `capistrano`

- Platformy chmurowe (usługi):

  - Heroku

  - OpenShift

  - EngineYard

  - ...

---

![heroku logo](http://blog.gauntface.co.uk/wp-content/uploads/2012/01/heroku-logo.png)

 > Platforma chmurowa stworzona w modelu PaaS (Platform as a Service) obsługująca kilka języków programowania.
 > Heroku jest jedną z pierwszych tego typu platform. Rozwijana była od czerwca 2007, kiedy to udostępniała
 > tylko język Ruby. Aktualnie obsługuje języki Java, Node.js, Scala, Clojure i Python oraz nieudokumentowany PHP.
 > Podstawowym systemem operacyjnym jest Debian lub bazujący na Debianie Ubuntu.

 .right[_Wikipedia_]

---

## Deployment aplikacji

1. Rejestrujemy się na heroku.com i dodajemy w niej swój klucz publiczny SSH

1. Tworzymy nową aplikację i dodajemy w niej bazę danych - addon o nazwie Heroku Postgres

1. W terminalu dodajemy nowy remote (zgodny z utworzonym na heroku) poleceniem:
`git remote add heroku git@heroku.com:twoj_projekt.git`

1. Modyfikujemy Gemfile
  - Dodajemy gem `heroku` do grupy development
  - Dodajemy gemy `pg` i `rails_12factor` do grupy production
  - Przesuwamy gem `sqlite3` do grupy development i test

1. Wykonujemy `bundle install`

---

## Deployment aplikacji

1. Ustawiamy `config.secret_key = ENV['DEVISE_SECRET']` w config/devise.rb

1. Definiujemy `DEVISE_SECRET` na heroku poleceniem `heroku config:add DEVISE_SECRET=losowy_token`

1. Pushujemy zmiany do repozytorium poleceniem `git push origin master`

1. Robimy deployment aplikacji poleceniem `git push heroku master`

1. Wykonujemy migracje poleceniem `heroku run rake db:migrate`

---
class: center, middle

## It's alive!

![alive](http://stemworksblog.files.wordpress.com/2013/10/its_alive1.gif)
