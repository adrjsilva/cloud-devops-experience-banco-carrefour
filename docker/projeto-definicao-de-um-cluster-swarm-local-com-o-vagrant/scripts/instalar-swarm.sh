#!/bin/bash
docker swarm init --advertise-addr 10.0.0.100

sleep 30

docker swarm join-token worker | grep docker -A3 > /vagrant/scripts/ingressar-cluster-swarm.sh