# Skumaj to! 🐸

Apka do powtórek szkolnego materiału dla 4 klasy. Za każdą dobrą odpowiedź żabka dostaje muchę, a za każdy dobry dzień przychodzi nowa nagroda: rzecz do stawu, ubranko albo jesienna niespodzianka.

Powstała na prośbę mojej córki i na jej potrzeby, żeby powtarzanie materiału szkolnego było zabawą.

**Zagraj:** https://danusiowa.github.io/skumaj-to/

![Logowanie, start i runda na telefonie](docs/makiety-telefon-1.png)

## Co jest w środku

- **Rundy po 15 zadań.** Odpowiedź wpisuje się samodzielnie na klawiaturze apki (z cyframi albo z literami), więc klawiatura telefonu nie zasłania ekranu. Dobrze czy źle widać dopiero w podsumowaniu, razem z czasem.
- **Mądre losowanie.** Zadanie nie powtarza się w rundzie (3×7 i 7×3 liczą się jako jedno). Błędne wracają częściej, opanowane rzadziej.
- **Żabka i muchy.** Za każdą dobrą odpowiedź żabka dostaje muchę. Muchy się sumują, a żabka zawsze jest wesoła.
- **Nagrody za systematyczność.** Każdy dzień z rundą na co najmniej 12/15 przynosi nagrodę. Najpierw zapełnia się staw, potem garderoba żabki, potem jesienny staw (szczegóły niżej).
- **Sklepik.** Złapane muchy można wydać na sztuczki, przyjaciół i kolory żabki (szczegóły niżej).
- **Kalendarz.** Dla każdego tematu osobno. Widać serię, rekord, a po stuknięciu dnia rundy ze wszystkimi zadaniami.
- **Wymowa i dyktando.** W angielskich słówkach z rodziny po rundzie można odsłuchać wymowę, a w dyktandzie apka sama czyta słowa (głos wbudowany w urządzenie).
- **Skumane.** Opanowany temat można odłożyć do archiwum i w każdej chwili przywrócić.
- **Akcenty sezonowe.** Od października do Sylwestra żabka na ekranie głównym zmienia wygląd według daty (szczegóły niżej).
- **Działa wszędzie:** na telefonie, tablecie i komputerze. Można ją dodać do ekranu głównego jak zwykłą apkę.

## Jak wygląda

![Podsumowanie rundy, staw żabki i kalendarz](docs/makiety-telefon-2.png)

Na komputerze i tablecie kafelki układają się szerzej, cztery w rzędzie:

![Ekran startowy na komputerze](docs/makieta-komputer.png)

## Nagrody za systematyczność

Nagrodę daje **dzień** z co najmniej jedną rundą na 12/15 albo lepiej (kilka dobrych rund tego samego dnia to nadal jedna nagroda). Dni liczą się po kolei przez wszystkie etapy. Kolejny etap pojawia się dopiero wtedy, gdy poprzedni jest kompletny:

| Etap | Ile nagród | Co się zbiera |
|---|---|---|
| 1. Staw | 14 | Lilia, kwiatek, domek, trzciny, słoneczko, kamień, rybka, ważka, pomost, leżak, parasol, łódka, lampki, tęcza |
| 2. Garderoba | 15 | Czapka z pomponem, kalosze, szalik, okulary słoneczne, kapelusz słomkowy, plecak, muszka, parasolka, beret, trampki, okrągłe okulary, korale, peleryna, czapka kucharza, korona |
| 3. Jesienny staw | 14 | Wrzosy, liście, dynia, grzybki, latawiec, drzewo, wiewiórka, chmurka z deszczykiem, odlatujące ptaki, kasztany, kosz jabłek, jeżyk, łódka z liścia, strach na wróble |

- **Garderoba.** Z zebranych ubranek można w każdej chwili składać strój: stuknięcie zakłada albo zdejmuje rzecz, a „Zdejmij wszystko” rozbiera żabkę. Na każde miejsce (głowa, oczy, szyja, plecy, stopy, łapka) żabka nosi jedną rzecz. Dopóki nic nie zostanie zmienione, żabka nosi najnowsze ubranko na każde miejsce.
- **Gdzie widać strój.** W garderobie i na ekranie startowym. W letnim stawie żabka jest zawsze bez ubranek, a w jesiennym zawsze w żółtym kapeluszu od deszczu.
- **Stare komplety.** Po skończeniu pierwszego etapu nad sceną pojawiają się przyciski etapów (np. „Staw ✓”, „Garderoba 9/15”), więc każdy zebrany komplet można dalej oglądać.
- **Po wszystkim.** Gdy jesienny staw jest kompletny, każdy kolejny dobry dzień dosypuje na trawę liść albo kasztan.
- **Podsumowanie rundy** mówi, co przyszło („Nowe ubranko! Muszka”), a na końcu etapu, co będzie dalej.
- **Zapis stroju.** Strój zapisuje się w telefonie i w Supabase razem z ustawieniami (w kolumnie `archiwum` tabeli `ustawienia`, pod kluczem `_stroj`), więc baza nie potrzebuje zmian.

