#! /usr/bin/env bash

REGISTRY="index.docker.io/pivotrscata"
#REGISTRY="gcr.io/your-project/build-service"
#REGISTRY="harbor.lab.home/tbs"

C:\Users\robsc\tmp\duffle.exe relocate -f C:\Users\robsc\tmp\build-service-0.2.0.tgz \
-m C:\Users\robsc\tmp\relocated.json \
-p "${REGISTRY}"

