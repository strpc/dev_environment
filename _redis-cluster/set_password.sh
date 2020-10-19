#/bin/bash
docker exec -it docker-redis-cluster_dev redis-cli -p 7000 config set requirepass $REDIS_CLUSTER_PASSWORD
docker exec -it docker-redis-cluster_dev redis-cli -p 7001 config set requirepass $REDIS_CLUSTER_PASSWORD
docker exec -it docker-redis-cluster_dev redis-cli -p 7002 config set requirepass $REDIS_CLUSTER_PASSWORD
docker exec -it docker-redis-cluster_dev redis-cli -p 7003 config set requirepass $REDIS_CLUSTER_PASSWORD
docker exec -it docker-redis-cluster_dev redis-cli -p 7004 config set requirepass $REDIS_CLUSTER_PASSWORD
docker exec -it docker-redis-cluster_dev redis-cli -p 7005 config set requirepass $REDIS_CLUSTER_PASSWORD
