-- ═══════════════════════════════════════════════════
-- SUBNIX DATABASE SCHEMA
-- Run this in: supabase.com → your project → SQL Editor
-- ═══════════════════════════════════════════════════

-- Profiles table (extends Supabase auth.users)
create table if not exists public.profiles (
  id uuid references auth.users on delete cascade primary key,
  email text,
  is_pro boolean default false,
  stripe_customer_id text,
  stripe_subscription_id text,
  currency text default 'USD',
  created_at timestamp with time zone default now(),
  updated_at timestamp with time zone default now()
);

-- Subscriptions table
create table if not exists public.subscriptions (
  id uuid default gen_random_uuid() primary key,
  user_id uuid references auth.users on delete cascade not null,
  name text not null,
  amount numeric(10,2) not null,
  cycle text check (cycle in ('monthly','yearly','weekly')) default 'monthly',
  category text check (category in ('streaming','software','fitness','food','news','other')) default 'other',
  start_date date not null default current_date,
  is_used boolean default true,
  notes text,
  created_at timestamp with time zone default now(),
  updated_at timestamp with time zone default now()
);

-- Auto-create profile on signup
create or replace function public.handle_new_user()
returns trigger as $$
begin
  insert into public.profiles (id, email)
  values (new.id, new.email);
  return new;
end;
$$ language plpgsql security definer;

create or replace trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();

-- Row Level Security (users can only see their own data)
alter table public.profiles enable row level security;
alter table public.subscriptions enable row level security;

create policy "Users can view own profile"
  on public.profiles for select using (auth.uid() = id);

create policy "Users can update own profile"
  on public.profiles for update using (auth.uid() = id);

create policy "Users can view own subscriptions"
  on public.subscriptions for select using (auth.uid() = user_id);

create policy "Users can insert own subscriptions"
  on public.subscriptions for insert with check (auth.uid() = user_id);

create policy "Users can update own subscriptions"
  on public.subscriptions for update using (auth.uid() = user_id);

create policy "Users can delete own subscriptions"
  on public.subscriptions for delete using (auth.uid() = user_id);
