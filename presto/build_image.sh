#!/bin/bash

set -e

REPONAME=joshuarobinson
PRESTOVER=322

docker build --build-arg PRESTO_VER=$PRESTOVER -t fb-presto .

# Tag and push to the public docker repository.
docker tag fb-presto $REPONAME/fb-presto
docker push $REPONAME/fb-presto

# Update configMap in Kubernetes
kubectl create configmap presto-cfg --dry-run --from-file=config.properties.coordinator --from-file=config.properties.worker --from-file=node.properties.template --from-file=hive.properties.template -o yaml | kubectl apply -f -
