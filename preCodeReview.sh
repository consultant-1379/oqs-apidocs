#!/bin/bash
export COMPOSE_PROJECT_NAME="oqs_apidocs_tests"

# Begin Docker procedure
time docker-compose down --volumes
if [[ $? -ne 0 ]]
then
    echo ok
fi
time docker-compose build
if [[ $? -ne 0 ]]
then
    exit 1
fi

time docker-compose down --volumes
