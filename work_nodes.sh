#!/usr/bin/env bash

# 비밀번호 필요
scp -o StrictHostKeyChecking=no root@192.168.1.10:/etc/kubernetes/admin.conf /etc/kubernetes 

# config for master node only -> all nodes
mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

# config for work_nodes only 
kubeadm join --token 123456.1234567890123456 \
             --discovery-token-unsafe-skip-ca-verification 192.168.1.10:6443
