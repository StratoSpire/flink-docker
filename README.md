# Spark Docker

flink-base:
[![DockerStars](https://img.shields.io/docker/stars/stratospire/flink-base.svg)](https://registry.hub.docker.com/u/stratospire/flink-base/)
[![DockerPulls](https://img.shields.io/docker/pulls/stratospire/flink-base.svg)](https://registry.hub.docker.com/u/stratospire/flink-base/)

flink-cluster:
[![DockerStars](https://img.shields.io/docker/stars/stratospire/flink-cluster.svg)](https://registry.hub.docker.com/u/stratospire/flink-cluster/)
[![DockerPulls](https://img.shields.io/docker/pulls/stratospire/flink-cluster.svg)](https://registry.hub.docker.com/u/stratospire/flink-cluster/)

flink-client:
[![DockerStars](https://img.shields.io/docker/stars/stratospire/flink-client.svg)](https://registry.hub.docker.com/u/stratospire/flink-client/)
[![DockerPulls](https://img.shields.io/docker/pulls/stratospire/flink-client.svg)](https://registry.hub.docker.com/u/stratospire/flink-client/)

These Flink Docker images are for running Flink clusters on Docker and Kubernetes.

Here's how to use them:

## Docker Compose

### Start the Cluster

```
cd docker
docker-compose up -d
```

The Flink JobManager UI will then be available at:
[http://localhost:8080/](http://localhost:8080/)

### Stop the Cluster

```
docker-compose down
```
