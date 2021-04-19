mysql:
	docker-compose up -d
	@echo
	@echo "-----------------------------"
	@echo "MySQL:$(MYSQL_VERSION):"
	@echo "host: localhost:$(MYSQL_PORT)"
	@echo "container_name: $(MYSQL_CONTAINER_NAME)"
	@echo "username: $(MYSQL_USER)"
	@echo "password: $(MYSQL_PASSWORD)"
	@echo "database: $(MYSQL_DATABASE)"
	@echo "-----------------------------"

mysql_down:
	docker-compose down

mysql_query_log:
	docker exec -it $(MYSQL_CONTAINER_NAME) tail -f /var/log/mysql/mysql.log
