# dev environment.

Run environment for develop in one command.

Requirements:
1. [make](https://www.gnu.org/software/make/)
2. [docker](https://docs.docker.com/engine/install/)
3. [docker-compose](https://docs.docker.com/compose/install/)
---

Install to [alias](./.dev_aliases.sh):
```shell
curl -s "https://raw.githubusercontent.com/strpc/dev_environment/master/install.sh" | bash
```
_or | bash -p /and/some/path/to/install_


Manual install:
```shell
git clone https://github.com/strpc/dev_environment
cd dev_environment
cp .env.example .env
```

Versions, name of containers, ports, passwords and users variables can be edited in the `.env` file.

---

`make show_all` - show all commands
```bash
enter:

        make clickhouse         ->      run ClickHouse:latest on port 8123
        make clickhouse_down    ->      down ClickHouse

        make mongodb            ->      run MongoDB:latest on port 27017
        make mongodb_down       ->      down MongoDB

        make mysql              ->      run MySQL:5.7 on port 3306
        make mysql_down         ->      down MySQL
        make mysql_query_log    ->      show log query in live

        make postgres           ->      run PostgreSQL:latest on port 5432
        make postgres_down      ->      down PostgreSQL

        make redis_cluster      ->      run Redis Cluster on ports 7000-7050
        make redis_cluster_down ->      down Redis Cluster

        make redis              ->      run basic Redis:latest on port 6379
        make redis_down         ->      down basic Redis

        make rabbitmq           ->      run RabbitMQ:3-management on port 5672, 8080(web)
        make rabbitmq_down      ->      down RabbitMQ

        make kafka              ->      run Kafka:latest on port 9094
        make kafka_down         ->      down Kafka

        make nats_cluster       ->      run NATS Cluster:latest on port 4222
        make nats_cluster_down  ->      down NATS Cluster

        make nats               ->      run NATS:latest on port 4222
        make nats_down          ->      down NATS

        make ftp                ->      run FTP:latest on port 20-21
        make ftp_down           ->      down FTP

        make minio              ->      run Minio(S3):latest on port 9000
        make minio_down         ->      down Minio(S3)

        make logs c=mysql_dev   ->      show log in live
        make enter c=mysql_dev  ->      enter inside container
```

---

Dirs for dumps(`*.sql`, `*.sql.gz`, or `*.sh`):
```bash
├── _clickhouse
│   └── clickhouse_dump
├── _mysql
│   └── mysql_dump
├── _postgres
│   └── postgres_dump
```

---
example usage:
```bash
$ make rabbitmq
-----------------------------
RabbitMQ: 3-management
container_name: rabbimq_dev
host: localhost:5672
web: localhost:8080
username: user
password: hackme
-----------------------------
```
