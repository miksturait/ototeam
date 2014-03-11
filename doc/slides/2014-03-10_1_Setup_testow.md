class: center

# Setup środowiska testowego

![rspec title](http://cdn.memegenerator.net/instances/400x/9869549.jpg)

---

## Środowisko testowe

* Służy do wykonywania testów automatycznych.
* Posiada dedykowaną bazę danych (dostęp konfigurowany w `config/database.yml`).
* Powinno gwarantować jednakowe warunki podczas każdego wykonania

Przy wykonaniu zadań `rake` należy podać nazwę środowiska (domyślnie jest `development`). Na przykład:

```bash
RAILS_ENV=test rake db:migrate
```

---

## Rodzaje testów

* **Testy jednostkowe:** weryfikują rezultaty zawracane przez poszczególne metody (stosowane dla modeli).
* **Testy funkcjonalne:** weryfikują efekty uboczne wykonania różnych akcji (stosowane dla kontrolerów)
* **Testy integracyjne:** weryfikują rezultaty i efekty uboczne interakcji na wielu kontrolerach - najczęściej sprawdzają
czy ważne dla użytkownika czynności w aplikacji są wykonywalne.

---

## Konfiguracja testów

Do pisania testów możemy wykorzystać kilka gemów, np. `minitest`, `cucumber` lub `rspec`.

W przypadku korzystania z `rspec`, konfiguracja jest przychowywana w pliku `spec/spec_helper.rb`

 * ładuje dodatkowe biblioteki, które są potrzebne do testów
 * jest ładowany na początku każdego pliku z testami przez `require 'spec_helper'`

Gdy parametr `use_transactional_fixtures` jest ustawiony na `true`, to każdy test zostanie wykonany w transakcji
bazodanowej (zbiorze operacji na bazie danych), która jest wycofywana zaraz po wykonaniu testu. Dzięki temu testowa
baza danych będzie gotowa (czysta) do następnego testu.

---

## Generowanie danych

Do generowania danych testowych można wykorzystać Railsowe fixtures lub skorzystać np. z gemu `FactoryGirl`.
Ten drugi daje znacznie większe możliwości budowania obiektów, a w połączeniu z gemem `ffaker` pozwoli wygenerować
w miarę sensowne wartości atrybutów.

Przykład zdefiniowanej fabryki

    FactoryGirl.define do
      factory :event do
        state 'initial'
        name { Faker::Movie.title }
        description { Faker::Lorem.sentence }
        start_at { (rand(10) + 1).days.from_now }
        invite_from { start_at - 8.hours }
        invite_to { start_at - 2.hours }
        attendees_min_count { rand(5) }
        attendees_max_count { attendees_min_count + rand(5) }
        minutes_for_answer 60
        public_attendees_list false
      end
    end

---

## Uruchamianie testów

Testy można uruchomić na kilka sposób:

* `guard` który będzie automatycznie wykonywał testy przy zapisie plików
* `rspec spec` który wykona wszystkie testy z katalogu spec

Jeżli chcemy wykonać konkretny plik z testami to:

* podajemy ścieżkę do pliku, np. `rspec spec/models/user_spec.rb`
* dodajemy atrybut `:focus` do bloku z testem, a następnie wykonujemy `rspec spec`

        describe Event, :focus do
          subject { create(:event) }

          describe '#attendees_count' do
            its(:attendees_count) { should eql 0 }
          end
        end

---

## Zadanie

**Na brązowy rubin:**
Dodaj cechę (trait) dla fabryki `events`, która dodatkowo utworzy i ustawi creatora spotkania.
Przy pomocy tej cechy utwórz kilka dodatkowych spotkań w `db/seeds.rb`

**Na srebrny rubin:**
Utwórz fabrykę dziedziczącą z fabryki `events`, która będzie tworzyła eventy w przeszłości.
Przy pomocy tej cechy utwórz kilka dodatkowych spotkań z przeszłości w `db/seeds.rb`

**Na złoty rubin:**
Dodaj cechę (trait) dla fabryki `events`, która prócz utworzenia spotkania utworzy dwóch znajomych,
którzy są zaproszeni do tego spotkania. Wymagane będzie dodanie relacji wiele-do-wiele między spotkaniem a znajomym,
które dodatkowo przechowa informację o decyzji zaproszonego (np. pole state:string)

**UWAGA: po dokonaniu zmiany w fabryce należy w konsoli railsowej wykonać**
`FactoryGirl.reload`
**by zmiany zostały zastosowane.**
