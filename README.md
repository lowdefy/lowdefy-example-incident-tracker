# 🛠️ Lowdefy Incident Tracker Tutorial

<img src="https://lowdefy.com/images/logo.svg" width="400" height="150">

Welcome to the [Lowdefy Incident Tracker Tutorial](https://docs.lowdefy.com/tutorial-incident-tracker-getting-started "click here to follow our guided tutorial") repository! Lowdefy is an open-source, low-code framework for building web apps, dashboards, and more. This repository contains the source code for each step of building a self-hosted incident tracker — a status page backed by SQLite that shows what's broken right now, what was recently resolved, and lets an operator open new incidents and post status updates.

## 🧑‍💻 Introduction

If you have already worked through the [Ticketing App tutorial](https://docs.lowdefy.com/tutorial-start) and want a deeper example, this tutorial is for you. You'll build a five-page app driven by YAML config and a Knex connection, with patterns for parameterised SQL, derived state, list rendering, and config-driven UI.

## 🧠 Getting Started

### Prerequisites

Before you begin, make sure you have the following installed:

- [Node.js](https://nodejs.org/en) 18 or later
- [pnpm](https://pnpm.io/)
- The `sqlite3` CLI (preinstalled on most macOS systems; on Linux: `apt install sqlite3`)

### Using this Repository

- **Follow along**: Each folder in this repository corresponds to a specific step in the tutorial. Each folder is a standalone, runnable Lowdefy app.
- **Step-by-step guide**: Work through the steps in order, following the [Lowdefy Documentation](https://docs.lowdefy.com/tutorial-incident-tracker-getting-started).
- **Build your first status page**: By the end you'll have a self-hosted incident tracker you can extend with your own services, severities, and statuses.

### Running a step

Every step from `03-status-page` onwards reads from a SQLite database. To run any of them:

1. **Create the database** (once, from the repo root):

   ```bash
   sqlite3 incidents.sqlite < schema.sql
   sqlite3 incidents.sqlite < seed.sql
   ```

2. **Set the database path.** Each step that needs the database reads it from a `.env` file. Copy the template from `01-getting-started`:

   ```bash
   cp 01-getting-started/.env.example <step-folder>/.env
   ```

   Then edit `<step-folder>/.env` and set `LOWDEFY_SECRET_SQLITE_FILENAME` to the **absolute** path of your `incidents.sqlite` file. A relative path will resolve to `.lowdefy/dev/` and silently create an empty database in the wrong place.

3. **Start the dev server** from inside the step folder:

   ```bash
   cd <step-folder>
   pnpx lowdefy@5 dev
   ```

   The app runs at <http://localhost:3000>.

## 🔗 Resources and Support

- **Documentation**: For detailed instructions and more information, visit our [documentation](https://docs.lowdefy.com).
- **Community Support**: Join our [community forum](https://github.com/lowdefy/lowdefy/discussions) and our [Discord](https://discord.gg/WmcJgXt) for discussions, help, and sharing your Lowdefy experiences.
- **Feedback**: We love hearing from you! For bug reports and feature requests, please use our [GitHub Issues page](https://github.com/lowdefy/lowdefy/issues).
