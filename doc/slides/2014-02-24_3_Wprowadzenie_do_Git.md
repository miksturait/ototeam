class: middle
# Krótkie wprowadzenie do Git

![Git Logo](http://git-scm.com/images/logos/1color-orange-lightbg@2x.png)

---

## Czym jest Git?

Git to system kontroli wersji. Tak jak Subversion (SVN) wspomaga pracę
grupową nad jednym projektem, lecz:

- Git ma charakter rozproszony (użytkownicy tworzą kolny głównego repozytorium)
- Git pozwala na lokalną pracę z repozytorium, mając dostęp do pełnej historii commitów
- Git zaprojektowany by być szybszym

---

## Przykładowe tworzenie repozytorium

    mkdir moj_projekt
    cd moj_projekt
    git init
    touch readme.md
    git add readme.md
    git commit -m 'pierwszy commit'

---

## Pobieranie istniejącego repozytorium

    git clone git@github.com:miksturait/ototeam.git

- pobierane jest całe repozytorium
- dodawany jest origin remote
- ustawiana jest lokalna brach master

---

## Dokonywanie zmian

    git pull origin master
    touch nowy-plik.txt
    git add .
    git commit -m 'Dodano nowy-plik.txt'
    git push origin master

---

## Serwery Git

- własny (Git jest opensource + interfejs np. GitLab)
- GitHub
- BitBucket

Podczas zajęć będziemy korzystać z usługi **GitHub**, pozwalającej m.in. na komentowanie kodu,
tworzenie pull requestów, hostowanie wiki projektu, forkowanie projektów.

![GitHub Logo](http://andornagy.com/wp-content/uploads/2013/12/github-logo.png)

---

## RubyMine wspiera Git

Korzystając z **RubyMine** użytkownik może korzystać praktycznie ze wszystkich poleceń Gita
z poziomu GUI.

![RubyMine i Git](http://pivotallabs.com/wordpress/wp-content/uploads/2013/06/revert-vcs-operations-popup.png)

---
## Poznawanie Gita

Zachęcamy do zapoznania się z innymi funkcjami Gita.

- Nauka Gita w przeglądarce: http://try.github.com
- Darmowa książka **Pro Git**: http://git-scm.com/book


---
class: middle, center

## Czas zacząć działać!

---

## Zakładanie konta na GitHub

- Wchodzimy na http://github.com i wypełniamy formularz rejestracji, a potem aktywujemy konto.
- Otwieramy **Terminator** i Generujemy klucz SSH, który posłuży nam do automatycznej autentykacji.

        ssh-keygen -t rsa -C "twoj-adres-email@example.com"
        ssh-add ~/.ssh/id_rsa
- Otwieramy plik z kluczem publicznym i kopiujemy go do schowka

        gedit ~/.ssh/id_rsa.pub

---

## Zakładanie konta na GitHub

- Na GitHub wchodzimy do ustawień, SSH Keys i dodajemy wygenerowany klucz

![SSH klucz w GitHub](http://georgi-mitev.com/wp-content/uploads/github-ssh-keys3.png)

- Testujemy: ```ssh -T git@github.com```

---

class: center

#### Hi <nazwa użytkownika>! You've successfully authenticated, but GitHub does not provide shell access.

![GitHub Style](http://octodex.github.com/images/gangnamtocat.png)


