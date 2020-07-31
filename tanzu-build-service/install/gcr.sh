GCP_PROJECT=project

DOCKER_REPOSITORY="gcr.io/${GCP_PROJECT}"
DOCKER_REGISTRY="gcr.io"
REGISTRY_USERNAME="oauth2accesstoken"
REGISTRY_PASSWORD="$(gcloud auth print-access-token)"
CUSTOM_BUILDER_IMAGE="gcr.io/${GCP_PROJECT}/tbs-default-cluster-builder"

