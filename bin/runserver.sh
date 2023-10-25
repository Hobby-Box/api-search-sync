#! /bin/sh

wait-for-it.sh $PG_HOST:$PG_PORT -t 60
wait-for-it.sh $ELASTICSEARCH_HOST:$ELASTICSEARCH_PORT -t 60
wait-for-it.sh $REDIS_HOST:$REDIS_PORT -t 60

SCHEMA_FILE=/pgsync/hobbybox/schema-${SCHEMA_VERSION}.json

bootstrap --config ${SCHEMA_FILE}
pgsync --config ${SCHEMA_FILE} --daemon