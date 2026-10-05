# Skumaj to! 🐸

Apka do powtórek szkolnego materiału dla 4 klasy. Za każdą dobrą odpowiedź żabka dostaje muchę, a staw rośnie z każdym dobrym dniem.

**Zagraj:** https://danusiowa.github.io/skumaj-to/

![Logowanie, start i runda na telefonie](docs/makiety-telefon-1.png)

## Co jest w środku

- **Rundy po 15 zadań.** Odpowiedź wpisuje się samodzielnie na klawiaturze apki (z cyframi albo z literami), więc klawiatura telefonu nie zasłania ekranu. Dobrze czy źle widać dopiero w podsumowaniu, razem z czasem.
- **Mądre losowanie.** Zadanie nie powtarza się w rundzie (3×7 i 7×3 liczą się jako jedno). Błędne wracają częściej, opanowane rzadziej.
- **Żabka i muchy.** Za każdą dobrą odpowiedź żabka dostaje muchę. Muchy „trawią się” z dnia na dzień, więc bez ćwiczeń żabka chudnie i robi się śpiąca.
- **Staw.** Każdy dzień z rundą na co najmniej 12/15 dodaje do stawu nową rzecz: lilię, domek, łódkę, tęczę…
- **Kalendarz.** Dla każdego tematu osobno. Widać serię, rekord, a po stuknięciu dnia rundy ze wszystkimi zadaniami.
- **Wymowa i dyktando.** W angielskich słówkach z rodziny po rundzie można odsłuchać wymowę, a w dyktandzie apka sama czyta słowa (głos wbudowany w urządzenie).
- **Skumane.** Opanowany temat można odłożyć do archiwum i w każdej chwili przywrócić.
- **Działa wszędzie:** na telefonie, tablecie i komputerze. Można ją dodać do ekranu głównego jak zwykłą apkę.

## Jak wygląda

![Podsumowanie rundy, staw żabki i kalendarz](docs/makiety-telefon-2.png)

Na komputerze i tablecie kafelki układają się szerzej, cztery w rzędzie:

![Ekran startowy na komputerze](docs/makieta-komputer.png)

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
