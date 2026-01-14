up:
	docker compose -f docker/docker-compose.yml up -d

down:
	docker compose -f docker/docker-compose.yml down

restore:
	./scripts/restore_dvdrental.sh

smoke:
	./scripts/smoke_test.sh
