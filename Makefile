build:
	- chmod +x build.sh
	- ./build.sh
	- docker compose up -d
	- chmod +x entrypoint.sh
	- ./entrypoint.sh
	- docker compose exec app php artisan migrate


kill:
	- docker stop app
	- docker stop queue
	- docker stop nginx
	- docker stop db
	- docker stop myadmin
	- docker rm app
	- docker rm queue
	- docker rm nginx
	- docker rm db
	- docker rm myadmin
	- docker system prune -af --volumes

start:
	- docker start app
	- docker start queue
	- docker start nginx
	- docker start db
	- docker start myadmin

stop:
	- docker stop app
	- docker stop queue
	- docker stop nginx
	- docker stop db
	- docker stop myadmin

restart:
	- docker restart app
	- docker restart queue
	- docker restart nginx
	- docker restart db
	- docker restart myadmin

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
