# dev environment.


`make show_all` - view all commands
```bash
make clickhouse - run ClickHouse
make clickhouse_down - down ClickHouse
make redis_cluster - run Redis Cluster
make redis_cluster_down - down Redis Cluster
make redis - run basic Redis
make redis_down - down basic Redis
make rabbitmq - run RabbitMQ
make rabbitmq_down - down RabbitMQ
make mongodb - run MongoDB
make mongodb_down - down MongoDB
make mysql - run MySQL:5.7
make mysql_down - down MySQL
make minio - run Minio(S3)
make minio_down - down Minio(S3)
make postgres - run PostSQL
make postgres_down - down PostSQL
```
---

example:
```bash
make rabbitmq
-----------------------------
RabbitMQ:
host: localhost:5672
web: localhost:8080
username: user
password: hackme
-----------------------------
```


The passwords and users variables can be edited in the `vars.env` file.
