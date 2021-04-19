nats_cluster:
	docker-compose up -d
	echo
	echo "-----------------------------"
	echo "NATS:$(NATS_VERSION)"
	echo "container_name: $(NATS_CONTAINER_NAME)_master"
	echo "host: localhost:$(NATS_PORT)"
	echo "management: localhost:$(NATS_MANAGEMENT_PORT)"
	echo "-----------------------------"

nats_cluster_down:
	docker-compose down
