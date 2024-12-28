.PHONY: build up down logs shell migrate makemigrations superuser test lint clean help static restart

help:
	@echo "Available commands:"
	@echo "  make build         - Build Docker images"
	@echo "  make up           - Start the application"
	@echo "  make down         - Stop the application"
	@echo "  make logs         - View application logs"
	@echo "  make shell        - Open a shell in the web container"
	@echo "  make migrate      - Run database migrations"
	@echo "  make makemigrations - Create new migrations"
	@echo "  make superuser    - Create a superuser"
	@echo "  make test         - Run tests"
	@echo "  make lint         - Run code linting"
	@echo "  make clean        - Remove all containers and volumes"
	@echo "  make static       - Collect static files"
	@echo "  make restart      - Restart the application"

build:
	docker-compose build --no-cache

up:
	docker-compose up -d

down:
	docker-compose down

logs:
	docker-compose logs -f

shell:
	docker-compose exec web bash

migrate:
	docker-compose exec web python manage.py migrate

makemigrations:
	docker-compose exec web python manage.py makemigrations

superuser:
	docker-compose exec web python manage.py createsuperuser

test:
	docker-compose exec web python manage.py test

lint:
	docker-compose exec web flake8 .

clean:
	docker-compose down -v
	find . -type d -name "__pycache__" -exec rm -r {} +
	find . -type f -name "*.pyc" -delete

static:
	docker-compose exec web python manage.py collectstatic --noinput

restart:
	docker-compose restart web 