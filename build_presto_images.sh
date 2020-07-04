#!/bin/bash

set -e

REPONAME=joshuarobinson
PRESTOVER=337

## Build Presto-server

docker build --build-arg PRESTO_VER=$PRESTOVER -t fb-presto presto/

# Tag and push to the public docker repository.
docker tag fb-presto $REPONAME/fb-presto
docker push $REPONAME/fb-presto

# Update configMap in Kubernetes
pushd presto/
kubectl create configmap presto-cfg --dry-run --from-file=config.properties.coordinator --from-file=config.properties.worker --from-file=node.properties.template --from-file=hive.properties.template -o yaml | kubectl apply -f -
popd

## Build Presto-CLI

TAG=presto-cli

docker build --build-arg PRESTO_VER=$PRESTOVER -t $TAG presto-cli/

# Tag and push to the public docker repository.
docker tag $TAG $REPONAME/$TAG
docker push $REPONAME/$TAG
