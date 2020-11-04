include vars.env

show_all:
	-@echo "enter:"
	-@echo ""
	-@echo "\tmake clickhouse\t\t-> \trun ClickHouse:$(CLICKHOUSE_VERSION) on port $(CLICKHOUSE_PORT)"
	-@echo "\tmake clickhouse_down\t-> \tdown ClickHouse"
	-@echo ""
	-@echo "\tmake redis_cluster\t-> \trun Redis Cluster on ports 7000-7050"
	-@echo "\tmake redis_cluster_down\t-> \tdown Redis Cluster"
	-@echo ""
	-@echo "\tmake redis\t\t-> \trun basic Redis:$(REDIS_BASIC_VERSION) on port $(REDIS_BASIC_PORT)"
	-@echo "\tmake redis_down\t\t-> \tdown basic Redis"
	-@echo ""
	-@echo "\tmake rabbitmq\t\t-> \trun RabbitMQ:$(RABBITMQ_VERSION) on port $(RABBITMQ_PORT), $(RABBITMQ_PORT_WEB)(web)"
	-@echo "\tmake rabbitmq_down\t-> \tdown RabbitMQ"
	-@echo ""
	-@echo "\tmake mongodb\t\t-> \trun MongoDB:$(MONGODB_VERSION) on port $(MONGODB_PORT)"
	-@echo "\tmake mongodb_down\t-> \tdown MongoDB"
	-@echo ""
	-@echo "\tmake mysql\t\t-> \trun MySQL:$(MYSQL_VERSION) on port $(MYSQL_PORT)"
	-@echo "\tmake mysql_down\t\t-> \tdown MySQL"
	-@echo ""
	-@echo "\tmake minio\t\t-> \trun Minio(S3):$(MINIO_VERSION) on port $(MINIO_PORT)"
	-@echo "\tmake minio_down\t\t-> \tdown Minio(S3)"
	-@echo ""
	-@echo "\tmake postgres\t\t-> \trun PostgreSQL:$(POSTGRES_VERSION) on port $(POSTGRES_PORT)"
	-@echo "\tmake postgres_down\t-> \tdown PostgreSQL"
	-@echo ""
	-@echo "\tmake logs c=mysql_dev\t-> \tshow log in live"
	-@echo "\tmake enter c=mysql_dev\t-> \tenter inside container"

logs:
	docker container logs -f $(c)

enter:
	docker exec -it $(c) su


# -----------------------------
# ClickHouse
_CH_DIR = _clickhouse
_CH_DC_FILE = $(_CH_DIR)/docker-compose.yml
_CH_DOCKERCOMPOSE_CMD = export CLICKHOUSE_VERSION=$(CLICKHOUSE_VERSION) && \
	export CLICKHOUSE_CONTAINER_NAME=$(CLICKHOUSE_CONTAINER_NAME) && \
	export CLICKHOUSE_PORT=$(CLICKHOUSE_PORT) && \
	export CLICKHOUSE_USER=$(CLICKHOUSE_USER) && \
	export CLICKHOUSE_PASSWORD=$(CLICKHOUSE_PASSWORD) && \
	export CLICKHOUSE_DB=$(CLICKHOUSE_DB) && \
	docker-compose -f $(_CH_DC_FILE)

clickhouse:
	$(_CH_DOCKERCOMPOSE_CMD) up -d
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
	$(_CH_DOCKERCOMPOSE_CMD) down


# -----------------------------
# MongoDB
_MONGODB_DIR = _mongodb
_MONGODB_DC_FILE = $(_MONGODB_DIR)/docker-compose.yml
_MONGODB_CMD = export MONGODB_VERSION=$(MONGODB_VERSION) && \
	export MONGODB_PORT=$(MONGODB_PORT) && \
	export MONGODB_CONTAINER_NAME=$(MONGODB_CONTAINER_NAME) && \
	export MONGODB_USER=$(MONGODB_USER) && \
	export MONGODB_PASSWORD=$(MONGODB_PASSWORD) && \
	docker-compose -f $(_MONGODB_DC_FILE)

