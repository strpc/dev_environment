# dev environment.

Run environment for develop in one command.

Requirements:
1. [docker](https://docs.docker.com/engine/install/)
2. [docker-compose](https://docs.docker.com/compose/install/)
---
`make show_all` - show all commands
```bash
enter:

        make clickhouse         ->      run ClickHouse:latest on port 8123
        make clickhouse_down    ->      down ClickHouse

        make redis_cluster      ->      run Redis Cluster on ports 7000-7050
        make redis_cluster_down ->      down Redis Cluster

        make redis              ->      run basic Redis:latest on port 6379
        make redis_down         ->      down basic Redis

        make rabbitmq           ->      run RabbitMQ:3-management on port 5672, 8080(web)
        make rabbitmq_down      ->      down RabbitMQ

        make mongodb            ->      run MongoDB:latest on port 27017
        make mongodb_down       ->      down MongoDB

        make mysql              ->      run MySQL:5.7 on port 3306
        make mysql_down         ->      down MySQL

        make minio              ->      run Minio(S3):latest on port 9000
        make minio_down         ->      down Minio(S3)

        make postgres           ->      run PostgreSQL:latest on port 5432
        make postgres_down      ->      down PostgreSQL

        make logs c=mysql_dev   ->      show log in live
        make enter c=mysql_dev  ->      enter inside container
```

---

The versions, name of containers, ports, passwords and users variables can be edited in the `.env` file.


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
example use:
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
