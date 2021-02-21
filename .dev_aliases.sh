alias dev_start_clickhouse="cd install_path && make clickhouse && cd -"
alias dev_stop_clickhouse="cd install_path && make clickhouse_down && cd -"

alias dev_start_mongodb="cd install_path && make mongodb && cd -"
alias dev_stop_mongodb="cd install_path && make mongodb_down && cd -"

alias dev_start_mysql="cd install_path && make mysql && cd -"
alias dev_stop_mysql="cd install_path && make mysql_down && cd -"
alias dev_mysql_query_log="cd install_path && make mysql_query_log && cd -"

alias dev_start_postgres="cd install_path && make postgres && cd -"
alias dev_stop_postgres="cd install_path && make postgres_down && cd -"

alias dev_start_redis_cluster="cd install_path && make redis_cluster && cd -"
alias dev_stop_redis_cluster="cd install_path && make redis_cluster_down && cd -"

alias dev_start_redis="cd install_path && make redis && cd -"
alias dev_stop_redis="cd install_path && make redis_down && cd -"

alias dev_start_rabbitmq="cd install_path && make rabbitmq && cd -"
alias dev_stop_rabbitmq="cd install_path && make rabbitmq_down && cd -"

alias dev_start_ftp="cd install_path && make ftp && cd -"
alias dev_stop_ftp="cd install_path && make ftp_down && cd -"

alias dev_start_nats="cd install_path && make nats && cd -"
alias dev_stop_nats="cd install_path && make nats_down && cd -"

alias dev_start_nats_cluster="cd install_path && make nats_cluster && cd -"
alias dev_stop_nats_cluster="cd install_path && make nats_cluster_down && cd -"

alias dev_start_kafka="cd install_path && make kafka && cd -"
alias dev_stop_kafka="cd install_path && make kafka_down && cd -"
