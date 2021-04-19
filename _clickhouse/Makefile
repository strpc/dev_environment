clickhouse:
	sed "s/<password><\/password>/<password>$(CLICKHOUSE_PASSWORD)<\/password>/" users_template.xml > ./users.xml
	docker-compose up -d
	@echo
	@echo "-----------------------------"
	@echo "clickhouse:$(CLICKHOUSE_VERSION)"
	@echo "container_name: $(CLICKHOUSE_CONTAINER_NAME)"
	@echo "url: http://localhost:$(CLICKHOUSE_PORT)"
	@echo "username: $(CLICKHOUSE_USER)"
	@echo "password: $(CLICKHOUSE_PASSWORD)"
	@echo "database: $(CLICKHOUSE_DB)"
	@echo "-----------------------------"

clickhouse_down:
	docker-compose down
