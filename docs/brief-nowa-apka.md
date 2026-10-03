# Nowa apka do nauki dla młodszej córki (klasy 1–3): brief na start

Ta apka ma być osobnym projektem, zbudowanym na wzór **Skumaj to!**
(repo: https://github.com/danusiowa/skumaj-to). Mechanika jest ta sama, ale nazwa, maskotka, kolory, repo i baza są nowe.

## Dla kogo
- Córka w klasach 1–3. Teksty krótkie, proste, czytelne, duże przyciski.
- Humor ciepły i zabawny, **bez sarkazmu**.
- Tematy będą dopisywane na bieżąco w rozmowach z Claude (w kodzie, nie w apce).

## Motyw do wyboru (zaproponowane)
1. **Jeżyk Wiedzyk**: jeżyk zbiera jabłka na kolce, rośnie sad (drzewko, domek z liści, grzybki, wiewiórka). Jesienne kolory.
2. **Bzyk! Pszczółka**: krople miodu za dobre odpowiedzi, zapełnia się plaster i rośnie łąka. Słoneczne kolory.
3. **Dino Odkrywca**: dinozaurek wykopuje skamieliny, rośnie dżungla (paprocie, wulkan, jajka z kolegami). Zielono-piaskowe kolory.

## Mechanika do skopiowania ze Skumaj to!
- **Ekran startowy**: powitanie z animowaną maskotką (oddycha, podskakuje, ma cień pod nogami, czasem coś łapie), kafelki tematów „PRZEDMIOT / Temat” z % i gwiazdkami. Po stuknięciu kafelka do wyboru „Zacznij ▶” albo „Skumane ✓” (archiwum). Sekcja z odłożonymi tematami i „Przywróć do ćwiczeń”.
- **Runda**: 15 zadań, odpowiedź wpisywana samodzielnie (klawiatura z cyframi albo pole tekstowe). Bez informacji dobrze/źle w trakcie. Pasek postępu, przycisk „✕ Przerwij” z potwierdzeniem, czas pauzuje się, gdy apka jest w tle.
- **Dobór zadań**: bez powtórek w rundzie (także odwrotności, np. 3×7 i 7×3). Błędne wracają częściej, opanowane (3× dobrze z rzędu) rzadziej, łatwe o połowę rzadziej, a zrobione dobrze w ostatniej rundzie prawie nie wracają od razu.
- **Podsumowanie** dopiero na końcu: wynik X/15, czas (z porównaniem do poprzedniej rundy), średnio na zadanie, lista błędów (pierwsze 4 + „Pokaż wszystkie”), przyciski „Popraw błędy”, „Nowa runda”, „Wróć do menu”. Zabawne, rotujące powiadomienia (bez powtórek) po zaliczeniu albo niezaliczeniu.
- **Nagrody**:
  - punkty za każdą dobrą odpowiedź (w Skumaj to! muchy) karmią maskotkę, która jest najedzona albo głodna/śpiąca w zależności od ostatnich dni (punkty „trawią się” ~40% dziennie);
  - **scena** (w Skumaj to! staw): 1 nowa rzecz za każdy dzień z rundą ≥ 12/15. Po skompletowaniu dosadzają się drobiazgi. Elementy w stylu doodle (kontur długopisem + kolor „zakreślaczem” przesunięty o 2–3 px), lekkie animacje, nic nie lewituje, na trawie są cienie.
- **Kalendarz**: pigułki z wyborem tematu (bez widoku „wszystkie”), dni z ćwiczeniem w kolorze, dni bez na różowo, dni przed pierwszą rundą neutralne. Seria, rekord, „w tym miesiącu”. Po stuknięciu dnia rundy tego dnia z rozwijaną listą zadań (✓ / ✗ wpisane).
- **Loader**: maskotka w ruchu + zabawny napis w innym kolorze niż maskotka.
- **Logowanie (Supabase)**: konta tylko na zaproszenie. Administratorka (danusiowa@gmail.com) ma w nagłówku przycisk „Zaproś”, który tworzy jednorazowy link `#zaproszenie=…` (Edge Function `invite-link`, kod jest po #, żeby podgląd w WhatsAppie go nie zużył). Ekran ustawiania hasła, z powrotem do niego, jeśli ktoś go przerwał. Maskotka zamyka oczy przy wpisywaniu hasła. Przycisk „Wyloguj” w nagłówku, jedno kliknięcie, bez potwierdzenia.
- **Zapis**: od razu w telefonie (localStorage) i w tle w Supabase (tabele `rundy`, `ustawienia`, RLS „każdy widzi swoje”). Bez internetu czeka i wysyła później. Cały zapis jest w jednym module.
- **Widok**: telefon (od 360 px) i komputer (szerszy układ, kafelki 3–4 w rzędzie, zadanie obok klawiatury). Animacje wyłączają się przy „ogranicz ruch”.
- **Czcionki**: czytelne, „szkolne” (w Skumaj to!: Playpen Sans w nagłówkach + Andika w tekście).

## Wdrożenie (jak w Skumaj to!)
1. Nowe repo na GitHubie (np. `danusiowa/<nazwa>`). Dodać je do uprawnień aplikacji Claude na GitHubie i włączyć GitHub Pages (main, /root).
2. Nowy projekt w Supabase (region Europe, Data API: tak, Automatically expose new tables: nie, automatic RLS: tak), SQL z `supabase/migrations/01-wyniki.sql`, w Auth wyłączone „Allow new users to sign up” i „Confirm email”, konto administratorki dodane ręcznie, Edge Function `invite-link` z wyłączonym „Verify JWT with legacy secret” (podmienić APP_URL i ALLOWED_ORIGINS).
3. Do apki wpisać Project URL i klucz publishable (nigdy secret/service_role).

## Zasady pracy
- **Nigdy nie dodawać „Claude” w commitach, ich opisach ani nazwach.** Autor commitów: danusiowa.
- Teksty w apce po polsku, zabawne, ciepłe, bez sarkazmu.
- Po zmianach: wysłać do repo i pokazać zrzut ekranu z telefonu.
