#!/bin/bash

set -euxo pipefail 

psql -v ON_ERROR_STOP=1 \
  --username "$POSTGRES_USER" \
  --dbname postgres \
  -c 'CREATE DATABASE postgis_template;'
  
psql -v ON_ERROR_STOP=1 \
  --username "$POSTGRES_USER" \
  --dbname postgis_template \
<<'EOSQL'
  CREATE EXTENSION postgis;
  UPDATE pg_database SET datistemplate = true, datallowconn = false WHERE datname = 'postgis_template';
EOSQL
