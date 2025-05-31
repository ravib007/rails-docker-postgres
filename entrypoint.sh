# AUTHOR : RAVI KUMAR
# entrypoint.sh
#!/bin/bash
set -e

# Remove server PID
rm -f /app/tmp/pids/server.pid

# Setup database if needed
if ! bundle exec rails db:exists 2>/dev/null; then
  echo "Creating and migrating database..."
  bundle exec rails db:create db:migrate
fi

exec "$@"
