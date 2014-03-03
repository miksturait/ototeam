class: center, middle

# Korzystanie z gemów

Czyli jak nie wymyślać koła od nowa...

![Korzystanie z gemów](http://revolveapp.com/Portals/218018/images/re-invent-the-wheel-small.png)

---

## Czym jest gem?

Gem to program lub biblioteka napisana w języku Ruby, zaprojektowana do rozwiązywania
konkretnego problemu / rozszerzania istniejących funkcjonalności. Takie biblioteki
są w 99% przypadków udostępniane na licencjach OpenSource'owych.

Zatem zanim zaczniemy implementować daną funkcjonalność, to sprawdźmy
czy ktoś już nie pracował nad danym problemem i udostępnił rozwiązanie.

---

## Źródła gemów

- [RubyGems.org](http://rubygems.com)
- [Github.com](http://github.com)
- repozytorium online
- katalog na dysku zawierający gem

![RubyGem](https://marcelo.juntadados.org/system/images/91/original/RubyGems.png)

---

## Instalowanie gema

Można to zrobić na dwa sposoby:

1. Możemy zainstalować gem bez dodawania go do pliku `Gemfile` poprzez użycie komendy

        gem install <nazwa_gema>

2. Możemy dodać nowy wpis do pliku `Gemfile`, który będzie definiował także wersję
gema i jego źródło (domyślnie źródłem jest rubygems.org)

        gem '<nazwa_gema>', '<wersja_gema>'

---

## Korzystanie z gema: simple_form

Zakładając, że mamy już utworzony formularz dla tworzenia nowego spotkania,
postaramy się teraz go uprościć i dać mu więcej możliwości.

W tym celu zainstalujmy gem `simple_form` dodając stosowny wpis w pliku `Gemfile`

    gem 'simple_form', '3.0.1'

Jeżeli mamy uruchomionego Guarda, to instalacja rozpocznie się automatycznie.
Jeżeli nie, to należy w terminalu wykonać:

    bundle install

---

## Korzystanie z gema: simple_form

Następnie należy sprawdzić czy gem nie wymaga jakichś dodatkowych działań
(np. konfiguracji) oraz jak z niego należy korzystać. Informacje te najczęściej
znajdują się w pliku `Readme`, który jest łatwo dostępny
w [repozytorium gema](https://github.com/plataformatec/simple_form).

Tam dowiadujemy się, że `simple_form` wymaga jeszcze wygenerowania pliku
konfiguracyjnego poprzez komendę:

    rails generate simple_form:install --bootstrap

---

## Korzystanie z gema: simple_form

Dodatkowo, by wykorzystać stylowanie dostarczane przez Bootstrap 3,
[zmieńmy konfgurację simple_form_bootstrap.rb](https://gist.github.com/tbprojects/a50f50e6dc04a0a5e02a)

W widoku zawierającym formularz (np. `_form.html.haml`) wprowadzamy następujące zmiany:

- zamieniamy `form_for` na `simple_form_for`
- zamieniamy istniejące pola na np. `f.input :name`

Po zmianach całość będzie wyglądała tak samo jak przed zmianą, a kod został znacznie uproszczony.
`simple_form` oferuje możliwość definiowania placeholderów, podpowiedzi, komunikatów z błędami i wiele innych -
jest dużo bardziej elastycznym rozwiązaniem niż te podstawowe, dostarczane w Railsach.

---

## Źródła informacji o gemach

Google... a także serwisy typu [The Ruby Toolbox](https://www.ruby-toolbox.com/),
które oferują pomocną wyszukiwarkę oraz kategoryzowanie gemów. Szukanie wśród
repozytoriów Githuba też nie jest złym pomysłem.

![RubyToolbox screen](http://www.rubyinside.com/wp-content/uploads/2011/10/rubytoolbox.gif)

---

## Zadanie domowe

Na podstronie `/events` powinna znajdować się już tabelka z listą spotkań. Początkowo
użytkownicy aplikacji będą mieli w tej tabelce zaledwie kilka pozycji. Lecz po pewnym
czasie liczba spotkań może wzrosnąć do dziesiątek, a może nawet setek. Ładowanie
wszystkich danych będzie zajmować dużo czasu, a sama aplikacja może zacząć działać
wolniej.

.center[
### Co można z tym zrobić?
]

---

## Zadanie domowe

**Na brązowy rubin:**
Dodaj stronicowanie wyników tak, by na ekranie było nie więcej niż 10 spotkań.

**Na srebrny rubin:**
Dodaj wyszukiwanie spotkań wg nazwy, opisu i daty rozpoczęcia

**Na złoty rubin:**
* Zainstaluj i skonfiguruj gem Devise - aplikacja powinna umożliwiać rejestrację
* Strony events, friends i groups powinny wymagać zalogowania się do aplikacji

Do implementacji powyższych funkcjonalności możesz użyć gemów `kaminari` i `ransack`
lub wykorzystać inny znaleziony gem ([The Ruby Toolbox](https://www.ruby-toolbox.com/)).
