#! /usr/bin/env bash

source ./demo-magic.sh

clear

# Show slides:
# https://docs.google.com/presentation/d/14iOJZEasytUV_OMYRBGLjowL2RSJ_ionzzkBBM7GiQ4

pe 'kubectl apply -f kpack-resources/namespace.yml'

pe 'secrets/harbor.sh'

pe 'bat kpack-resources/store.yml'
pe 'kubectl apply -f kpack-resources/store.yml'

pe 'bat kpack-resources/stack.yml'
pe 'kubectl apply -f kpack-resources/stack.yml'

pe 'bat kpack-resources/custom-builder.yml'
pe 'kubectl apply -f kpack-resources/custom-builder.yml'

pe 'bat kpack-resources/image.yml'

# First build, CONFIG
pe 'kubectl apply -f kpack-resources/image.yml'
pe 'kp build list tanzu-golang'
pe 'kp build logs tanzu-golang -b 1'
pe 'kp build status tanzu-golang -b 1'
pe 'skopeo inspect docker://harbor2.lab.home:30003/library/tanzu-golang:latest | jq .Layers > build1'


# watch since we trigger the commit build in browser
pe 'watch kp build list tanzu-golang'
# Second build, COMMIT
# Go change the code in GitHub
# Watch the COMMIT build
pe 'kp build logs tanzu-golang -b 2'
pe 'kp build status tanzu-golang -b 2'
pe 'skopeo inspect docker://harbor2.lab.home:30003/library/tanzu-golang:latest | jq .Layers > build2'

pe 'bat build1 build2'
pe 'diff build1 build2'

# Third build, STACK
pe 'kp build list tanzu-golang'
# Requires you to be logged into registry.pivotal.io via Docker
pe 'kp stack update demo-stack --build-image registry.pivotal.io/tbs-dependencies/build:1584989900 --run-image registry.pivotal.io/tbs-dependencies/run:1584989900'
# Watch because I want to show how fast the Stack image build is
pe 'watch kp build list tanzu-golang'
pe 'kp build logs tanzu-golang -b 3'
pe 'skopeo inspect docker://harbor2.lab.home:30003/library/tanzu-golang:latest | jq .Layers > build3'

pe 'bat build2 build3'
pe 'diff build2 build3'


