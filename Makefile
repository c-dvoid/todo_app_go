include .env
export

env-up:
	docker compose up -d todoapp-postgres

env-down:
	docker compose down todoapp-postgres

env-cleanup:
	docker compose down -v

env-port-forward:
	docker compose up -d port-forwarder

env-port-close:
	docker compose down port-forwarder

migrate-create:
	docker compose run --rm --no-deps todoapp-postgres-migrate create -ext sql -dir /migrations -seq $(name)

migrate-up:
	docker compose run --rm todoapp-postgres-migrate

migrate-down:
	docker compose run --rm todoapp-postgres-migrate -path /migrations -database ${DATABASE_URL} down 1