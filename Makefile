TELEGRAM_SERVICE_CONTAINER := glowing-telegram
DOCKER_EXEC_CMD := docker-compose exec
EXEC_IN_CONTAINER := $(DOCKER_EXEC_CMD) $(TELEGRAM_SERVICE_CONTAINER)

dev:
	docker-compose up --build