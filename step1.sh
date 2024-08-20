#!/bin/bash
# 創建 Elasticsearch 用戶
echo "創建 Elasticsearch 用戶..."
sudo useradd -m -p elastic elastic
ELASTICSEARCH_VERSION=8.15.0
# 解壓 Elasticsearch
echo "解壓 Elasticsearch..."
mv /tmp/elasticsearch-$ELASTICSEARCH_VERSION-linux-x86_64.tar.gz /home/elastic
cd /home/elastic
tar -xzf elasticsearch-8.15.0-linux-x86_64.tar.gz
chown -R elastic:elastic elasticsearch-8.15.0
cd elasticsearch-8.15.0

# 加入java 到path
echo "java 到path..."
export PATH=/home/elastic/elasticsearch-8.15.0/jdk/bin:$PATH
bash -c "echo 'export PATH=/home/elastic/elasticsearch-$ELASTICSEARCH_VERSION/jdk/bin:$PATH' >> /etc/bashrc"
source /etc/bash

#備份elasticsearch 設定檔

echo "備份elasticsearch 設定檔"
mv /home/elastic/elasticsearch-$ELASTICSEARCH_VERSION/config/elasticsearch.yml /home/elastic/elasticsearch-$ELASTICSEARCH_VERSION/config/elasticsearch.yml.bak

# 配置內核參數
echo "配置內核參數..."
sudo bash -c "echo 'vm.max_map_count = 262144' >> /etc/sysctl.conf"

# 配置防火牆
echo "配置防火牆..."
firewall-cmd --zone=public --permanent --add-port=9200/tcp
firewall-cmd --zone=public --permanent --add-port=9300/tcp
firewall-cmd --reload



