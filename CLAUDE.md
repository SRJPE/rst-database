# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Schema and seed data for the **Rotary Screw Trap (RST) / DataTackle / JPE** PostgreSQL database. This repo owns the database only — the tablet UI (`SRJPE/rst-pilot-app-client`) and backend (`SRJPE/jpe-app-server`) live in separate repos. The database tracks juvenile salmonid monitoring: programs, trap locations/visits, fish catch, marks/releases, genetics, and a large set of lookup tables.

Schema changes are applied with **Knex migrations**. Reference data is loaded with **Knex seeds** (dev) or raw SQL (cloud).

## Environments

`NODE_ENV` drives nearly all behavior and is `development`, `staging`, or `production`. There is a separate `.env.*` file per target (`.env`, `.env.local`, `.env.staging`, `.env.production`, etc.). `knexfile.js` reads `.env`.

## The dual-migration directory pattern (most important)

There are **two** migration directories, and `knexfile.js` picks one by `NODE_ENV`:

- `knex/migrations/` — used for `development` and `staging`
- `knex/migrations_production/` — used for `production`

**When adding or changing schema, write the migration into BOTH directories** (same filename, same timestamp). Recent migrations are byte-identical across the two dirs; they only diverge in the early history because each directory has its own initial `create_initial_tables` migration (prod's was created later, against an already-live DB). Adding a migration to only one directory means it will silently never run in the other environment.

The standalone `tables/*.sql` and `seed_data/seed_data_cloud.sql` files mirror the migration state for direct-PSQL provisioning of a cloud DB (also split into `_production` variants). Knex migrations are the source of truth for local/staging; keep these in mind but the migrations are what actually run in CI/containers.

## Commands

```bash
npm run migrate              # knex migrate:latest — apply all pending migrations
npm run next_migration       # knex migrate:up — apply the next single migration
npm run rollback             # knex migrate:down — roll back the last migration
npm run makemigrations <name># scaffold a new migration (creates in migrations/ per NODE_ENV)
npm run runseed              # knex seed:run — run all seeds in knex/seeds/ in order
npm run makeseeds <name>     # scaffold a new seed
npm run reset-db             # development only: rollback --all, migrate, runseed (no-op in staging/prod)
```

There is **no test suite and no linter** (`npm test` is a stub; `src/` and `test/` are empty).

### Local development (Docker)

```bash
docker-compose up --build -d   # starts `postgres` (port 5435->5432) + `migration` containers
```
Then exec into the `migration` container and run `npm run migrate` followed by `npm run runseed`. Requires `JPE_BIND_DIR` (repo root, from `pwd`) in `.env` so the container can read `seed_data/` for the SQL COPY commands.

### Cloud (Azure Flexible Server)

Production/staging run on Azure Database for PostgreSQL. Lookup-table seeding is done **manually via raw SQL**, not Knex — see `init-db.sh` and `seed_data/seed_data_cloud.sql` — because Azure permissions block the file-read path Knex seeds use. Migrations still run via Knex against the cloud connection.

## Conventions

- **camelCase ↔ snake_case**: `knexfile.js` applies Objection's `knexSnakeCaseMappers`. Write JS identifiers in camelCase (e.g. `dataRecorderId`, `programId`) in seeds and migration builder calls; they map to snake_case columns. Raw SQL in `knex.raw(...)` is unaffected — use snake_case there.
- **Migrations** are written as `knex.raw()` with literal SQL `up`/`down` (see `knex/migrations/20260326125404_trap_locations_project.js`). Keep this style; always provide a working `down`.
- **Seeds** are numbered (`01_`–`20_`) and run in that order — ordering matters because of FK dependencies (lookups → personnel → program → trap_locations → ...). Most seeds `.del()` then `.insert()`; some only `.insert()` (additive). Foreign keys are referenced by hardcoded integer IDs that depend on earlier seeds, so renumbering or reordering is risky.
- `seeds/01_initial_seed.js` loads `seed_data/seed_data.sql` **only when `NODE_ENV=development`**; in staging/production it intentionally does nothing (cloud lookups are loaded manually, see above).

## Lookup CSVs

`seed_data/data/*.csv` (the `lu*` lookup tables) are generated from `seed_data/excel/CAMP Tables - Final Draft.xlsx` by `seed_data/create_csvs.py` (pandas + openpyxl, see `requirements.txt`). Edit the Excel and regenerate rather than hand-editing CSVs when the source-of-truth is the workbook; small one-off fixes to CSVs directly are also done in practice.
