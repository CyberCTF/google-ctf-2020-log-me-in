#!/bin/sh
# The login form answers a wrong password from the database (the app reaches MySQL and the users table).
set -e
curl -fsS -d 'username=michelle&password=wrong' http://log-me-in:8088/login | grep -q "Invalid username or password"
