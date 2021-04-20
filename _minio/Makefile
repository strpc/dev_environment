minio:
	docker-compose up -d
	@echo
	@echo "-----------------------------"
	@echo "Minio(S3):$(MINIO_VERSION)"
	@echo "container_name: $(MINIO_CONTAINER_NAME)"
	@echo "host: localhost:$(MINIO_PORT)"
	@echo "access_key: $(MINIO_ACCESS_KEY)"
	@echo "secret_key: $(MINIO_SECRET_KEY)"
	@echo "-----------------------------"

minio_down:
	docker-compose down
