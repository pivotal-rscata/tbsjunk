FROM alpine:3.12.0

RUN apk update && apk add openjdk11-jre && adduser -D tbs -u 1001

LABEL "io.buildpacks.stack.id"="org.cloudfoundry.stacks.cflinuxfs3"

ENV CNB_STACK_ID="org.cloudfoundry.stacks.cflinuxfs3"
ENV CNB_USER_ID="1001"
ENV CNB_GROUP_ID="1001"