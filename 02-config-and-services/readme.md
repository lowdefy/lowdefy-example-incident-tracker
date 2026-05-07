# 2. Config and the services page

Define the three keyed-object enums (`services`, `severities`, `statuses`) under `global` so every page can read them via the `_global` operator. Render the services list as a read-only page driven entirely by the YAML config — change the file, the UI updates on the next reload.

Key idea: a keyed object whose key is the DB value and whose body holds UI metadata (label, color). Pages look up tag colors by path: `severities.<value>.color`.
