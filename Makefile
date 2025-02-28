
all: up

up:
	@mkdir -p /home/avaldin/data/wordpress
	@mkdir -p /home/avaldin/data/mariadb
	docker-compose -f srcs/docker-compose.yml up --build

build:
	docker-compose -f srcs/docker-compose.yml build --no-cache

down:
	docker-compose -f srcs/docker-compose.yml down

start:
	docker-compose -f srcs/docker-compose.yml start

stop:
	docker-compose -f srcs/docker-compose.yml stop

prune:
	docker system prune --all --volumes --force

clean:
	docker-compose -f srcs/docker-compose.yml down --volumes --rmi all

fclean: clean
	docker run -it --rm -v /home/avaldin/data:/data busybox sh -c "rm -rf /data/*"

re: fclean up

.PHONY: all up build down start stop logs prune mysql re fclean clean