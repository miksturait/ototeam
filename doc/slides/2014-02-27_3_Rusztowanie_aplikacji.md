class: center, middle, inverse

# Architektura MVC

---

class: center, middle

![MVC Diagram](http://blog.ifuturz.com/wp-content/uploads/2013/03/railsmvc.png)

_http://blog.elliottheis.com/post/3461828705/explanation-of-mvc-ruby-on-rails_

---

# Rusztowanie zasobu

_...czyli `Resource Scaffolding` lub po prostu `scaffold(ing)`_

.small-image[![Scaffolding](http://www.redscaffolding.co.uk/images/scaffolding2L.JPG)]

---

# Rusztowanie zasobu

.with-margin[
```
rails g scaffold Post name:string description:text active:boolean
```
]

_rails, wygeneruj rusztowanie Post'a z nazwą (stringiem), opisem (tekstem) oraz flagą active (wartość logiczna true/false)_

---

# Routes

.with-margin[
.small-image[![Dispatcher](http://railroad.net/articles/railfanning/bct/media/BCT_DispatcherDesk_Large.jpg)]
]

.center[_http://railroad.net/articles/railfanning/bct/_]

---

.left-column[
## Zadania
]

.right-column[
### Tłumaczenie requestów / URLi na akcje kontrolera
### Generowanie URLi z poziomu kodu
]

---

.left-column[
## Zadania
## Listowanie
]

.right-column[
```
rake routes
```

```
  Prefix Verb   URI Pattern               Controller#Action
    posts GET    /posts(.:format)          posts#index
          POST   /posts(.:format)          posts#create
 new_post GET    /posts/new(.:format)      posts#new
edit_post GET    /posts/:id/edit(.:format) posts#edit
     post GET    /posts/:id(.:format)      posts#show
          PATCH  /posts/:id(.:format)      posts#update
          PUT    /posts/:id(.:format)      posts#update
          DELETE /posts/:id(.:format)      posts#destroy
   slides GET    /slides(.:format)         slides#index
    slide GET    /slides/:id(.:format)     slides#show
```
]


---

.left-column[
## Zadania
## Listowanie
## Domyślny route
]

.right-column[
```
Ototeam::Application.routes.draw do
  resources :posts
  root 'posts#index'
end
```
]

---

# Migracje

.with-margin[
.small-image[![Birds migration](http://backyardnaturalist.ca/wp-content/uploads/2011/06/migration1.jpg)]
]
.center[_http://backyardnaturalist.ca/?page_id=702_]


---

.left-column[
## Zadanie
]

.right-column[
## Opis zmian w bazie danych
]

---

.left-column[
## Zadanie
## Konstrukcja
]

.right-column[
```
class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end

# to to samo co

class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def down
    remove_table :posts
  end
end

```
]

---

.left-column[
## Zadanie
## Konstrukcja
## Zarządzanie
]

.right-column[
```
rake db:migrate # migruj zmiany
rake db:rollback # cofnij ostatnią migrację zmian

rake db:create # utwórz bazę danych
rake db:drop # usuń bazę danych
rake db:seed # wypełnij bazę danych wartościami domyślnymi
```
]

---

# Testy

.with-margin[
.small-image[![Walker](http://upload.wikimedia.org/wikipedia/en/4/4b/WalkerTitle.jpg)]
]
.center[_http://en.wikipedia.org/wiki/Walker,_Texas_Ranger_]

---

.left-column[
## Guard
]


### Wywoływanie: `guard` vs `rspec`

* guard - automatyczne wywoływanie po każdej zmianie
* rspec - ręczne wywoływanie gdy guard nie przetestował tego co chcieliśmy

### Framework: `rSpec` vs `UnitTest`

* kwestia gustu

---

# Widok

.with-margin[
.small-image[![View](http://hdwallpaper.freehdw.com/0002/nature-landscapes_hdwallpaper_beautiful-view_12343.jpg)]
]
.center[http://freehdw.com/wallpaper/beautiful-view-59478.html]

---

.left-column[
## ERB
]

.right-column[
```erb
<section class=”container”>
  <h1><%%= post.title %></h1>
  <h2><%%= post.subtitle %></h2>
  <div class=”content”>
    <%%= post.content %>
  </div>
</section>
```
]

---

.left-column[
## ERB
## HAML
]

.right-column[
```haml
%section.container
  %h1= post.title
  %h2= post.subtitle
  .content
    = post.content
```
]

---

# Kontroler

.with-margin[
.small-image[![Controller](http://cdn2-www.craveonline.com/assets/uploads/gallery/top-10-best-video-game-controller-of-all-time/snes_controller.jpg)]
]

---

.left-column[
## Zmienne instancji
]

.right-column[
```
class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
end
```
]


---

.left-column[
## Zmienne instancji
## Parametry
]

.right-column[
```
class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: 'Post created!'
    else
      render action: 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:name, :description)
  end
end

```
]

---

# Model

.with-margin[
.small-image[![Model](http://image.shutterstock.com/display_pic_with_logo/61753/61753,1238179515,1/stock-photo-female-photographer-with-male-model-27605065.jpg)]
]

---

.left-column[
## Zadania
]

.right-column[
### Kod związany z logiką biznesową
_na pewno nie ten, związany z prezentacją danych_

]

---

.left-column[
## Zadania
## Walidacja
]

.right-column[
### Kod związany z logiką biznesową
_na pewno nie ten, związany z prezentacją danych_

```
class Person < ActiveRecord::Base
    validates :name, presence: true
    validates :age, numericality: { greater_than: 0,
                                    only_integer: true }
end
```
]

---

.left-column[
## Co dalej?
]

.right-column[
### [rSpec](https://www.relishapp.com/rspec)
### [HAML](http://haml.info/)
### [Routing](http://guides.rubyonrails.org/routing.html)
### [Migracje](http://guides.rubyonrails.org/migrations.html)
### [Action Controller](http://guides.rubyonrails.org/action_controller_overview.html)
### [Walidacje modeli](http://guides.rubyonrails.org/active_record_validations.html)
]

---

## Zadanie domowe

**Na brązowy rubin:**

Dodaj rusztowania (scaffoldy) dla wydarzeń _(event)_ Grup _(group)_ i Znajomych _(friend)_. Grupę ma opisywać nazwa _(name)_ a znajomego nazwa _(name)_, adres email _(email)_ oraz numer telefonu _(phone)_.
Pola dla wydarzenia należy opracować na podstawie pliku znajdującego się w `/doc/wireframes/pages/new_event.png`

**Na srebrny rubin:**

Dodaj [walidację](http://guides.rubyonrails.org/active_record_validations.html) do utworzonych modeli. Zarówno grupa jak i znajomy muszą mieć ustawioną nazwę. Natomiast znajomy powininen mieć także ustawiony bądź telefon, bądź email lub też oba te pola.

**Na złoty rubin:**

Dodaj do projektu kod generujący kilka przykładowych eventów, znajomych i grup. Dobrym pomysłem na start będzie zapoznanie się z odpowiednim rozdziałem [Rails Guides](http://edgeguides.rubyonrails.org/migrations.html#migrations-and-seed-data)


