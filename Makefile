include vars.env

# ClickHouse
_CH_DIR = _clickhouse
_CH_DC_FILE = $(_CH_DIR)/docker-compose.yml
_CH_DOCKERCOMPOSE_CMD = export CLICKHOUSE_VERSION=$(CLICKHOUSE_VERSION) && \
	export CLICKHOUSE_PORT=$(CLICKHOUSE_PORT) && \
	docker-compose -f $(_CH_DC_FILE)

# Redis Cluster
_REDIS_CLUSTER_DIR = _redis-cluster
_REDIS_CLUSTER_DC_FILE = $(_REDIS_CLUSTER_DIR)/docker-compose.yml
_REDIS_CLUSTER_CMD = export REDIS_CLUSTER_IP=0.0.0.0 && \
	docker-compose -f $(_REDIS_CLUSTER_DC_FILE)

# Redis Basic
_REDIS_BASIC_DIR = _redis-basic
_REDIS_BASIC_DC_FILE = $(_REDIS_BASIC_DIR)/docker-compose.yml
_REDIS_BASIC_CMD = export REDIS_BASIC_VERSION=$(REDIS_BASIC_VERSION) && \
	export REDIS_BASIC_PORT=$(REDIS_BASIC_PORT) && \
	export REDIS_BASIC_PASSWORD=$(REDIS_BASIC_PASSWORD) && \
	docker-compose -f $(_REDIS_BASIC_DC_FILE)

# RabbitMQ
_RABBITMQ_DIR = _rabbitmq
_RABBITMQ_DC_FILE = $(_RABBITMQ_DIR)/docker-compose.yml
_RABBITMQ_CMD = export RABBITMQ_VERSION=$(RABBITMQ_VERSION) && \
	export RABBITMQ_PORT=$(RABBITMQ_PORT) && \
	export RABBITMQ_PORT_WEB=$(RABBITMQ_PORT_WEB) && \
	export RABBITMQ_USER=$(RABBITMQ_USER) && \
	export RABBITMQ_PASSWORD=$(RABBITMQ_PASSWORD) && \
	docker-compose -f $(_RABBITMQ_DC_FILE)

# MongoDB
_MONGODB_DIR = _mongodb
_MONGODB_DC_FILE = $(_MONGODB_DIR)/docker-compose.yml
_MONGODB_CMD = export MONGODB_VERSION=$(MONGODB_VERSION) && \
	export MONGODB_PORT=$(MONGODB_PORT) && \
	export MONGODB_USER=$(MONGODB_USER) && \
	export MONGODB_PASSWORD=$(MONGODB_PASSWORD) && \
	docker-compose -f $(_MONGODB_DC_FILE)

# MySQL
_MYSQL_DIR = _mysql
_MYSQL_DC_FILE = $(_MYSQL_DIR)/docker-compose.yml
_MYSQL_CMD = export MYSQL_VERSION=$(MYSQL_VERSION) && \
	export MYSQL_PORT=$(MYSQL_PORT) && \
	export MYSQL_USER=$(MYSQL_USER) && \
	export MYSQL_PASSWORD=$(MYSQL_PASSWORD) && \
	export MYSQL_DATABASE=$(MYSQL_DATABASE) && \
	export MYSQL_DIR_DUMP=$(MYSQL_DIR_DUMP) && \
	docker-compose -f $(_MYSQL_DC_FILE)

# PostgreSQL
_POSTGRES_DIR = _postgres
_POSTGRES_DC_FILE = $(_POSTGRES_DIR)/docker-compose.yml
_POSTGRES_CMD = export POSTGRES_VERSION=$(POSTGRES_VERSION) && \
	export POSTGRES_PORT=$(POSTGRES_PORT) && \
	export POSTGRES_USER=$(POSTGRES_USER) && \
	export POSTGRES_PASSWORD=$(POSTGRES_PASSWORD) && \
	export POSTGRES_DB=$(POSTGRES_DB) && \
	docker-compose -f $(_POSTGRES_DC_FILE)

# FTP
_FTP_DIR = _ftp
_FTP_DC_FILE = $(_FTP_DIR)/docker-compose.yml
_FTP_CMD = export FTP_USER=$(FTP_USER) && \
	export FTP_PASSWORD=$(FTP_PASSWORD) && \
	docker-compose -f $(_FTP_DC_FILE)

# Minio(S3)
_MINIO_DIR = _minio
_MINIO_DC_FILE = $(_MINIO_DIR)/docker-compose.yml
_MINIO_CMD = MINIO_VERSION=$(MINIO_VERSION) && \
	export MINIO_PORT=$(MINIO_PORT) && \
	export MINIO_ACCESS_KEY=$(MINIO_ACCESS_KEY) && \
	export MINIO_SECRET_KEY=$(MINIO_SECRET_KEY) && \
	docker-compose -f $(_MINIO_DC_FILE)


