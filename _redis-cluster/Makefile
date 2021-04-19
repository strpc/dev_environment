redis_cluster:
	REDIS_CLUSTER_IP=0.0.0.0 REDIS_USE_STANDALONE=false REDIS_USE_SENTINEL=false docker-compose up -d
	sleep 5
	REDIS_CLUSTER_PASSWORD=$(REDIS_CLUSTER_PASSWORD) sh set_password.sh
	@echo
	@echo "-----------------------------"
	@echo "Redis Cluster:"
	@echo "container_name: $(REDIS_CLUSTER_CONTAINER_NAME)"
	@echo "host: localhost:7000-7050"
	@echo "password: $(REDIS_CLUSTER_PASSWORD)"
	@echo "-----------------------------"

redis_cluster_down:
	REDIS_CLUSTER_IP=0.0.0.0 REDIS_USE_STANDALONE=false REDIS_USE_SENTINEL=false docker-compose down
