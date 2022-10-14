#!/bin/bash

apt-get update && apt-get upgrade && apt-get install -y curl

curl -fSsl https://get.docker.com | bash
