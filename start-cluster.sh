#!/bin/bash

kubectl create configmap solr-cluster-config --from-env-file=configmap/solr-cluster-config.properties 
kubectl create configmap zookeeper-ensemble-config --from-env-file=configmap/zookeeper-ensemble-config.properties 
kubectl create -f storage.yaml
#kubectl create -f storage-zk.yaml
kubectl create -f statefulsets/statefulset-zookeeper-ensemble.yml
kubectl create -f services/service-zookeeper-ensemble.yml

sleep 15

kubectl create -f statefulsets/statefulset-solr-cluster.yml
kubectl create -f services/service-solr-cluster.yml

kubectl get pod
kubectl get deployment
kubectl get service

