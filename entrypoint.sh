#!/bin/bash
set -e

echo "DB is up and running!"

bundle exec rake db:create db:migrate
echo "DB database has been created & migrated!"

rm -f /backend/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
