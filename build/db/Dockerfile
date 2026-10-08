# Overlay of google-ctf 2020/quals/web-log-me-in/Dockerfile (the MySQL side, vendored unchanged in app/).
# What differs from upstream:
# - the base image is pinned to mysql/mysql-server:8.0.21 (the current release at Google CTF 2020)
#   instead of `latest`;
# - the COPY sources point into app/ (this folder is the build context).
# Everything else is upstream's, line for line.
FROM mysql/mysql-server:8.0.21

ENV MYSQL_ROOT_PASSWORD "kajsdfouyhsdfhl"

COPY app/sql/dbsetup.sh /docker-entrypoint-initdb.d/
run chmod +x /docker-entrypoint-initdb.d/dbsetup.sh
COPY app/sql/setup.sql /
