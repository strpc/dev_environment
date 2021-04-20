ftp:
	docker-compose up -d
	@echo
	@echo "-----------------------------"
	@echo "FTP:$(FTP_VERSION)"
	@echo "host: localhost:20"
	@echo "container_name: $(FTP_CONTAINER_NAME)"
	@echo "username: $(FTP_USER)"
	@echo "password: $(FTP_PASSWORD)"
	@echo "ftp dir: $(FTP_DIR)"
	@echo "-----------------------------"

ftp_down:
	docker-compose down
