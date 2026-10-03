-- Skumaj to! – tabele na wyniki i ustawienia.
-- Uruchom raz w Supabase: SQL Editor → New query → wklej całość → Run.

-- Rundy: jeden wiersz = jedna runda (15 zadań albo poprawa błędów).
create table if not exists public.rundy (
  id         text primary key,
  user_id    uuid not null default auth.uid() references auth.users (id) on delete cascade,
  data       timestamptz not null,               -- kiedy runda się skończyła
  dzien      date not null,                       -- dzień w czasie lokalnym (do kalendarza)
  temat      text not null,                       -- np. 'tabliczka', 'ang-rodzina'
  rodzaj     text not null check (rodzaj in ('runda', 'poprawa')),
  zadania    jsonb not null default '[]'::jsonb,  -- [{klucz, pytanie, odp, wpis, dobrze, ms}]
  dobre      int  not null check (dobre >= 0),
  wszystkie  int  not null check (wszystkie > 0),
  ms         int  not null check (ms >= 0),       -- czas rundy w milisekundach
  utworzono  timestamptz not null default now()
);
create index if not exists rundy_user_data on public.rundy (user_id, data);

-- Ustawienia: jeden wiersz na konto (np. które tematy są „skumane”).
create table if not exists public.ustawienia (
  user_id   uuid primary key default auth.uid() references auth.users (id) on delete cascade,
  archiwum  jsonb not null default '{}'::jsonb,  -- {"tabliczka": "2026-10-03T12:00:00Z"}
  zmieniono timestamptz not null default now()
);

-- Każdy widzi i zmienia tylko swoje dane.
alter table public.rundy enable row level security;
alter table public.ustawienia enable row level security;

drop policy if exists "rundy: swoje" on public.rundy;
create policy "rundy: swoje" on public.rundy
  for all to authenticated
  using (user_id = auth.uid())
  with check (user_id = auth.uid());

drop policy if exists "ustawienia: swoje" on public.ustawienia;
create policy "ustawienia: swoje" on public.ustawienia
  for all to authenticated
  using (user_id = auth.uid())
  with check (user_id = auth.uid());
