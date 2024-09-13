build:
	- chmod +x build.sh
	- ./build.sh
	- docker compose up -d
	- chmod +x entrypoint.sh
	- ./entrypoint.sh

kill:
	- docker compose stop app
	- docker compose stop queue
	- docker compose stop nginx
	- docker compose stop db
	- docker compose rm app
	- docker compose rm queue
	- docker compose rm nginx
	- docker compose rm db
	- docker system prune -af --volumes
	- docker system prune -a --volumes


start:
	- docker compose start app
	- docker compose start queue
	- docker compose start nginx
	- docker compose start db

stop:
	- docker compose stop app
	- docker compose stop queue
	- docker compose stop nginx
	- docker compose stop db

restart:
	- docker compose restart app
	- docker compose restart queue
	- docker compose restart nginx
	- docker compose restart db

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


.PHONY: build kill start stop restart logs shell queue-shell test migrate install update clean down up reset
