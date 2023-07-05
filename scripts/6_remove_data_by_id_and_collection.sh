#!/bin/bash

ENTRY_ID=$1
COLLECTION=${2:-"tenant_driver"}
CONTAINER_NAME=${3:-mongo_db_4_uploader}
CONTAINER_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $CONTAINER_NAME)

mongosh "mongodb://$CONTAINER_IP:27017/multi_tenant_uploader" --eval "db.$COLLECTION.deleteOne({ _id: ObjectId('$ENTRY_ID') })"

