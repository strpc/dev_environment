# dev environment.

Run environment for develop in one command.

Requirements:
1. [docker](https://docs.docker.com/engine/install/)
2. [docker-compose](https://docs.docker.com/compose/install/)
---
`make show_all` - view all commands
```bash
enter:
        make clickhouse         ->      run ClickHouse:latest
        make clickhouse_down    ->      down ClickHouse
        make redis_cluster      ->      run Redis Cluster
        make redis_cluster_down ->      down Redis Cluster
        make redis              ->      run basic Redis:latest
        make redis_down         ->      down basic Redis
        make rabbitmq           ->      run RabbitMQ:3-management
        make rabbitmq_down      ->      down RabbitMQ
        make mongodb            ->      run MongoDB:latest
        make mongodb_down       ->      down MongoDB
        make mysql              ->      run MySQL:5.7
        make mysql_down         ->      down MySQL
        make minio              ->      run Minio(S3):latest
        make minio_down         ->      down Minio(S3)
        make postgres           ->      run PostgreSQL:latest
        make postgres_down      ->      down PostgreSQL

        make attach c=mysql_dev ->      show log in live
        make connect c=mysql_dev->      enter inside container
```
---

example:
```bash
make rabbitmq
-----------------------------
RabbitMQ: 3-management
host: localhost:5672
web: localhost:8080
username: user
password: hackme
-----------------------------
```


The versions, ports, passwords and users variables can be edited in the `vars.env` file.
