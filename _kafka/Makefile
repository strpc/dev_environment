kafka:
	docker-compose up -d
	@echo
	@echo "-----------------------------"
	@echo "KAFKA:$(KAFKA_VERSION)"
	@echo "container_name: $(KAFKA_CONTAINER_NAME)"
	@echo "host: localhost:$(KAFKA_PORT)"
	@echo "ZOOKEEPER:$(ZOOKEEPER_VERSION)"
	@echo "container_name: $(ZOOKEEPER_CONTAINER_NAME)"
	@echo "host: localhost:$(ZOOKEEPER_PORT)"
	@echo "-----------------------------"

kafka_down:
	docker-compose down
