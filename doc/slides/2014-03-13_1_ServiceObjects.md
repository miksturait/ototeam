class: center, middle, inverse

# ServiceObjects

---

## Dlaczego stosujemy SO

### Single Responsibility Principle
### Izolacja i prędkość testów

---

## Kiedy stosujemy SO

### Callback dotyka innej klasy
### Procesy / Procedury / Ciągi zdarzeń

---

## Jak pisać?

```
class User < ActiveRecord::Base
  #...
  after_create :create_own_profile, :send_welcome_email

  def send_welcome_email
    #...
  end
end

class RegistrationsController < ApplicationController
  #...

  def create
    if user.save
      redirect_to user, notice: t('user.create.success')
    else
      render action: 'new'
    end
  end
end
```

---

## Jak pisać?

```
class User < ActiveRecord::Base
  #...
end

class UserCreator
  attr_reader :user

  def initialize(params)
    @user = User.new(params[:user] || {})
  end

  def save
    if user.save
      create_profile
      send_welcome_email
    end
  end

  private

  def create_profile
    user.create_own_profile
  end

  def send_welcome_email
    #...
  end
end

```

---

## Jak pisać?

```
class RegistrationsController < ApplicationController
  #...
  expose(:user_creator) { UserCreator.new(params) }

  def create
    if user_creator.save
      redirect_to user_creator.user, notice: t('user.create.success')
    else
      render action: 'new'
    end
  end
end
```

---

# Źródła informacji

## [Interaktory - brakująca część Railsów](http://eng.joingrouper.com/blog/2014/03/03/rails-the-missing-parts-interactors?utm_source=rubyweekly&utm_medium=email)
## [7 sposobów na odchudzenie modeli](http://blog.codeclimate.com/blog/2012/10/17/7-ways-to-decompose-fat-activerecord-models/)

---

## Zadanie (pamiętajcie o testach!)

**Na brązowy rubin:**

Utwórz usługę `GroupCreator` dodającą wszystkich obecnych znajomych automatycznie do samej siebie zaraz po utworzeniu.

**Na srebrny rubin:**

Zmodyfikuj usługę `GroupCreator` tak, by można było warunkowo wyłączyć automatyczne dodawanie wszystkich znajomych. Od strony użytkownika powinien to być checkbox "Dodaj moich wszystkich znajomych do tej grupy" na ekranie tworzenia grupy.

**Na złoty rubin:**

Utwórz usługę `EventDestroyer`. Ma ona odpowiadać za usuwanie eventów: ustawienie pola `state` na 'cancelled' oraz wysłanie wiadomości "Event [nazwa] został właśnie odwołany" do wszystkich zaproszonych uczestników. Wysłanie wiadomości można zasymulować wywołaniem `puts`

