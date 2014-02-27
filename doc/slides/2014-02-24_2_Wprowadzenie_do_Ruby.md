class: center

# Krótkie wprowadzenie do Ruby

![Ruby](http://iwanttolearnruby.com/images/ruby-style-guide.gif)

---

## Czym jest Ruby?

https://www.ruby-lang.org/pl/

_"Dynamiczny język programowania skupiający się na prostocie i wydajności.
Ma elegancką składnię, którą czyta się naturalnie i jest łatwa w zapisie."_

---

class: monokai

# Podstawowe typy

```ruby
1000000, 1_000_000 # Liczby całkowite
1.5 # Liczby zmiennoprzecinkowe
'a', ?a # Znaki
'abc', "abc", %{abc}, %Q[abc], %q[abc] # Ciągi znaków
[1,2] # Tablice
['abc', 'def'], %w(abc def) # Tablice stringów
:abc # Symbole
[:abc, :cde], %i(abc cde) # Tablice symboli
{a: 1, b: 2}, {'a' => 1, 'b' => 2} # Tablice asocjacyjne
/[a-z]*/ # Wyrażenia regularne
false, true # Wartości logiczne
nil # nic ;)
# komentarze
```

---

## Klasy i obiekty - podstawy

### Definiowanie klas
_dyrektywa `class`_
### Tworzenie obiektów
_metoda `new`_
### Konstruktor
_metoda `initialize`_

---

## Klasy i obiekty - zmienne

* nazewnictwo
    * suffixy `?` oraz `!`
* lokalne
    * _snake\_case_
* instancji
    * _prefix `@`_
* klasowe
    * _prefix `@@`_
* globalne
    * _prefix `$`_
* stałe
    * _CamelCase_

---

## Klasy i obiekty - metody

### Metody instancji
_dyrektywa `def`_
### Metody klasowe
_dyrektywa `def self.`_
### Atrybuty metod
_zwykłe, nazwane, nieokreślone, hashe oraz domyślne_
### Dostępność
_`public`, `private`, `protected`_

---

## Klasy i obiekty - cd.

### Makra
_na przykładzie `attr_accessor`_
### Dziedziczenie
_operator `<`_
### Moduły (mixiny)
_dyrektywy `include` oraz `extend`_

---

## Najważniejsze cechy i konstrukcje języka

### Wszystko jest obiektem
_nawet prymitywy typu `nil`, `true` czy `false`. Co więcej klasy także są obiektami!_
### Wszystko ma wartość
_nawet wyrażenia logiczne czy iteratory_

---

## Najważniejsze cechy i konstrukcje języka

### Wyrażenia logiczne
_`if/elsif/else`, `case/when/then/else`, trójargumentowy `if`_
### Iteratory i domknięcia
_na przykładzie `times`, `each`, `map`_

---

## Najważniejsze cechy i konstrukcje języka

### Obsługa wyjątków
_`throw/catch`, `raise/begin/rescue/ensure`_
### Procedury
_`->(){}`, `Proc.new(){}`, `lambda{}`

---

## Zadanie domowe

* http://tryruby.org/
* http://www.codecademy.com/tracks/ruby
* https://www.ruby-lang.org/pl/about/
* https://www.ruby-lang.org/pl/documentation/ruby-from-other-languages/
