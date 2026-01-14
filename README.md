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
docker compose -f docker/docker-compose.yml up -d
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

If your credentials are different, use what you set in `docker/docker-compose.yml`:

* `POSTGRES_USER`
* `POSTGRES_PASSWORD`
* `POSTGRES_DB`

---

## Portfolio SQL

Business queries live here:

* `sql/dvdrental/`

Recommended convention:

* Name files `01_*.sql`, `02_*.sql`, etc.
* Start each file with a short header: goal, output columns, and notes.

Example query list (edit to match your current filenames):

* `01_top_customers_by_rentals.sql` — customer ranking (joins + group by)
* `02_revenue_by_store.sql` — revenue aggregation by store
* `03_most_rented_categories.sql` — category ranking (multi-join)
* `04_avg_rental_duration_by_category.sql` — grouping + date/time logic

---

## Repo structure

```text
.
├─ docker/
│  ├─ docker-compose.yml
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
docker compose -f docker/docker-compose.yml up -d
```

Stop:

```bash
docker compose -f docker/docker-compose.yml down
```

Reset everything (deletes Docker volume data):

```bash
docker compose -f docker/docker-compose.yml down -v
```

---

## Notes

* Restoring dvdrental can take a few minutes depending on disk speed and Docker/WSL performance.
* While restoring, avoid running heavy queries in DBeaver against the same database.


