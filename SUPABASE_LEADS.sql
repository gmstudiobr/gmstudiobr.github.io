-- Execute este SQL no Supabase SQL Editor
-- https://supabase.com/dashboard/project/noyvpypcxhxluckmrirf/sql/new

CREATE TABLE IF NOT EXISTS public.leads (
  id          BIGSERIAL PRIMARY KEY,
  created_at  TIMESTAMPTZ DEFAULT NOW(),
  nome        TEXT,
  email       TEXT,
  empresa     TEXT,
  whatsapp    TEXT,
  pacote      TEXT,
  mensagem    TEXT,
  page        TEXT,
  referrer    TEXT,
  source      TEXT
);
ALTER TABLE leads ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "leads_insert" ON leads;
DROP POLICY IF EXISTS "leads_select" ON leads;
CREATE POLICY "leads_insert" ON leads FOR INSERT WITH CHECK (true);
CREATE POLICY "leads_select" ON leads FOR SELECT USING (true);
