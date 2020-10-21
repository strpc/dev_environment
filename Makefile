include vars.env

# ClickHouse
_CH_DIR = _clickhouse
_CH_DC_FILE = $(_CH_DIR)/docker-compose.yml
_CH_DOCKERCOMPOSE_CMD = docker-compose -f $(_CH_DC_FILE)

# Redis Cluster
_REDIS_CLUSTER_DIR = _redis-cluster
_REDIS_CLUSTER_DC_FILE = $(_REDIS_CLUSTER_DIR)/docker-compose.yml
_REDIS_CLUSTER_CMD = docker-compose -f $(_REDIS_CLUSTER_DC_FILE)

# Redis Basic
_REDIS_BASIC_DIR = _redis-basic
_REDIS_BASIC_DC_FILE = $(_REDIS_BASIC_DIR)/docker-compose.yml
_REDIS_BASIC_CMD = docker-compose -f $(_REDIS_BASIC_DC_FILE)

# RabbitMQ
_RABBITMQ_DIR = _rabbitmq
_RABBITMQ_DC_FILE = $(_RABBITMQ_DIR)/docker-compose.yml
_RABBITMQ_CMD = docker-compose -f $(_RABBITMQ_DC_FILE)

# MongoDB
_MONGODB_DIR = _mongodb
_MONGODB_DC_FILE = $(_MONGODB_DIR)/docker-compose.yml
_MONGODB_CMD = docker-compose -f $(_MONGODB_DC_FILE)

# MySQL
_MYSQL_DIR = _mysql
_MYSQL_DC_FILE = $(_MYSQL_DIR)/docker-compose.yml
_MYSQL_CMD = docker-compose -f $(_MYSQL_DC_FILE)

# PostgreSQL
_POSTGRES_DIR = _postgres
_POSTGRES_DC_FILE = $(_POSTGRES_DIR)/docker-compose.yml
_POSTGRES_CMD = docker-compose -f $(_POSTGRES_DC_FILE)

# FTP
_FTP_DIR = _ftp
_FTP_DC_FILE = $(_FTP_DIR)/docker-compose.yml
_FTP_CMD = docker-compose -f $(_FTP_DC_FILE)

# Minio(S3)
_MINIO_DIR = _minio
_MINIO_DC_FILE = $(_MINIO_DIR)/docker-compose.yml
_MINIO_CMD = docker-compose -f $(_MINIO_DC_FILE)


show_all:
	@echo "make clickhouse - run ClickHouse"
	@echo "make clickhouse_down - down ClickHouse"
	@echo "make redis_cluster - run Redis Cluster"
	@echo "make redis_cluster_down - down Redis Cluster"
	@echo "make redis - run basic Redis"
	@echo "make redis_down - down basic Redis"
	@echo "make rabbitmq - run RabbitMQ"
	@echo "make rabbitmq_down - down RabbitMQ"
	@echo "make mongodb - run MongoDB"
	@echo "make mongodb_down - down MongoDB"
	@echo "make mysql - run MySQL:$(MYSQL_VERSION)"
	@echo "make mysql_down - down MySQL"
	@echo "make minio - run Minio(S3)"
	@echo "make minio_down - down Minio(S3)"
	@echo "make postgres - run PostSQL"
	@echo "make postgres_down - down PostSQL"
	@echo "make attach c=mysql_dev - show log in live"
	@echo "make connect c=mysql_dev - enter inside container"


clickhouse:
	@-sed "s/<password><\/password>/<password>$(CLICKHOUSE_PASSWORD)<\/password>/" $(_CH_DIR)/users_template.xml | tee $(_CH_DIR)/users.xml
	$(_CH_DOCKERCOMPOSE_CMD) up -d
	@echo
	@echo "-----------------------------"
	@echo "clickhouse:"
	@echo "url: http://localhost:8123"
	@echo "username: user"
	@echo "password: $(CLICKHOUSE_PASSWORD)"
	@echo "-----------------------------"

clickhouse_down:
	$(_CH_DOCKERCOMPOSE_CMD) down


redis_cluster:
	export REDIS_CLUSTER_IP=0.0.0.0 && \
	$(_REDIS_CLUSTER_CMD) up -d
	sleep 5
	export REDIS_CLUSTER_PASSWORD=$(REDIS_CLUSTER_PASSWORD) && \
	sh $(_REDIS_CLUSTER_DIR)/set_password.sh
	@echo
	@echo "-----------------------------"
	@echo "Redis Cluster:"
	@echo "host: localhost:7000-7005"
	@echo "password: $(REDIS_CLUSTER_PASSWORD)"
	@echo "-----------------------------"

