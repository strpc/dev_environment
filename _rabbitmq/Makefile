rabbitmq:
	docker-compose up -d
	@echo
	@echo "-----------------------------"
	@echo "RabbitMQ: $(RABBITMQ_VERSION)"
	@echo "container_name: $(RABBITMQ_CONTAINER_NAME)"
	@echo "host: localhost:$(RABBITMQ_PORT)"
	@echo "web: localhost:$(RABBITMQ_PORT_WEB)"
	@echo "username: $(RABBITMQ_USER)"
	@echo "password: $(RABBITMQ_PASSWORD)"
	@echo "-----------------------------"

rabbitmq_down:
	docker-compose down
