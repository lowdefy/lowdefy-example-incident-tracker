-- Incident Tracker — Phase 1 schema
-- Run once before starting the app:
--   sqlite3 incidents.sqlite < schema.sql

CREATE TABLE IF NOT EXISTS incidents (
  id             TEXT PRIMARY KEY,
  title          TEXT NOT NULL,
  description    TEXT NOT NULL,
  service        TEXT NOT NULL,
  severity       TEXT NOT NULL CHECK (severity IN ('minor', 'major', 'critical')),
  current_status TEXT NOT NULL CHECK (current_status IN ('investigating', 'identified', 'monitoring', 'resolved')),
  created_at     TEXT NOT NULL,
  resolved_at    TEXT
);

CREATE INDEX IF NOT EXISTS idx_incidents_current_status ON incidents (current_status);
CREATE INDEX IF NOT EXISTS idx_incidents_service        ON incidents (service);
CREATE INDEX IF NOT EXISTS idx_incidents_created_at     ON incidents (created_at DESC);
CREATE INDEX IF NOT EXISTS idx_incidents_resolved_at    ON incidents (resolved_at DESC);

CREATE TABLE IF NOT EXISTS incident_updates (
  id          TEXT PRIMARY KEY,
  incident_id TEXT NOT NULL,
  status      TEXT NOT NULL CHECK (status IN ('investigating', 'identified', 'monitoring', 'resolved')),
  message     TEXT NOT NULL,
  created_at  TEXT NOT NULL,
  FOREIGN KEY (incident_id) REFERENCES incidents (id)
);

CREATE INDEX IF NOT EXISTS idx_incident_updates_incident_id ON incident_updates (incident_id, created_at DESC);
