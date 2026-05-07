# 5. The incident detail page

Add `/incident?id=<uuid>` — a detail view that reads the incident id from the URL with `_url_query: id`. Three things to wire up:

1. **Two reads** — `fetch_incident` and `fetch_updates`, both parameterised on the URL's `id`.
2. **A post-update form** — writes a new `incident_updates` row and syncs `incidents.current_status` (stamping `resolved_at` when the new status is `resolved`). Hidden once the incident is resolved.
3. **A timeline** — `MasonryList` with one column over the fetched updates, rendered as a vertical stack of cards.

Home cards now `Link` to this page on click, and the new-incident form redirects here instead of home.