mongodb:
	$(_MONGODB_CMD) up -d
	@echo
	@echo "-----------------------------"
	@echo "MongoDB:$(MONGODB_VERSION)"
	@echo "container_name: $(MONGODB_CONTAINER_NAME)"
	@echo "host: localhost:$(MONGODB_PORT)"
	@echo "username: $(MONGODB_USER)"
	@echo "password: $(MONGODB_PASSWORD)"
	@echo "-----------------------------"

mongodb_down:
	$(_MONGODB_CMD) down


# -----------------------------
# MySQL
_MYSQL_DIR = _mysql
_MYSQL_DC_FILE = $(_MYSQL_DIR)/docker-compose.yml
_MYSQL_CMD = export MYSQL_VERSION=$(MYSQL_VERSION) && \
	export MYSQL_CONTAINER_NAME=$(MYSQL_CONTAINER_NAME) && \
	export MYSQL_PORT=$(MYSQL_PORT) && \
	export MYSQL_USER=$(MYSQL_USER) && \
	export MYSQL_PASSWORD=$(MYSQL_PASSWORD) && \
	export MYSQL_DATABASE=$(MYSQL_DATABASE) && \
	export MYSQL_DIR_DUMP=$(MYSQL_DIR_DUMP) && \
	docker-compose -f $(_MYSQL_DC_FILE)

mysql:
	$(_MYSQL_CMD) up -d
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
	$(_MYSQL_CMD) down


# -----------------------------
# PostgreSQL
_POSTGRES_DIR = _postgres
_POSTGRES_DC_FILE = $(_POSTGRES_DIR)/docker-compose.yml
_POSTGRES_CMD = export POSTGRES_VERSION=$(POSTGRES_VERSION) && \
	export POSTGRES_CONTAINER_NAME=$(POSTGRES_CONTAINER_NAME) && \
	export POSTGRES_PORT=$(POSTGRES_PORT) && \
	export POSTGRES_USER=$(POSTGRES_USER) && \
	export POSTGRES_PASSWORD=$(POSTGRES_PASSWORD) && \
	export POSTGRES_DB=$(POSTGRES_DB) && \
	docker-compose -f $(_POSTGRES_DC_FILE)

postgres:
	$(_POSTGRES_CMD) up -d
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
	$(_POSTGRES_CMD) down


# -----------------------------
# Redis Cluster
_REDIS_CLUSTER_DIR = _redis-cluster
_REDIS_CLUSTER_DC_FILE = $(_REDIS_CLUSTER_DIR)/docker-compose.yml
_REDIS_CLUSTER_CMD = export REDIS_CLUSTER_IP=0.0.0.0 && \
	export REDIS_CLUSTER_CONTAINER_NAME=$(REDIS_CLUSTER_CONTAINER_NAME) && \
	docker-compose -f $(_REDIS_CLUSTER_DC_FILE)

redis_cluster:
	$(_REDIS_CLUSTER_CMD) up -d
	sleep 5
	export REDIS_CLUSTER_PASSWORD=$(REDIS_CLUSTER_PASSWORD) && \
	sh $(_REDIS_CLUSTER_DIR)/set_password.sh
	@echo
	@echo "-----------------------------"
	@echo "Redis Cluster:"
	@echo "container_name: $(REDIS_CLUSTER_CONTAINER_NAME)"
	@echo "host: localhost:7000-7050"
	@echo "password: $(REDIS_CLUSTER_PASSWORD)"
	@echo "-----------------------------"

redis_cluster_down:
	$(_REDIS_CLUSTER_CMD) down


# -----------------------------
# Redis Basic
_REDIS_BASIC_DIR = _redis-basic
_REDIS_BASIC_DC_FILE = $(_REDIS_BASIC_DIR)/docker-compose.yml
_REDIS_BASIC_CMD = export REDIS_BASIC_VERSION=$(REDIS_BASIC_VERSION) && \
	export REDIS_BASIC_CONTAINER_NAME=$(REDIS_BASIC_CONTAINER_NAME) && \
	export REDIS_BASIC_PORT=$(REDIS_BASIC_PORT) && \
	export REDIS_BASIC_PASSWORD=$(REDIS_BASIC_PASSWORD) && \
	docker-compose -f $(_REDIS_BASIC_DC_FILE)

