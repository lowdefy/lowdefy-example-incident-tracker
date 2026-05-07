-- Optional demo rows so the home page has content on first load.
-- Run:  sqlite3 incidents.sqlite < seed.sql

INSERT INTO incidents (id, title, description, service, severity, current_status, created_at, resolved_at) VALUES
  ('inc_demo_1', 'Elevated API latency',           'p95 latency spike on the public API',  'api',     'major',    'investigating', datetime('now', '-2 hours'),  NULL),
  ('inc_demo_2', 'Email delivery delayed',         'Transactional emails queued > 10 min', 'workers', 'minor',    'monitoring',    datetime('now', '-6 hours'),  NULL),
  ('inc_demo_3', 'Dashboard 5xx errors',           'Edge cache returning 502',             'web',     'major',    'resolved',      datetime('now', '-3 days'),   datetime('now', '-2 days, +20 minutes')),
  ('inc_demo_4', 'Scheduled DB maintenance',       'Brief connection blips during failover','db',     'minor',    'resolved',      datetime('now', '-10 days'),  datetime('now', '-10 days', '+30 minutes'));

INSERT INTO incident_updates (id, incident_id, status, message, created_at) VALUES
  ('upd_demo_1a', 'inc_demo_1', 'investigating', 'We are looking into elevated latency on the public API.', datetime('now', '-2 hours')),
  ('upd_demo_2a', 'inc_demo_2', 'investigating', 'Email queue depth is rising. Investigating worker health.', datetime('now', '-6 hours')),
  ('upd_demo_2b', 'inc_demo_2', 'monitoring',    'Queue is draining. Monitoring for regressions.',           datetime('now', '-4 hours')),
  ('upd_demo_3a', 'inc_demo_3', 'investigating', 'Some users seeing 502s from the dashboard.',                datetime('now', '-3 days')),
  ('upd_demo_3b', 'inc_demo_3', 'identified',    'Root cause identified: stale edge cache entries.',          datetime('now', '-2 days', '-30 minutes')),
  ('upd_demo_3c', 'inc_demo_3', 'resolved',      'Cache purged and errors have subsided.',                    datetime('now', '-2 days', '+20 minutes')),
  ('upd_demo_4a', 'inc_demo_4', 'monitoring',    'Planned DB failover underway; brief connection blips.',     datetime('now', '-10 days')),
  ('upd_demo_4b', 'inc_demo_4', 'resolved',      'Failover complete. Service is stable.',                     datetime('now', '-10 days', '+30 minutes'));
