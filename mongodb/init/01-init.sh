#!/bin/bash
set -e

echo "Seeding MongoDB..."

mongoimport \
  --db wanderlust \
  --collection posts \
  --file /docker-entrypoint-initdb.d/sample_posts.json \
  --jsonArray

echo "MongoDB seed completed"
