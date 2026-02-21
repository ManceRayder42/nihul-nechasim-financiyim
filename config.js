// Supabase Configuration for ניהול נכסים פיננסיים
// Financial Assets Management Application

const SUPABASE_URL = 'https://eapplhjpmkpqnipvufwd.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVhcHBsaGpwbWtwcW5pcHZ1ZndkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzExMzgwNjYsImV4cCI6MjA4NjcxNDA2Nn0.aougjTve-LZBQRmUdIkEpHSiRuClILkD5caoIewiZW8';

// Initialize Supabase client
const { createClient } = supabase;
const supabaseClient = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

export { supabaseClient, SUPABASE_URL, SUPABASE_ANON_KEY };
