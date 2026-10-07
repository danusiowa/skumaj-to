# Sklepik żabki: brief dla Claude Design

Zaprojektuj nowy ekran **„Sklepik”** w istniejącej apce do nauki **Skumaj to!**. Apka jest dla dziewczynki w 4 klasie. Teksty mają być po polsku, krótkie, ciepłe i zabawne, **bez sarkazmu**.

## Kontekst
- Za każdą dobrą odpowiedź w ćwiczeniach dziecko dostaje **muchę**. Muchy się sumują.
- Sklepik daje muchom cel: wydaje się je na rzeczy dla żabki (maskotki apki).
- Sklepik jest **osobną, czwartą zakładką** w dolnym menu: Ćwiczę · Staw/Garderoba · **Sklepik** · Kalendarz.
- To, co kupione, widać **tylko w sklepiku**. Żabka na ekranie głównym i w innych nagrodach (staw, garderoba) się nie zmienia.
- Sklepik nie zastępuje nagród za systematyczność: rzeczy za dobre dni (staw, ubranka) nadal przychodzą osobno i nie da się ich kupić.

## Styl (jak w reszcie apki)
- **Doodle z zeszytu**: kontur jak długopisem (#008471, ok. 2,5 px, zaokrąglone końce) i kolor jak zakreślaczem, przesunięty o 2–3 px względem konturu. Nic nie lewituje, na ziemi są cienie.
- **Kolory**: kartka #FFF8EE, staw (główny ciemny) #008471, zakreślacz #D6D35F, słonko #F4D242, piwonia #FFC0C0, pomidor #C45F3F, lawenda #D1CAEA, niebo #80B0E8, guma #F29CC3, rzęsa #898E46, linie #E8DCCB, szary tekst #5E6B57.
- **Czcionki**: Playpen Sans (nagłówki, grube), Andika (tekst).
- Zaokrąglone karty (16–24 px), duże przyciski, jeden jasny motyw.
- **Żabka**: żółtozielona (#D6D35F), duże oczy, różowe policzki, uśmiech, zawsze wesoła. Nosi strój z garderoby (np. kapelusz, okulary, szalik, kalosze).

## Układ ekranu (telefon, od 360 px)
1. Nagłówek apki (zielony pasek z logo żabki).
2. Tytuł **„Sklepik żabki”**.
3. **Scena sklepiku**: markiza w różowo-żółte pasy u góry, lawendowe tło za żabką, trawa na dole. Pośrodku żabka w wybranym kolorze, obok wybrany przyjaciel. Nad żabką pojawia się dymek z tekstem (np. przy sztuczce).
4. **Portfel** (ciemnozielony pasek): duża liczba „107 much do wydania” z ikonką muchy, a obok mniejszym drukiem „złapane razem: 247”.
5. Trzy działy, każdy z nagłówkiem, jednym zdaniem opisu i siatką kart po 3 w rzędzie:
   - **Sztuczki**: „Stuknij kupioną sztuczkę albo żabkę, a żabka ją pokaże.”
   - **Przyjaciele**: „Jeden przyjaciel naraz dotrzymuje żabce towarzystwa.”
   - **Kolory żabki**: „Nowy kolor żabka nosi tylko w sklepiku.”
6. Dolne menu z 4 zakładkami (aktywna: Sklepik, ikonka markizy sklepu).

**Komputer** (od 760 px): dwie kolumny. Po lewej scena i portfel (przyklejone przy przewijaniu), po prawej działy.

## Rzeczy i ceny (w muchach)
| Dział | Rzecz | Cena | Co robi |
|---|---|---|---|
| Sztuczki | Wielki skok | 40 | Żabka wyskakuje wysoko, dymek „Hop! Prawie do chmur!” |
| Sztuczki | Taniec | 80 | Kołysanie i podskoki, „Tańczymy kum-kum!” |
| Sztuczki | Piruet | 100 | Obrót w miejscu, „Kręcę się jak bączek!” |
| Sztuczki | Śpiew | 120 | Kołysanie i ulatujące nutki, „La la kum! La la kwa!” |
| Sztuczki | Fikołek | 150 | Salto, „Fikołek! Ale mi się kręci w głowie!” |
| Przyjaciele | Balonik | 150 | Czerwony balonik na sznurku, kołysze się |
| Przyjaciele | Biedronka | 200 | Siedzi na trawie obok żabki |
| Przyjaciele | Motylek | 250 | Fruwa nad trawą |
| Przyjaciele | Ślimak | 300 | Różowa muszla, siedzi na trawie |
| Przyjaciele | Kaczuszka | 350 | Żółta, siedzi na trawie |
| Kolory | Zielona | 0 | Domyślna, zawsze „Twoje” |
| Kolory | Różowa | 300 | |
| Kolory | Błękitna | 300 | |
| Kolory | Złota | 400 | |
| Kolory | W kropki | 500 | Zielona w różowe i niebieskie kropki |
| Kolory | Tęczowa | 700 | Pionowy gradient różowy → żółty → zielony → niebieski → lawenda |

Za jedną rundę dziecko dostaje ok. 10–14 much: pierwsza sztuczka wypada po 3–4 rundach, tęczowa żabka to cel na kilka tygodni.

## Karta rzeczy: stany
Każda karta to ikonka, nazwa i plakietka na dole.
- **Do kupienia, stać ją**: plakietka w kolorze zakreślacza z muchą i ceną.
- **Za droga**: wyblakła ikonka, szara plakietka z ceną.
- **Kupiona sztuczka**: plakietka z obwódką „Pokaż ▶”.
- **Kupiony przyjaciel/kolor**: plakietka z obwódką „Twoje”.
- **Wybrany przyjaciel/kolor**: gruba zielona ramka, jasnozielone tło, ciemna plakietka „Wybrane ✓”.

## Zachowanie
- **Stuknięcie niekupionej rzeczy** otwiera pod siatką działu żółty pasek z pytaniem „Kupić „Taniec” za 80 much?” i przyciskami „Kupuję!” oraz „Jeszcze nie”.
- **Gdy much za mało**, pojawia się różowy pasek „Brakuje jeszcze 37 much. Każda dobra odpowiedź to jedna mucha!” i przycisk „Dobrze”.
- **Po zakupie**: sztuczka od razu się odgrywa, przyjaciel pojawia się na scenie („Mam nowego przyjaciela!”), a kolor od razu się zmienia („Jak mi w tym kolorze?”).
- **Stuknięcie kupionej sztuczki** albo żabki odgrywa sztuczkę (żabka bez sztuczek mówi tylko „Kum kum!” lub coś podobnego).
- **Przyjaciel**: stuknięcie wybranego chowa go, a stuknięcie innego go zamienia. Naraz jest jeden.
- Nie ma kar ani rzeczy na czas, a zakupów nic nie odbiera.
- Przy ustawieniu „ogranicz ruch” animacje się wyłączają i zostaje sam dymek.

## Do zaprojektowania
1. Ekran sklepiku na telefonie: stan startowy (coś kupione, coś za drogie).
2. Ten sam ekran z otwartym pytaniem o zakup.
3. Ten sam ekran z pytaniem „brakuje much”.
4. Scena w trakcie sztuczki (z dymkiem).
5. Widok na komputer.
6. Ikonki: markiza sklepu do menu, 5 sztuczek, 5 przyjaciół, 6 kolorów (główka żabki).
