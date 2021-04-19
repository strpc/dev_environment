mongodb:
	docker-compose up -d
	@echo
	@echo "-----------------------------"
	@echo "MongoDB:$(MONGODB_VERSION)"
	@echo "container_name: $(MONGODB_CONTAINER_NAME)"
	@echo "host: localhost:$(MONGODB_PORT)"
	@echo "username: $(MONGODB_USER)"
	@echo "password: $(MONGODB_PASSWORD)"
	@echo "-----------------------------"

mongodb_down:
	docker-compose down
