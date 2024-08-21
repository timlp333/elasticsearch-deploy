#!/bin/bash
LOCAL_IP=$(hostname -I | awk '{print $1}')

NODE_NUM=$1

ELASTICSEARCH_CONFIG_PATH="/home/elastic/elasticsearch-8.15.0/config/elasticsearch.yml"

ELASTICSEARCH_VERSION=8.15.0

cd /home/elastic/elasticsearch-$ELASTICSEARCH_VERSION/config

tar -zxf certs.tar.gz

chown -R elastic:elastic /home/elastic/elasticsearch-$ELASTICSEARCH_VERSION/config

echo "Updated node.name in $ELASTICSEARCH_CONFIG_PATH"

sed -i "s/^node.name: {node-name}/node.name: node-$NODE_NUM/" $ELASTICSEARCH_CONFIG_PATH

echo "Updated network.host to $LOCAL_IP in $ELASTICSEARCH_CONFIG_PATH"

sed -i "s/^network.host: {localip}/network.host: $LOCAL_IP/" $ELASTICSEARCH_CONFIG_PATH






