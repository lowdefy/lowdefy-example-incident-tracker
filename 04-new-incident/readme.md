# 4. The new-incident form

Add a `/incidents-new` page with a form that writes to the database. The form pulls its `service` and `severity` options from the same `global` enums the home page uses, so the dropdown values match the DB constraints.

The submit handler chain:

1. `Validate` — required-field check halts the chain on failure.
2. `SetState` — generate a uuid with `_uuid` and stash it as `new_incident_id` so the two follow-up inserts can share it.
3. `Request: insert_incident` — write the incident row.
4. `Request: insert_initial_update` — seed the timeline with an "investigating" update so the detail view (next step) is never empty.
5. `DisplayMessage` — toast the user.
6. `Link: home` — redirect.
