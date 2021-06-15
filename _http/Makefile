http:
	docker-compose up -d
	@echo
	@echo "-----------------------------"
	@echo "httpbin:latest"
	@echo "container_name: $(HTTP_CONTAINER_NAME)"
	@echo "host: http://localhost:$(HTTP_PORT)"
	@echo "-----------------------------"

http_down:
	docker-compose down
