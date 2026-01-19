#!/bin/bash
echo "📥 Importing initial MongoDB data..."

mongoimport \
  --db wanderlust \
  --collection posts \
  --file /docker-entrypoint-initdb.d/sample_posts.json \
  --jsonArray

echo "✅ MongoDB data imported"