show_all:
	@echo "enter:"
	@echo "\tmake clickhouse\t\t-> \trun ClickHouse:$(CLICKHOUSE_VERSION)"
	@echo "\tmake clickhouse_down\t-> \tdown ClickHouse"
	@echo "\tmake redis_cluster\t-> \trun Redis Cluster"
	@echo "\tmake redis_cluster_down\t-> \tdown Redis Cluster"
	@echo "\tmake redis\t\t-> \trun basic Redis:$(REDIS_BASIC_VERSION)"
	@echo "\tmake redis_down\t\t-> \tdown basic Redis"
	@echo "\tmake rabbitmq\t\t-> \trun RabbitMQ:$(RABBITMQ_VERSION)"
	@echo "\tmake rabbitmq_down\t-> \tdown RabbitMQ"
	@echo "\tmake mongodb\t\t-> \trun MongoDB:$(MONGODB_VERSION)"
	@echo "\tmake mongodb_down\t-> \tdown MongoDB"
	@echo "\tmake mysql\t\t-> \trun MySQL:$(MYSQL_VERSION)"
	@echo "\tmake mysql_down\t\t-> \tdown MySQL"
	@echo "\tmake minio\t\t-> \trun Minio(S3):$(MINIO_VERSION)"
	@echo "\tmake minio_down\t\t-> \tdown Minio(S3)"
	@echo "\tmake postgres\t\t-> \trun PostgreSQL:$(POSTGRES_VERSION)"
	@echo "\tmake postgres_down\t-> \tdown PostgreSQL"
	@echo ""
	@echo "\tmake attach c=mysql_dev\t-> \tshow log in live"
	@echo "\tmake connect c=mysql_dev-> \tenter inside container"


clickhouse:
	@-sed "s/<password><\/password>/<password>$(CLICKHOUSE_PASSWORD)<\/password>/" $(_CH_DIR)/users_template.xml | tee $(_CH_DIR)/users.xml
	$(_CH_DOCKERCOMPOSE_CMD) up -d
	@echo
	@echo "-----------------------------"
	@echo "clickhouse:$(CLICKHOUSE_VERSION)"
	@echo "url: http://localhost:$(CLICKHOUSE_PORT)"
	@echo "username: user"
	@echo "password: $(CLICKHOUSE_PASSWORD)"
	@echo "-----------------------------"

clickhouse_down:
	$(_CH_DOCKERCOMPOSE_CMD) down

mongodb:
	$(_MONGODB_CMD) up -d
	@echo
	@echo "-----------------------------"
	@echo "MongoDB:$(MONGODB_VERSION)"
	@echo "host: localhost:$(MONGODB_PORT)"
	@echo "username: $(MONGODB_USER)"
	@echo "password: $(MONGODB_PASSWORD)"
	@echo "-----------------------------"

mongodb_down:
	$(_MONGODB_CMD) down


mysql:
	$(_MYSQL_CMD) up -d
	@echo
	@echo "-----------------------------"
	@echo "MySQL:$(MYSQL_VERSION):"
	@echo "host: localhost:$(MYSQL_PORT)"
	@echo "username: $(MYSQL_USER)"
	@echo "password: $(MYSQL_PASSWORD)"
	@echo "database: $(MYSQL_DATABASE)"
	@echo "-----------------------------"

mysql_down:
	$(_MYSQL_CMD) down


postgres:
	$(_POSTGRES_CMD) up -d
	@echo
	@echo "-----------------------------"
	@echo "PostgreSQL:$(POSTGRES_VERSION)"
	@echo "host: localhost:$(POSTGRES_PORT)"
	@echo "username: $(POSTGRES_USER)"
	@echo "password: $(POSTGRES_PASSWORD)"
	@echo "databasse: $(POSTGRES_DB)"
	@echo "-----------------------------"

postgres_down:
	$(_POSTGRES_CMD) down


redis_cluster:
	$(_REDIS_CLUSTER_CMD) up -d
	sleep 5
	export REDIS_CLUSTER_PASSWORD=$(REDIS_CLUSTER_PASSWORD) && \
	sh $(_REDIS_CLUSTER_DIR)/set_password.sh
	@echo
	@echo "-----------------------------"
	@echo "Redis Cluster:"
	@echo "host: localhost:7000-7050"
	@echo "password: $(REDIS_CLUSTER_PASSWORD)"
	@echo "-----------------------------"

redis_cluster_down:
	$(_REDIS_CLUSTER_CMD) down


redis:
	$(_REDIS_BASIC_CMD) up -d
	@echo
	@echo "-----------------------------"
	@echo "Redis:$(REDIS_BASIC_VERSION)"
	@echo "host: localhost:$(REDIS_BASIC_PORT)"
	@echo "password: $(REDIS_BASIC_PASSWORD)"
	@echo "-----------------------------"

redis_down:
	$(_REDIS_BASIC_CMD) down


rabbitmq:
	$(_RABBITMQ_CMD) up -d
	@echo
	@echo "-----------------------------"
	@echo "RabbitMQ: $(RABBITMQ_VERSION)"
	@echo "host: localhost:$(RABBITMQ_PORT)"
	@echo "web: localhost:$(RABBITMQ_PORT_WEB)"
	@echo "username: $(RABBITMQ_USER)"
	@echo "password: $(RABBITMQ_PASSWORD)"
	@echo "-----------------------------"

rabbitmq_down:
	$(_RABBITMQ_CMD) down


ftp:
	$(_FTP_CMD) up -d
	@echo
	@echo "-----------------------------"
	@echo "FTP:"
	@echo "host: localhost:20"
	@echo "username: $(FTP_USER)"
	@echo "password: $(FTP_PASSWORD)"
	@echo "-----------------------------"

ftp_down:
	$(_FTP_CMD) down


minio:
	$(_MINIO_CMD) up -d
	@echo
	@echo "-----------------------------"
	@echo "Minio(S3):$(MINIO_VERSION)"
	@echo "host: localhost:$(MINIO_PORT)"
	@echo "access_key: $(MINIO_ACCESS_KEY)"
	@echo "secret_key: $(MINIO_SECRET_KEY)"
	@echo "-----------------------------"

minio_down:
	$(_MINIO_CMD) down


attach:
	docker container logs -f $(c)

connect:
	docker exec -it $(c) su
