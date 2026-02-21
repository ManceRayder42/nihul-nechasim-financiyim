# nihul-nechasim-financiyim

## ניהול נכסים פיננסיים - Financial Assets Management

A web application for managing financial assets, integrated with Supabase.

## Supabase Project

- **URL**: https://eapplhjpmkpqnipvufwd.supabase.co
- **Project ID**: eapplhjpmkpqnipvufwd
- **Dashboard**: https://supabase.com/dashboard/project/eapplhjpmkpqnipvufwd

## Database Tables

### assets
Track all financial assets (stocks, real estate, bonds, crypto, etc.)

### transactions
Record all financial transactions (buy, sell, deposit, withdrawal, dividend, etc.)

### asset_value_history
Track asset value changes over time

## Adding the Main App File

To push the original HTML file to this repo:

```bash
cd ~/Downloads
git clone https://github.com/ManceRayder42/nihul-nechasim-financiyim.git
cp "ניהול_נכסים_פיננסיים_3.html" nihul-nechasim-financiyim/index.html
cd nihul-nechasim-financiyim
git add index.html
git commit -m "Add main application file"
git push
```

## Supabase Integration Code

Add to your HTML:
```html
<script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2"></script>
<script>
  const SUPABASE_URL = 'https://eapplhjpmkpqnipvufwd.supabase.co';
  const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVhcHBsaGpwbWtwcW5pcHZ1ZndkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzExMzgwNjYsImV4cCI6MjA4NjcxNDA2Nn0.aougjTve-LZBQRmUdIkEpHSiRuClILkD5caoIewiZW8';
  const { createClient } = supabase;
  const supabaseClient = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
</script>
```

## Tech Stack
- Frontend: HTML5, CSS3, JavaScript
- Backend: Supabase (PostgreSQL + Auth + Realtime)
