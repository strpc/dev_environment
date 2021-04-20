flower:
	docker-compose up -d
	@echo
	@echo "-----------------------------"
	@echo "Flower:$(FLOWER_VERSION)"
	@echo "container_name: $(FLOWER_CONTAINER_NAME)"
	@echo "host: localhost:$(FLOWER_PORT)"
	@echo "broker_url: $(FLOWER_BROKER_URL)"
	@echo "connected to network: $(FLOWER_NETWORK)"
	@echo "-----------------------------"

flower_down:
	docker-compose down
