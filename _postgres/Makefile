postgres:
	docker-compose up -d
	@echo
	@echo "-----------------------------"
	@echo "PostgreSQL:$(POSTGRES_VERSION)"
	@echo "container_name: $(POSTGRES_CONTAINER_NAME)"
	@echo "host: localhost:$(POSTGRES_PORT)"
	@echo "username: $(POSTGRES_USER)"
	@echo "password: $(POSTGRES_PASSWORD)"
	@echo "databasse: $(POSTGRES_DB)"
	@echo "-----------------------------"

postgres_down:
	docker-compose down
