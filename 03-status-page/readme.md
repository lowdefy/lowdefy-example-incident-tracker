# 3. The status page

Add a `Knex` connection to SQLite and a home page that reads incidents from the database. Two `KnexRaw` requests fire on `onMount`: one for active incidents, one for recently resolved. A `SetState` action stashes the rows plus a derived `overall_status` (computed inline with `_jsonata`) so the UI reads plain values.

Home page features:

- An `Alert` banner whose color and message switch on `overall_status`.
- A `MasonryList` of active incidents — each card shows service, severity, and status tags whose colors come from the config enums.
- A second `MasonryList` for incidents resolved in the last 30 days.
