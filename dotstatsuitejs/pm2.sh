#!/bin/bash

NODE_ENV=production;

cd config
NODE_ENV=$NODE_ENV DEBUG=config* PORT=5007 pm2 start --no-autorestart -n config dist/server
cd ..

cd search
NODE_ENV=$NODE_ENV DEBUG=sfs* SERVER_PORT=3007 CONFIG_URL=http://localhost:5007 DEFAULT_TENANT=default REDIS_HOST=localhost SOLR_HOST=localhost REDIS_DB=1 pm2 start --no-autorestart -n search dist/server
cd ..

cd share
NODE_ENV=$NODE_ENV DEBUG=share* PORT=3006 CONFIG_URL=http://localhost:5007 REDIS_HOST=localhost SITE_URL=http://localhost:3006 REDIS_DB=0 pm2 start --no-autorestart -n share dist/server
cd ..

cd explorer
NODE_ENV=$NODE_ENV DEBUG=webapp* SERVER_PORT=3009 CONFIG_URL=http://localhost:5007 DEFAULT_TENANT=default:de pm2 start --no-autorestart -n data-explorer dist/server
cd ..

cd viewer
NODE_ENV=$NODE_ENV DEBUG=webapp* SERVER_PORT=3005 CONFIG_URL=http://localhost:5007 pm2 start --no-autorestart -n data-viewer dist/server
cd ..

cd dlm
NODE_ENV=$NODE_ENV \
DEBUG=webapp* \
SERVER_PORT=7000 \
TRANSFER_SERVER_URL="http://replace-your-transfer-service.com" \
AUTH_SERVER_URL="http://localhost:8080" \
DEFAULT_TENANT=default:dlm \
CONFIG_URL=http://localhost:5007 \
pm2 start --no-autorestart -n data-lifecycle-manager dist/server 
cd ..

pm2 save
pm2 delete all
