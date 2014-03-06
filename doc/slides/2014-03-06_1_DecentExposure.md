class: center, middle, inverse

## Refaktoryzacja kodu
# Decent Exposure

---

## Dlaczego Decent Exposure

### Convention over configuration + DRY
### Leniwe ładowanie...??? Lazy loading
### Zagnieżdżone resource'y

---
class: center, middle, inverse

## https://github.com/voxdolo/decent_exposure

---

## Zadanie domowe



**Na brązowy rubin:**

* Wyłącz mechanizm `strong_attributes`

```
# config/initializers/strong_parameters.rb
ActionController::Parameters.permit_all_parameters = true
```
* Użyj `decent_exposure` do refaktoryzacji kontrolerów


**Na srebrny rubin:**


* Użyj [mechanizmu zagnieżdżania](https://github.com/voxdolo/decent_exposure#scoping-your-object-queries) do filtrowania obiektów tylko dla obecnego użytkownika

**Na złoty rubin:**

* Przywróć mechanizm `strong_attributes`
* Nanieś [niezbędne zmiany w kontrolerach](https://github.com/voxdolo/decent_exposure#usage-with-rails-4-or-strong_parameters-plugin)