redis_cluster_down:
	$(_REDIS_CLUSTER_CMD) down


redis:
	export REDIS_BASIC_PASSWORD=$(REDIS_BASIC_PASSWORD) && \
	$(_REDIS_BASIC_CMD) up -d
	@echo
	@echo "-----------------------------"
	@echo "Redis:"
	@echo "host: localhost:6379"
	@echo "password: $(REDIS_BASIC_PASSWORD)"
	@echo "-----------------------------"

redis_down:
	$(_REDIS_BASIC_CMD) down


rabbitmq:
	export RABBITMQ_USER=$(RABBITMQ_USER) && \
	export RABBITMQ_PASSWORD=$(RABBITMQ_PASSWORD) && \
	$(_RABBITMQ_CMD) up -d
	@echo
	@echo "-----------------------------"
	@echo "RabbitMQ:"
	@echo "host: localhost:5672"
	@echo "web: localhost:8080"
	@echo "username: $(RABBITMQ_USER)"
	@echo "password: $(RABBITMQ_PASSWORD)"
	@echo "-----------------------------"

rabbitmq_down:
	$(_RABBITMQ_CMD) down


mongodb:
	export MONGODB_USER=$(MONGODB_USER) && \
	export MONGODB_PASSWORD=$(MONGODB_PASSWORD) && \
	$(_MONGODB_CMD) up -d
	@echo
	@echo "-----------------------------"
	@echo "MongoDB:"
	@echo "host: localhost:27017"
	@echo "username: $(MONGODB_USER)"
	@echo "password: $(MONGODB_PASSWORD)"
	@echo "-----------------------------"

mongodb_down:
	$(_MONGODB_CMD) down


ftp:
	export FTP_USER=$(FTP_USER) && \
	export FTP_PASSWORD=$(FTP_PASSWORD) && \
	$(_FTP_CMD) up -d
	@echo
	@echo "-----------------------------"
	@echo "FTP:"
	@echo "host: localhost:27017"
	@echo "username: $(FTP_USER)"
	@echo "password: $(FTP_PASSWORD)"
	@echo "-----------------------------"

ftp_down:
	$(_FTP_CMD) down


mysql:
	export MYSQL_USER=$(MYSQL_USER) && \
	export MYSQL_PASSWORD=$(MYSQL_PASSWORD) && \
	export MYSQL_DATABASE=$(MYSQL_DATABASE) && \
	export MYSQL_VERSION=$(MYSQL_VERSION) && \
	$(_MYSQL_CMD) up -d
	@echo
	@echo "-----------------------------"
	@echo "MySQLv$(MYSQL_VERSION):"
	@echo "host: localhost:3306"
	@echo "username: $(MYSQL_USER)"
	@echo "password: $(MYSQL_PASSWORD)"
	@echo "database: $(MYSQL_DATABASE)"
	@echo "-----------------------------"

mysql_down:
	$(_MYSQL_CMD) down


minio:
	export MINIO_ACCESS_KEY=$(MINIO_ACCESS_KEY) && \
	export MINIO_SECRET_KEY=$(MINIO_SECRET_KEY) && \
	$(_MINIO_CMD) up -d
	@echo
	@echo "-----------------------------"
	@echo "Minio(S3):"
	@echo "host: localhost:9000"
	@echo "access_key: $(MINIO_ACCESS_KEY)"
	@echo "secret_key: $(MINIO_SECRET_KEY)"
	@echo "-----------------------------"

minio_down:
	$(_MINIO_CMD) down


postgres:
	export POSTGRES_USER=$(POSTGRES_USER) && \
	export POSTGRES_PASSWORD=$(POSTGRES_PASSWORD) && \
	export POSTGRES_DB=$(POSTGRES_DB) && \
	$(_POSTGRES_CMD) up -d
	@echo
	@echo "-----------------------------"
	@echo "PostgreSQL:"
	@echo "host: localhost:5432"
	@echo "username: $(POSTGRES_USER)"
	@echo "password: $(POSTGRES_PASSWORD)"
	@echo "databasse: $(POSTGRES_DB)"
	@echo "-----------------------------"

postgres_down:
	$(_POSTGRES_CMD) down

attach:
	docker container logs -f $(c)

connect:
	docker exec -it $(c) su
