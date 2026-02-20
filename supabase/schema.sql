-- ניהול נכסים פיננסיים - Financial Assets Management Schema
-- Run this in Supabase SQL Editor

-- Enable necessary extensions
create extension if not exists "uuid-ossp";

-- Asset types enum
create type if not exists asset_type as enum (
  'real_estate','stocks','bonds','mutual_funds','crypto','savings','pension','other'
);

-- Assets table
create table if not exists public.assets (
  id uuid default uuid_generate_v4() primary key,
  user_id uuid references auth.users on delete cascade not null,
  name text not null,
  asset_type asset_type not null,
  description text,
  current_value numeric(15,2) default 0,
  initial_investment numeric(15,2) default 0,
  currency text default 'ILS',
  purchase_date date,
  is_active boolean default true,
  notes text,
  created_at timestamptz default now() not null,
  updated_at timestamptz default now() not null
);

-- Transactions table
create table if not exists public.transactions (
  id uuid default uuid_generate_v4() primary key,
  user_id uuid references auth.users on delete cascade not null,
  asset_id uuid references public.assets on delete set null,
  transaction_type text not null,
  amount numeric(15,2) not null,
  currency text default 'ILS',
  date timestamptz default now() not null,
  description text,
  created_at timestamptz default now() not null
);

-- Asset value history
create table if not exists public.asset_value_history (
  id uuid default uuid_generate_v4() primary key,
  asset_id uuid references public.assets on delete cascade not null,
  value numeric(15,2) not null,
  recorded_at timestamptz default now() not null
);

-- Enable RLS
alter table public.assets enable row level security;
alter table public.transactions enable row level security;
alter table public.asset_value_history enable row level security;

-- RLS Policies for assets
create policy "Users manage own assets" on public.assets for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

-- RLS Policies for transactions
create policy "Users manage own transactions" on public.transactions for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

-- RLS for history
create policy "Users view own history" on public.asset_value_history
  for select using (auth.uid() = (select user_id from public.assets where id = asset_id));

create policy "Users insert own history" on public.asset_value_history
  for insert with check (auth.uid() = (select user_id from public.assets where id = asset_id));

-- Indexes
create index if not exists idx_assets_user_id on public.assets(user_id);
create index if not exists idx_transactions_user_id on public.transactions(user_id);
create index if not exists idx_transactions_asset_id on public.transactions(asset_id);
create index if not exists idx_asset_value_history_asset_id on public.asset_value_history(asset_id);
