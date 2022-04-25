#!/bin/bash

NODE_ENV=production;
# replace the next path by your config folder path (Bad configured path will cause unreachable config server error)
CONFIG_FOLDER="$HOME/dotstatsuitejs/config";

cd config
NODE_ENV=$NODE_ENV DEBUG=config* SERVER_PORT=5007 BUCKET_PROVIDER=fs DATA_DIR=$CONFIG_FOLDER pm2 start --no-autorestart -n config dist/server
cd ..

cd search
NODE_ENV=$NODE_ENV \
DEBUG=sfs* \
SERVER_PORT=3004 \
CONFIG_URL=http://localhost:5007 \
DEFAULT_TENANT=default \
MONGODB_URL=mongodb://mongo:27017 \
MONGODB_DATABASE=sfs \
SOLR_HOST=localhost \
REDIS_DB=1 \
API_KEY=secret \
pm2 start --no-autorestart -n search dist/server
cd ..

cd share
NODE_ENV=$NODE_ENV DEBUG=share* PORT=3005 CONFIG_URL=http://localhost:5007 REDIS_HOST=localhost SITE_URL=http://localhost:7001/share REDIS_DB=0 pm2 start --no-autorestart -n share dist/server
cd ..

cd explorer
NODE_ENV=$NODE_ENV DEBUG=webapp* SERVER_PORT=7001 CONFIG_URL=http://localhost:5007 pm2 start --no-autorestart -n data-explorer dist/server
cd ..

cd viewer
NODE_ENV=$NODE_ENV DEBUG=webapp* SERVER_PORT=7002 CONFIG_URL=http://localhost:5007 pm2 start --no-autorestart -n data-viewer dist/server
cd ..

cd dlm
NODE_ENV=$NODE_ENV \
DEBUG=webapp* \
SERVER_PORT=7000 \
TRANSFER_SERVER_URL="http://replace-your-transfer-service.com" \
AUTH_SERVER_URL="http://localhost:8080" \
CONFIG_URL=http://localhost:5007 \
pm2 start --no-autorestart -n data-lifecycle-manager dist/server 
cd ..

pm2 save
pm2 delete all
