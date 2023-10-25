FROM python:3.11
ARG PGSYNC_VERSION=2.5.0
ARG SCHEMA_VERSION=1.0.0

LABEL org.label-schema.name "pgsync"
LABEL org.label-schema.description "Postgres to OpenSearch sync"
LABEL com.label-schema.service-type "daemon"

ENV ELASTICSEARCH=false OPENSEARCH=true LOG_LEVEL=INFO SCHEMA_VERSION=${SCHEMA_VERSION} PATH=/pgsync/bin:${PATH}

WORKDIR /pgsync
ADD . .

RUN pip install -e .


ENTRYPOINT [ "runserver.sh" ]