![Staw, garderoba i jesienny staw na telefonie](docs/makiety-nagrody.png)

Na komputerze i tablecie garderoba ma dwie kolumny: żabka po lewej, ubranka po prawej.

### Jak dodać nagrody

W `index.html`:

- rzeczy do letniego stawu są na liście `STAW`, do jesiennego na liście `JESIEN` (rysunek SVG w układzie sceny 360×320, `z` ustala, co jest z przodu, a `anim` dodaje lekki ruch),
- ubranka są na liście `UBRANKA`, a ich rysunki w `<defs>` na początku `<body>` (identyfikatory `ub-…`, w układzie rysunku żabki),
- kolejność etapów ustala lista `ETAPY`. Nowy etap (np. rodzina) to nowa pozycja na tej liście i ekran do niego w funkcji `staw()`.

Kolejność na liście to kolejność odblokowania, więc nowe rzeczy dopisuje się na końcu.

## Akcenty sezonowe

Tylko na ekranie głównym, włączają się same według daty. Rzeczy na żabce skaczą razem z nią, rzeczy obok niej podskakują, gdy ląduje, a przy „ogranicz ruch” zostaje tylko to, co nieruchome.

| Kiedy | Akcent |
|---|---|
| 1–24 października | Spadające liście, czasem jeden ląduje żabce na głowie i spada przy skoku |
| 25–31 października | Liście, halloweenowa dynia-lampion z migoczącą buzią i nietoperz nad nią |
| 1–2 listopada | Bez akcentu |
| 3 listopada 2026 | Walizka z naklejkami, „Jutro lecimy do Japonii!” |
| 4–15 listopada 2026 | Japonia: Fuji w tle, czerwone liście klonu, papierowy żuraw i japońskie powitanie dnia z tłumaczeniem; 11.11 z kotylionem, 15.11 (Shichi-Go-San) z cukierkiem chitose-ame |
| 16–30 listopada | Biało-czerwony kotylion, wstążki podfruwają przy skoku (w innych latach od 3 listopada) |
| 1–5 grudnia | Pierwszy śnieg, na głowie zbiera się śnieg, który żabka strząsa skokiem |
| 6 grudnia | Mikołajki: czapka Mikołaja i prezent |
| 7–23 grudnia | Śnieg i choinka z migającymi lampkami |
| 24–26 grudnia | Święta: choinka z gwiazdą, prezent, czapka Mikołaja |
| 27–31 grudnia | Sylwester: imprezowa czapeczka i konfetti przy każdym skoku |

Czapka sezonowa zastępuje na ekranie głównym czapkę z garderoby, a garderoba się nie zmienia. Podgląd dowolnego dnia: dopisz do adresu np. `?podglad=2026-12-24`. Kalendarz akcentów jest w `index.html`, w funkcji `akcent()`.

## Sklepik żabki

Czwarta zakładka w menu. Muchy (jedna za każdą dobrą odpowiedź) wydaje się w sklepiku na rzeczy dla żabki. Do wydania jest tyle much, ile złapano razem, minus ceny kupionych rzeczy.

| Dział | Rzeczy i ceny (w muchach) |
|---|---|
| Sztuczki | Wielki skok 30, Taniec 55, Piruet 70, Śpiew 85, Fikołek 105 |
| Przyjaciele | Żółwik 105, Biedronka 140, Motylek 175, Ślimak 210, Kaczuszka 245 |
| Kolory żabki | Zielona (od początku), Różowa 210, Błękitna 210, Złota 280, W kropki 350, Tęczowa 490 |

