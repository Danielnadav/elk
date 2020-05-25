#!/bin/bash
# add bitnami repo & install elasticsearch and kibana
helm repo add bitnami https://charts.bitnami.com/bitnami &&
helm install --name elasticsearch bitnami/elasticsearch &&
helm install --name kibana elastic/kibana --set \
  elasticsearchHosts=http://127.0.0.1:9200 \
  service.type=LoadBalancer 
# setup fluentd with helm
helm install --name fluentd bitnami/fluentd \
  --set aggregator.configMap=elasticsearch-output \
  --set forwarder.configMap=apache-log-parser \
  --set aggregator.extraEnv[0].name=ELASTICSEARCH_HOST \
  --set aggregator.extraEnv[0].value=ELASTICSEARCH-COORDINATING-NODE-NAME \
  --set aggregator.extraEnv[1].name=ELASTICSEARCH_PORT \
  --set-string aggregator.extraEnv[1].value=9200 \
  --set forwarder.extraEnv[0].name=FLUENTD_DAEMON_USER \
  --set forwarder.extraEnv[0].value=root \
  --set forwarder.extraEnv[1].name=FLUENTD_DAEMON_GROUP \
  --set forwarder.extraEnv[1].value=root

kubectl apply -f elasticsearch-output.yaml &&
kubectl apply -f apache-log-parser.yaml

exit