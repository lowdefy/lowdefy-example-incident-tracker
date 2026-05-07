# 6. The all-incidents grid

Add `/incidents` — every incident in an `AgGridBalham`. One `KnexRaw` query loads every row; AgGrid handles client-side pagination, sorting, and per-column filtering.

The Service / Severity / Status columns use AgGrid's `tag` cell type. The `colorMap` for severity and status is projected from the config enums with `_jsonata`, so the grid uses the same colors as the cards on the home page.

The home page now has a "View all incidents →" link to this page.
