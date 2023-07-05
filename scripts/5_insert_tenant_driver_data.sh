#!/bin/bash

FILE_PATH=$1
COLLECTION=${2:-"tenant_driver"}
CONTAINER_NAME=${3:-mongo_db_4_uploader}
CONTAINER_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $CONTAINER_NAME)

echo $CONTAINER_IP
if [ -z "$FILE_PATH" ]; then
  echo "Error: File argument is missing."
  echo "Usage: $0 collection_name file_path"
  exit 1
fi

if [ ! -f "$FILE_PATH" ]; then
  echo "Error: File '$FILE_PATH' does not exist."
  exit 1
fi

DOCUMENT=$(cat "$FILE_PATH")

mongosh "mongodb://$CONTAINER_IP:27017/multi_tenant_uploader" --eval "db.$COLLECTION.insertOne($DOCUMENT);"
