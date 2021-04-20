include .env

.SILENT:

.DEFAULT_GOAL := show_all

ENV_FILE = ./.env

export $(shell sed 's/=.*//' .env)


_CLICKHOUSE_ROOT = _clickhouse
_MONGODB_ROOT = _mongodb
_MYSQL_ROOT = _mysql
_POSTGRES_ROOT = _postgres
_REDIS_CLUSTER_ROOT = _redis-cluster
_REDIS_BASIC_ROOT = _redis-basic
_RABBITMQ_ROOT = _rabbitmq
_KAFKA_ROOT=_kafka
_NATS_ROOT = _nats
_NATS_CLUSTER_ROOT = _nats_cluster
_FTP_ROOT = _ftp
_MINIO_ROOT = _minio
_FLOWER_ROOT = _flower


show_all:
	@echo "enter:"
	@echo ""
	@echo "\tmake clickhouse\t\t-> \trun ClickHouse:$(CLICKHOUSE_VERSION) on port $(CLICKHOUSE_PORT)"
	@echo "\tmake clickhouse_down\t-> \tdown ClickHouse"
	@echo ""
	@echo "\tmake mongodb\t\t-> \trun MongoDB:$(MONGODB_VERSION) on port $(MONGODB_PORT)"
	@echo "\tmake mongodb_down\t-> \tdown MongoDB"
	@echo ""
	@echo "\tmake mysql\t\t-> \trun MySQL:$(MYSQL_VERSION) on port $(MYSQL_PORT)"
	@echo "\tmake mysql_down\t\t-> \tdown MySQL"
	@echo "\tmake mysql_query_log\t-> \tshow log query in live"
	@echo ""
	@echo "\tmake postgres\t\t-> \trun PostgreSQL:$(POSTGRES_VERSION) on port $(POSTGRES_PORT)"
	@echo "\tmake postgres_down\t-> \tdown PostgreSQL"
	@echo ""
	@echo "\tmake redis_cluster\t-> \trun Redis Cluster on ports 7000-7050"
	@echo "\tmake redis_cluster_down\t-> \tdown Redis Cluster"
	@echo ""
	@echo "\tmake redis\t\t-> \trun basic Redis:$(REDIS_BASIC_VERSION) on port $(REDIS_BASIC_PORT)"
	@echo "\tmake redis_down\t\t-> \tdown basic Redis"
	@echo ""
	@echo "\tmake rabbitmq\t\t-> \trun RabbitMQ:$(RABBITMQ_VERSION) on port $(RABBITMQ_PORT), $(RABBITMQ_PORT_WEB)(web)"
	@echo "\tmake rabbitmq_down\t-> \tdown RabbitMQ"
	@echo ""
	@echo "\tmake kafka\t\t-> \trun Kafka:$(KAFKA_VERSION) on port $(KAFKA_PORT)"
	@echo "\tmake kafka_down\t\t-> \tdown Kafka"
	@echo ""
	@echo "\tmake nats_cluster\t-> \trun NATS Cluster:$(NATS_VERSION) on port $(NATS_PORT)"
	@echo "\tmake nats_cluster_down\t-> \tdown NATS Cluster"
	@echo ""
	@echo "\tmake nats\t\t-> \trun NATS:$(NATS_VERSION) on port $(NATS_PORT)"
	@echo "\tmake nats_down\t\t-> \tdown NATS"
	@echo ""
	@echo "\tmake ftp\t\t-> \trun FTP:$(FTP_VERSION) on port 20-21"
	@echo "\tmake ftp_down\t\t-> \tdown FTP"
	@echo ""
	@echo "\tmake minio\t\t-> \trun Minio(S3):$(MINIO_VERSION) on port $(MINIO_PORT)"
	@echo "\tmake minio_down\t\t-> \tdown Minio(S3)"
	@echo ""
	@echo "\tmake flower\t\t-> \trun Flower:$(FLOWER_VERSION) on port $(FLOWER_PORT)"
	@echo "\tmake flower_down\t-> \tdown Flower"
	@echo ""
	@echo "\tmake logs c=mysql_dev\t-> \tshow log in live"
	@echo "\tmake enter c=mysql_dev\t-> \tenter inside container"

logs:
	docker container logs -f $(c)

enter:
	docker exec -it $(c) su


#-----services:
clickhouse:
	$(MAKE) --directory=$(_CLICKHOUSE_ROOT) clickhouse

clickhouse_down:
	$(MAKE) --directory=$(_CLICKHOUSE_ROOT) clickhouse_down


mongodb:
	$(MAKE) --directory=$(_MONGODB_ROOT) mongodb
mongodb_down:
	$(MAKE) --directory=$(_MONGODB_ROOT) mongodb_down


mysql:
	$(MAKE) --directory=$(_MYSQL_ROOT) mysql

mysql_down:
	$(MAKE) --directory=$(_MYSQL_ROOT) mysql_down

mysql_query_log:
	$(MAKE) --directory=$(_MYSQL_ROOT) mysql_query_log


postgres:
	$(MAKE) --directory=$(_POSTGRES_ROOT) postgres
postgres_down:
	$(MAKE) --directory=$(_POSTGRES_ROOT) postgres_down


redis_cluster:
	$(MAKE) --directory=$(_REDIS_CLUSTER_ROOT) redis_cluster

redis_cluster_down:
	$(MAKE) --directory=$(_REDIS_CLUSTER_ROOT) redis_cluster_down


redis:
	$(MAKE) --directory=$(_REDIS_BASIC_ROOT) redis

redis_down:
	$(MAKE) --directory=$(_REDIS_BASIC_ROOT) redis_down


rabbitmq:
	$(MAKE) --directory=$(_RABBITMQ_ROOT) rabbitmq

rabbitmq_down:
	$(MAKE) --directory=$(_RABBITMQ_ROOT) rabbitmq_down


kafka:
	$(MAKE) --directory=$(_KAFKA_ROOT) kafka

kafka_down:
	$(MAKE) --directory=$(_KAFKA_ROOT) kafka_down


nats_cluster:
	$(MAKE) --directory=$(_NATS_CLUSTER_ROOT) nats_cluster

nats_cluster_down:
	$(MAKE) --directory=$(_NATS_CLUSTER_ROOT) nats_cluster_down


nats:
	$(MAKE) --directory=$(_NATS_ROOT) nats

nats_down:
	$(MAKE) --directory=$(_NATS_ROOT) nats_down


ftp:
	$(MAKE) --directory=$(_FTP_ROOT) ftp

ftp_down:
	$(MAKE) --directory=$(_FTP_ROOT) ftp_down


minio:
	$(MAKE) --directory=$(_MINIO_ROOT) minio

minio_down:
	$(MAKE) --directory=$(_MINIO_ROOT) minio_down

flower:
	$(MAKE) --directory=$(_FLOWER_ROOT) flower
flower_down:
	$(MAKE) --directory=$(_FLOWER_ROOT) flower_down
