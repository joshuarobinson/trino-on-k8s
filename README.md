# presto-on-k8s
Setup for running Presto with Hive Metastore on Kubernetes.

See [previous blog post](https://medium.com/@joshua_robinson/presto-on-flashblade-s3-486ecb449574)
for more information about running Presto on FlashBlade.

# How to Use

1. Build Docker images for Hive Metastore and Presto

2. Deploy Kubernetes services: MariaDB, init-schemas, Metastore, and then Presto

Assumptions: working Kubernetes deployment.

Things you may need to modify:
* Docker repository name ($REPONAME) in build_image scripts and yaml files.
* DataVIP and access keys for FlashBlade (fs.s3a.endpoint and hive.s3.endpoint)
* StorageClass for the MariaDB volume.

# Hive Metastore Service

Dockerfile for Metastore

Uses [Hive Metastore Standalone service](https://cwiki.apache.org/confluence/display/Hive/AdminManual+Metastore+3.0+Administration).

Yaml for MariaDB

Yaml for init-schemas

Yaml for Metastore

# Presto Coordinator/Workers/CLI

Dockerfile for Presto Service

Configuration approach

Yaml for Presto Coordinator/Workers

Dockerfile for Presto CLI
