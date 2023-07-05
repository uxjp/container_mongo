#!bin/bash

CONTAINER_NAME=${1:-mongo_db_4_uploader}
INTERNAL_DB_NAME=${2:-multi_tenant_uploader}
CONTAINER_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $CONTAINER_NAME)

# query tenant_driver
mongosh "mongodb://$CONTAINER_IP:27017/multi_tenant_uploader" --eval "db.tenant_driver.find()"

# query arquivo
mongosh "mongodb://$CONTAINER_IP:27017/multi_tenant_uploader" --eval "db.arquivo.find()"
