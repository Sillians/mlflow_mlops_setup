#!/bin/bash

set -e
set -u


# Use the default postgres user if POSTGRES_USER is unset
USER="${POSTGRES_USER:-postgres}"

if [ -n "$POSTGRES_MULTIPLE_DATABASES" ]; then
    echo "Multiple database creation requested: $POSTGRES_MULTIPLE_DATABASES"
    # Split by comma
    for db in ${POSTGRES_MULTIPLE_DATABASES//,/ }; do
        echo "  Creating database: $db"
        psql -v ON_ERROR_STOP=1 --username "$USER" --dbname "postgres" <<-EOSQL
            CREATE DATABASE $db;
            GRANT ALL PRIVILEGES ON DATABASE $db TO $USER;
EOSQL
    done
    echo "Multiple databases created"
fi