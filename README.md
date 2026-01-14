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
