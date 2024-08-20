
# 啟動並啟用 Elasticsearch 服務
echo "啟動並啟用 Elasticsearch 服務..."
sudo systemctl daemon-reload
sudo systemctl enable elasticsearch.service
sudo systemctl start elasticsearch.service

