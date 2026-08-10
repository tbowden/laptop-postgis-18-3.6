#!/bin/bash

# For debugging new scripts, you may also want to add -x to set
# so bash will print each command as it executes
set -euo pipefail 

# For debugging pqsl commands add -a (print input lines) and
# -e (echo commands sent to the server)
psql -v ON_ERROR_STOP=1 \
  --username "$POSTGRES_USER" \
  --dbname postgres \
  --set normal_user="$NORMAL_USER" \
  --set normal_user_password="$NORMAL_USER_PASSWORD" \
<<'EOSQL'

  SELECT format(
  'CREATE ROLE %I WITH LOGIN CREATEDB CREATEROLE PASSWORD %L',
    :'normal_user', 
    :'normal_user_password'
  )
  \gexec
EOSQL