redis:
	$(_REDIS_BASIC_CMD) up -d
	@echo
	@echo "-----------------------------"
	@echo "Redis:$(REDIS_BASIC_VERSION)"
	@echo "container_name: $(REDIS_BASIC_CONTAINER_NAME)"
	@echo "host: localhost:$(REDIS_BASIC_PORT)"
	@echo "password: $(REDIS_BASIC_PASSWORD)"
	@echo "-----------------------------"

redis_down:
	$(_REDIS_BASIC_CMD) down


# -----------------------------
# RabbitMQ
_RABBITMQ_DIR = _rabbitmq
_RABBITMQ_DC_FILE = $(_RABBITMQ_DIR)/docker-compose.yml
_RABBITMQ_CMD = export RABBITMQ_VERSION=$(RABBITMQ_VERSION) && \
	export RABBITMQ_PORT=$(RABBITMQ_PORT) && \
	export RABBITMQ_CONTAINER_NAME=$(RABBITMQ_CONTAINER_NAME) && \
	export RABBITMQ_PORT_WEB=$(RABBITMQ_PORT_WEB) && \
	export RABBITMQ_USER=$(RABBITMQ_USER) && \
	export RABBITMQ_PASSWORD=$(RABBITMQ_PASSWORD) && \
	docker-compose -f $(_RABBITMQ_DC_FILE)

rabbitmq:
	$(_RABBITMQ_CMD) up -d
	@echo
	@echo "-----------------------------"
	@echo "RabbitMQ: $(RABBITMQ_VERSION)"
	@echo "container_name: $(RABBITMQ_CONTAINER_NAME)"
	@echo "host: localhost:$(RABBITMQ_PORT)"
	@echo "web: localhost:$(RABBITMQ_PORT_WEB)"
	@echo "username: $(RABBITMQ_USER)"
	@echo "password: $(RABBITMQ_PASSWORD)"
	@echo "-----------------------------"

rabbitmq_down:
	$(_RABBITMQ_CMD) down


# -----------------------------
# FTP
_FTP_DIR = _ftp
_FTP_DC_FILE = $(_FTP_DIR)/docker-compose.yml
_FTP_CMD = export FTP_USER=$(FTP_USER) && \
	export FTP_VERSION=$(FTP_VERSION) && \
	export FTP_CONTAINER_NAME=$(FTP_CONTAINER_NAME) && \
	export FTP_PASSWORD=$(FTP_PASSWORD) && \
	docker-compose -f $(_FTP_DC_FILE)

ftp:
	$(_FTP_CMD) up -d
	@echo
	@echo "-----------------------------"
	@echo "FTP:$(FTP_VERSION)"
	@echo "host: localhost:20"
	@echo "container_name: $(FTP_CONTAINER_NAME)"
	@echo "username: $(FTP_USER)"
	@echo "password: $(FTP_PASSWORD)"
	@echo "-----------------------------"

ftp_down:
	$(_FTP_CMD) down


# -----------------------------
# Minio(S3)
_MINIO_DIR = _minio
_MINIO_DC_FILE = $(_MINIO_DIR)/docker-compose.yml
_MINIO_CMD = MINIO_VERSION=$(MINIO_VERSION) && \
	export MINIO_VERSION=$(MINIO_VERSION) && \
	export MINIO_CONTAINER_NAME=$(MINIO_CONTAINER_NAME) && \
	export MINIO_PORT=$(MINIO_PORT) && \
	export MINIO_ACCESS_KEY=$(MINIO_ACCESS_KEY) && \
	export MINIO_SECRET_KEY=$(MINIO_SECRET_KEY) && \
	docker-compose -f $(_MINIO_DC_FILE)

minio:
	$(_MINIO_CMD) up -d
	@echo
	@echo "-----------------------------"
	@echo "Minio(S3):$(MINIO_VERSION)"
	@echo "container_name: $(MINIO_CONTAINER_NAME)"
	@echo "host: localhost:$(MINIO_PORT)"
	@echo "access_key: $(MINIO_ACCESS_KEY)"
	@echo "secret_key: $(MINIO_SECRET_KEY)"
	@echo "-----------------------------"

minio_down:
	$(_MINIO_CMD) down
