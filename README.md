# presto-on-k8s
Setup for running Presto with Hive Metastore on Kubernetes as introduced in [this blog post](https://medium.com/@joshua_robinson/presto-powered-s3-data-warehouse-on-kubernetes-aea89d2f40e8).

See [previous blog post](https://medium.com/@joshua_robinson/presto-on-flashblade-s3-486ecb449574)
for more information about running Presto on FlashBlade.

# How to Use

1. Build Docker images for Hive Metastore and Presto

2. Deploy Hive Metastore: MariaDB (pvs and deployment), init-schemas, Metastore

3. Deploy Presto services (coordinator, workers, and cli)

4. Deploy Redash.

Assumptions: working Kubernetes deployment and S3 object store (e.g., FlashBlade).

Things you may need to modify:
* Docker repository name ($REPONAME) in build_image scripts and yaml files.
* DataVIP and access keys for FlashBlade (fs.s3a.endpoint and hive.s3.endpoint)
* StorageClass for the MariaDB volume.
* Memory settings and worker counts.

# Hive Metastore Service

Dockerfile for Metastore
 * Uses [Hive Metastore Standalone service](https://cwiki.apache.org/confluence/display/Hive/AdminManual+Metastore+3.0+Administration).

Yaml for MariaDB
 * Simple and not optimized.

Yaml for init-schemas
 * One-time K8s job to initiate the MariaDB tables.

Yaml for Metastore

# Presto Coordinator/Workers/CLI

Dockerfile for PrestoSql.

Script: autoconfig_and_launch.sh
 * Generate final presto config files at pod startup time.

Yaml for Presto Coordinator/Workers

Dockerfile for Presto CLI
 * Simple image to make interactive use of Presto easier.
