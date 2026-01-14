# SQL DE Portfolio — Postgres + dvdrental (Docker)

This repo is a reproducible SQL playground aimed at Data Engineering interview-style SQL and business-style analytics queries.

## What’s inside
- Postgres in Docker (single command setup)
- dvdrental dataset restore scripts
- Business analytics SQL queries (joins, aggregation, subqueries, etc.)
- Smoke tests to validate the dataset load

## Quick start (Docker)
From repo root:

```bash
docker compose -f docker/compose.yaml up -d
```
Verify the container is running:

```bash
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
```
### 2) Restore the dvdrental dataset

1. Place your dataset backup file here:

* `docker/datasets/dvdrental.tar`

> Note: `docker/datasets/` is gitignored by design (large files should not be committed).

2. Run the restore script:

```bash
./scripts/restore_dvdrental.sh
```
### 3) Smoke test (recommended)

Run:

```bash
./scripts/smoke_test.sh
```

If it prints counts for tables like `film`, `customer`, and `rental`, the dataset is loaded correctly.
## Connect with DBeaver

Create a new PostgreSQL connection in DBeaver with:

* **Host:** `localhost`
* **Port:** `5432`
* **Database:** `dvdrental`
* **Username:** `postgres`
* **Password:** `postgres`

If your credentials are different, use what you set in `docker/compose.yaml`:

* `POSTGRES_USER`
* `POSTGRES_PASSWORD`
* `POSTGRES_DB`

---

## Portfolio SQL

All portfolio queries are in:

- `sql/dvdrental/`

You can run them in DBeaver (connected to `dvdrental`) or via `psql`.

### Business analytics queries (dvdrental)
- `01_top_customers_by_rentals.sql` — joins + GROUP BY + ordering (ranking customers)
- `02_revenue_by_store.sql` — revenue aggregation by store (payments + rentals)
- `03_most_rented_categories.sql` — multi-join + aggregation (top categories)
- `04_top_films_by_rentals.sql` — ranking films by rentals (joins + GROUP BY)

---

## Repo structure

```text
.
├─ docker/
│  ├─ compose.yaml
│  └─ datasets/                 # gitignored (put dvdrental.tar here)
├─ scripts/
│  ├─ restore_dvdrental.sh
│  └─ smoke_test.sh
└─ sql/
   └─ dvdrental/                # business query portfolio
```

---

## Common commands

Start:

```bash
docker compose -f docker/compose.yaml up -d
```

Stop:

```bash
docker compose -f docker/compose.yaml down
```

Reset everything (deletes Docker volume data):

```bash
docker compose -f docker/compose.yaml down -v
```

---

## Notes

* Restoring dvdrental can take a few minutes depending on disk speed and Docker/WSL performance.
* While restoring, avoid running heavy queries in DBeaver against the same database.


