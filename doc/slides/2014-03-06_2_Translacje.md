class: center, middle

# Tłumaczenia w Rails

![I18nt](https://nugetgallery.blob.core.windows.net/icons/Localization.i18N.ASP.NET.0.0.0.1.png)

---

## Po co tłumaczenia?

* pozwalają na... wprowadzanie w aplikacji wielu języków
* pomagają utrzymać porządek, gdyż wszystkie teksty interfejsu są umieszczone
w czytelnych plikach *.yml
* pomagają generować komunikaty błędów, etykiety w formularzach itp.

---

## Jak korzystać?

1. Dodawanie klucza w pliku tłumaczeń
```yaml
en:
    save: 'Save'
    events:
      index:
        new_event: 'New Event'
```

2. Wykorzystanie w widoku
```
= t('events.index.new_email')
#lub
= t('new_email', scope: 'events.index')
```

---

## Jak korzystać szybciej w RubyMine?

.center[![RubyMine Inspector](http://blog.jetbrains.com/ruby/files/2009/08/quickfix.png)]

Inspektor RubyMine'a zaproponuje nam zmianę zwykłego stringa na tłumaczenie, gdy kursor klawiatury znajduje się
nad stringiem, a użytkownik skorzysta ze skrótu klawiszowego **Alt + Enter**.

---

## Interpolacje

1. Do wnętrza tłumaczeń możemy również interpolować inne łańcuchy znaków. Np. możemy zdefiniować powitanie:
```yaml
en:
    welcome: Witaj %{nazwa} w naszej aplikacji!
```

2. A następnie je wykorzystać:
```
= t('welcome', nazwa: 'Jerzy')
```

---

## Zlokalizowane widoki

Dla podstron składających się z dużej ilości tekstu, którego wprowadzenie w pliki tłumaczeń jest trudne lub
zmusza do zbyt obszernych wpisów, mamy możliwość wykorzystania localized views. Wtedy dla każdego języka
musimy przygotować osobny plik z tekstem w danym języku.

Zatem przykładowo zamiast wspólnego pliku `index.html.haml` dla wszystkich języków, możemy utworzyć pliki
`index.en.html.haml` oraz `index.pl.html.haml` by dostarczyć zarówno angielskiego, jaki i polskiego tłumaczenia.

---

## Tłumaczenia atrybutów i błędów

.center[![attribute locale](http://meier-online.com/blog/uploads/rails-fehlermeldungen-ersetzung400.png)]

Przykładowe tłumaczenia dla modelu:

* Nazwa modelu: `activerecord.models.user`
* Nazwa atrybutu email: `activerecord.attributes.user.email`
* Komunikat błędu na pusty email: `activerecord.errors.models.user.attributes.email.blank`

[Więcej informacji o definiowaniu własnych tłumaczeń](http://guides.rubyonrails.org/i18n.html#how-to-store-your-custom-translations)

---

## Zmiana języka

Można tego dokonać na dwa sposoby:

1. Zmienić na stałe w initializerach. Definiujemy np. w `config/initializers/locale.rb`
        I18n.default_locale = :pt

2. Zmienić na rządanie użytkownika. Definiujemy np. w `app/controllers/application_controller.rb`
        before_action :set_locale

        def set_locale
          I18n.locale = params[:locale] || I18n.default_locale
        end

---
class: center, middle

## Więcej informacji
[Rails Guides - i18n](http://guides.rubyonrails.org/i18n.html)

---

## Zadanie

**Na brązowy rubin:**
Przygotuj tłumaczenia dla tekstów zawartych w widokach oraz kontrolerach.

**Na srebrny rubin:**
Dodaj lub przygotuj tłumaczenia dla tekstów, generowanych przez gemy `kaminari` oraz `devise`. Poszukaj gotowych
rozwiązań.

**Na złoty rubin:**
Dodaj możliwość wyboru języka: polski lub angielski. Wybór niech będzie zapisywany w obiekcie `current_user`
(należy dodać odpowiednie pole dla modelu User poprzez migrację).
