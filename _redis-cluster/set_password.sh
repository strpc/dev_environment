#/bin/bash
docker exec -it ${REDIS_CLUSTER_CONTAINER_NAME} redis-cli -p 7000 config set requirepass ${REDIS_CLUSTER_PASSWORD} &> /dev/null
docker exec -it ${REDIS_CLUSTER_CONTAINER_NAME} redis-cli -p 7001 config set requirepass ${REDIS_CLUSTER_PASSWORD} &> /dev/null
docker exec -it ${REDIS_CLUSTER_CONTAINER_NAME} redis-cli -p 7002 config set requirepass ${REDIS_CLUSTER_PASSWORD} &> /dev/null
docker exec -it ${REDIS_CLUSTER_CONTAINER_NAME} redis-cli -p 7003 config set requirepass ${REDIS_CLUSTER_PASSWORD} &> /dev/null
docker exec -it ${REDIS_CLUSTER_CONTAINER_NAME} redis-cli -p 7004 config set requirepass ${REDIS_CLUSTER_PASSWORD} &> /dev/null
docker exec -it ${REDIS_CLUSTER_CONTAINER_NAME} redis-cli -p 7005 config set requirepass ${REDIS_CLUSTER_PASSWORD} &> /dev/null
