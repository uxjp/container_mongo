#!/bin/bash

CONTAINER_NAME=mymongo

# Start the MongoDB container
docker run --name $CONTAINER_NAME -d -p 27017:27017 mongo
#  container should not exist previously
