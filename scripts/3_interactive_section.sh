#!bin/bash

CONTAINER_NAME=${1:-mongo_db_4_uploader}

CONTAINER_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $CONTAINER_NAME)

mongosh "mongodb://$CONTAINER_IP:27017/multi_tenant_uploader"
