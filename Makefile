build:
	- docker compose up -d
	- docker compose logs -f

kill:
	- docker stop app queue nginx db myadmin
	- docker rm app queue nginx db myadmin
	- docker system prune -af --volumes

start:
	- docker start app queue nginx db myadmin

stop:
	- docker stop app queue nginx db myadmin

restart:
	- docker restart app queue nginx db myadmin

logs:
	- docker compose logs -f

shell:
	- docker compose exec app /bin/bash

queue-shell:
	- docker compose exec queue /bin/bash

test:
	- docker compose exec app php artisan test

clean:
	- docker system prune -af --volumes

down:
	- docker compose down

reset: 
	- docker compose down --volumes --remove-orphans
	- docker system prune -af --volumes

migrate:
	- docker compose exec app php artisan migrate

install:
	- docker compose exec app composer install
	- docker compose exec app php artisan key:generate

update:
	- docker compose exec app composer update

uninstall:
	- rm -r docker --force
	- rm -r .dockerignore --force
	- rm -r build.sh --force
	- rm -r docker-compose.yaml --force
	- rm -r entrypoint.sh --force
	- rm -r README.md --force
	- rm -r Makefile --force


.PHONY: build kill start stop restart logs shell queue-shell test migrate install update clean down up reset uninstall
