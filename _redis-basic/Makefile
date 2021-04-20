redis:
	docker-compose up -d
	@echo
	@echo "-----------------------------"
	@echo "Redis:$(REDIS_BASIC_VERSION)"
	@echo "container_name: $(REDIS_BASIC_CONTAINER_NAME)"
	@echo "host: localhost:$(REDIS_BASIC_PORT)"
	@echo "connected to network: $(REDIS_BASIC_NETWORK)"
	@echo "password: $(REDIS_BASIC_PASSWORD)"
	@echo "-----------------------------"

redis_down:
	docker-compose down
