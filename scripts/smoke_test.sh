#!/usr/bin/env bash
set -euo pipefail

CONTAINER="de_postgres"
DB="dvdrental"
USER="postgres"

echo "Checking tables exist..."
docker exec -u "$USER" "$CONTAINER" psql -d "$DB" -c "\dt"

echo "Quick sanity queries:"
docker exec -u "$USER" "$CONTAINER" psql -d "$DB" -c "SELECT COUNT(*) AS customers FROM customer;"
docker exec -u "$USER" "$CONTAINER" psql -d "$DB" -c "SELECT COUNT(*) AS rentals FROM rental;"
docker exec -u "$USER" "$CONTAINER" psql -d "$DB" -c "SELECT COUNT(*) AS films FROM film;"

echo "OK."
