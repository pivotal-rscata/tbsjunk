#! /usr/bin/env bash

# duffle (in my world) is only used to install TBS so I remove the duffle folder every time I install TBS
rm -rf ~/.duffle


source harbor.sh
#source gcr.sh
#source dockerhub.sh

# docker_repository is where updated Stack images are relocated to
# docker_registry, registry_username and registry_password are used to push builder images
# custom_builder_image is the `default` builder
duffle install tbs -c ./credentials.yml  \
  --set kubernetes_env=tbs \
  --set docker_repository="${DOCKER_REPOSITORY}" \
  --set docker_registry="${DOCKER_REGISTRY}" \
  --set registry_username="${REGISTRY_USERNAME}" \
  --set registry_password="${REGISTRY_PASSWORD}" \
  --set custom_builder_image="${CUSTOM_BUILDER_IMAGE}" \
  -f ./build-service-0.2.0.tgz \
  -m ./relocated.json