- Stuknięcie niekupionej rzeczy pyta „Kupić…?”, a gdy much za mało, mówi, ile jeszcze brakuje.
- Kupioną sztuczkę pokazuje się stuknięciem jej karty albo samej żabki. Naraz jest jeden przyjaciel (stuknięcie wybranego go chowa).
- Sztuczki i przyjaciele są tylko w sklepiku. **Wybrany kolor żabka nosi w całej apce** (start, staw, garderoba, logo).
- W sklepiku żabka jest bez ubranek z garderoby. Przy „ogranicz ruch” zostaje sam dymek, bez animacji.
- Zakupy zapisują się w telefonie i w Supabase razem z ustawieniami (w kolumnie `archiwum`, pod kluczem `_sklep`), więc baza nie potrzebuje zmian.
- Ceny i rzeczy są w `index.html` na listach `SK_TRIKI`, `SK_PRZYJACIELE` i `SK_KOLORY`.

## Tematy

| Przedmiot | Temat |
|---|---|
| Matematyka | Mnożenie do 100 |
| Matematyka | Dzielenie do 100 |
| Matematyka | Dzielenie z resztą do 100 (wynik i reszta w osobnych okienkach) |
| Angielski | Liczby do 100 (słowami) |
| Angielski | Rodzina |
| Angielski | Rodzina ze słuchu (dyktando: apka czyta słowo, wpisuje się, co słychać) |

### Jak dodać nowy temat

Tematy są w `index.html`, na liście `TEMATY`. Nowy temat to jeden obiekt:

```js
{
  id: "ang-kolory",                      // unikalny, nie zmieniać po dodaniu (po nim zapisują się wyniki)
  od: "2026-10-20",                      // dzień dodania tematu: wcześniejsze dni kalendarz pokazuje jako neutralne
  nazwa: "Angielski: kolory",            // "Przedmiot: temat"
  typ: "tekst",                          // "liczby" = klawiatura z cyframi, "tekst" = klawiatura z literami
  // reszta: true,                      // przy "liczby": dwa okienka, wynik i reszta (odp: "3 r. 2")
  polecenie: "Napisz po angielsku",
  tlo: "#80B0E8", napis: "#16324F",      // kolor kafelka i napisu
  wymowa: "en-GB",                       // opcjonalnie: głośniczki z wymową w podsumowaniu
  zadania(){
    return lista([
      ["czerwony", "red"],
      ["szary", "grey / gray"],          // kilka dobrych odpowiedzi rozdziela ukośnik
    ]);
  }
}
```

Temat potrzebuje co najmniej 15 zadań, żeby runda nie miała powtórek.

Na ekranie startowym tematy układają się w bloki przedmiotów (Matematyka, Angielski, Hiszpański…). Przedmiot to część nazwy przed dwukropkiem, więc nowy przedmiot wystarczy wpisać w nazwie tematu, a jego blok pojawi się sam.

## Logowanie i wyniki

- Konta są **tylko na zaproszenie**. Każdy zalogowany może zaprosić nową osobę przyciskiem „Zaproś” w nagłówku, który tworzy jednorazowy link. Link do ustawienia nowego hasła dla istniejącego konta może utworzyć tylko administratorka. Kod jest w części adresu po `#`, więc podgląd linku w WhatsAppie go nie zużyje.
- Wyniki zapisują się same: od razu w telefonie, a w tle w bazie Supabase. Bez internetu czekają i wysyłają się później.
- W bazie każdy widzi tylko swoje wyniki (RLS).

## Budowa

| Plik | Co to jest |
|---|---|
| `index.html` | Cała apka: wygląd, logika i zapis w jednym pliku |
| `manifest.json`, `ikona-*.png` | Ikona i nazwa po dodaniu do ekranu głównego |
| `supabase/migrations/01-wyniki.sql` | Tabele `rundy` i `ustawienia` z zabezpieczeniami |
| `supabase/functions/invite-link/` | Funkcja tworząca linki z zaproszeniem |
| `docs/brief-nowa-apka.md` | Opis mechaniki, gdyby powstawała podobna apka |

Strona jest na GitHub Pages (gałąź `main`, katalog główny). Każda zmiana w `main` trafia na stronę po minucie lub dwóch.

### Konfiguracja Supabase (jednorazowo)

1. Nowy projekt w Supabase (region w Europie).
2. W edytorze SQL uruchomić `supabase/migrations/01-wyniki.sql`.
3. W **Authentication** wyłączyć „Allow new users to sign up” i „Confirm email”, a konto administratorki dodać ręcznie.
4. Wdrożyć funkcję `invite-link` z wyłączonym „Verify JWT with legacy secret”.
5. W `index.html`, w obiekcie `SUPABASE`, wpisać Project URL i klucz **publishable**. Kluczy secret ani service_role nigdy nie wpisuje się do apki.
