#!/bin/bash

set -e

cp /opt/presto-server/etc/node.properties.template /opt/presto-server/etc/node.properties
echo "node.id=$HOSTNAME" >> /opt/presto-server/etc/node.properties

cp /opt/presto-server/etc/catalog/hive.properties.template /opt/presto-server/etc/catalog/hive.properties
echo "hive.s3.aws-access-key=$AWS_ACCESS_KEY_ID" >> /opt/presto-server/etc/catalog/hive.properties
echo "hive.s3.aws-secret-key=$AWS_SECRET_ACCESS_KEY" >> /opt/presto-server/etc/catalog/hive.properties

/opt/presto-server/bin/launcher run
