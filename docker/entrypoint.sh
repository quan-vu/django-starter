#!/bin/sh

# Verify that Postgres is healthy before applying the migrations 
# and running the Django development server
# Don't forget update the file permissions locally:
# $ chmod +x app/entrypoint.sh

if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for postgres..."

    while ! nc -z $SQL_HOST $SQL_PORT; do
      sleep 0.1
    done

    echo "PostgreSQL started"
fi

python manage.py flush --no-input
python manage.py migrate

exec "$@"