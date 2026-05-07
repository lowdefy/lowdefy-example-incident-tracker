# 1. Getting started

The starting point: a fresh Lowdefy app with one welcome page, the SQLite schema for incidents and updates, and an `.env.example` for the database path.

Set up the database:

```bash
sqlite3 incidents.sqlite < schema.sql
sqlite3 incidents.sqlite < seed.sql
cp .env.example .env
# edit .env and set LOWDEFY_SECRET_SQLITE_FILENAME to the absolute path
```

Start the dev server:

```bash
npx lowdefy@5 dev
```
