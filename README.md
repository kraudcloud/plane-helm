# Plane Helm

Forked from [upstream/ref/branch/chore/helm](https://github.com/makeplane/plane/tree/7d6c5dfc751da85cbef15cf911ec5f681e3b24bb)

---

Follow below steps to setup **Plane**

You must refer the configuration variables before proceeding. This can be done by running the below command or visiting **Configuration** tab.

```sh
helm show values oci://ghcr.io/kraudcloud/plane-helm/plane-helm
```

Basic Install

```sh
helm install \
    --create-namespace \
    --namespace plane \
    --set ingress.host="plane.example.com" \
    plane oci://ghcr.io/kraudcloud/helm-plane/helm-plane:1.3.0
```

Customise Remote Postgress URL

```sh
    --set postgresql.enabled=false \
    --set postgresql.url="postgress://[username]:[password]@[pg-host]/[db-name]" \
```

Customise Remote Redis URL

```sh
    --set redis.enabled=false \
    --set redis.url="redis://[redis-host]:[6379]" \
```

Customise Document Store - Change from Minio to AWS S3

```sh
    --set minio.enabled=false \
    --set minio.defaultBuckets="uploads" \
    --set minio.external.accessKey="" \
    --set minio.external.secretKey="" \
    --set minio.external.region="" \
    --set minio.external.endpoint="" \
```

See configuration settings in the values.yaml file, along with their defaults.

## Parameters

### Global

| Name               | Description                          | Value               |
| ------------------ | ------------------------------------ | ------------------- |
| `global.image.tag` | Tag for all images relevant to plane | `.Chart.AppVersion` |

### Ingress

| Name                   | Description                                    | Value               |
| ---------------------- | ---------------------------------------------- | ------------------- |
| `ingress.enabled`      | Enable ingress                                 | `false`             |
| `ingress.host`         | Hostname to your Plane installation            | `plane.example.com` |
| `ingress.ingressClass` | Ingress class                                  | `""`                |
| `ingress.tls`          | TLS configuration for the ingress              | `[]`                |
| `ingress.annotations`  | Annotations for the ingress (eg, cert-manager) | `{}`                |

### Redis

| Name                         | Description        | Value      |
| ---------------------------- | ------------------ | ---------- |
| `redis.enabled`              | Enable redis       | `true`     |
| `redis.auth.password`        | Redis password     | `password` |
| `redis.replica.replicaCount` | Number of replicas | `1`        |
| `redis.url`                  | Redis url          | `""`       |

### Postgres

| Name                       | Description         | Value      |
| -------------------------- | ------------------- | ---------- |
| `postgresql.enabled`       | Enable postgresql   | `true`     |
| `postgresql.url`           | Postgresql url      | `""`       |
| `postgresql.auth.username` | Postgresql username | `plane`    |
| `postgresql.auth.password` | Postgresql password | `password` |
| `postgresql.auth.database` | Postgresql database | `plane`    |

### Rabbitmq

| Name                     | Description       | Value      |
| ------------------------ | ----------------- | ---------- |
| `rabbitmq.enabled`       | Enable rabbitmq   | `true`     |
| `rabbitmq.url`           | Rabbitmq url      | `""`       |
| `rabbitmq.auth.username` | Rabbitmq username | `plane`    |
| `rabbitmq.auth.password` | Rabbitmq password | `password` |

### Minio

| Name                       | Description               | Value      |
| -------------------------- | ------------------------- | ---------- |
| `minio.enabled`            | Enable minio              | `true`     |
| `minio.defaultBuckets`     | Default buckets to create | `uploads`  |
| `minio.sizeLimit`          | Size limit for uploads    | `5242880`  |
| `minio.auth.rootUser`      | Root user for minio       | `admin`    |
| `minio.auth.rootPassword`  | Root password for minio   | `password` |
| `minio.external.accessKey` | Access key for minio      | `""`       |
| `minio.external.secretKey` | Secret key for minio      | `""`       |
| `minio.external.region`    | Region for minio          | `""`       |
| `minio.external.endpoint`  | Endpoint for minio        | `""`       |

### Internal configuration

| Name                          | Description                          | Value                                |
| ----------------------------- | ------------------------------------ | ------------------------------------ |
| `web.replicas`                | Number of replicas for web           | `1`                                  |
| `web.resources`               | Resources for web                    | `{}`                                 |
| `web.image.name`              | Name of image for web                | `docker.io/makeplane/plane-frontend` |
| `web.image.tag`               | Tag of image for web                 | `""`                                 |
| `web.image.pullPolicy`        | Pull policy for image for web        | `""`                                 |
| `web.service.type`            | Type of service for web              | `""`                                 |
| `space.replicas`              | Number of replicas for space         | `1`                                  |
| `space.resources`             | Resources for space                  | `{}`                                 |
| `space.image.name`            | Name of image for space              | `docker.io/makeplane/plane-space`    |
| `space.image.tag`             | Tag of image for space               | `""`                                 |
| `space.image.pullPolicy`      | Pull policy for image for space      | `""`                                 |
| `space.service.type`          | Type of service for space            | `""`                                 |
| `admin.replicas`              | Number of replicas for admin         | `1`                                  |
| `admin.resources`             | Resources for admin                  | `{}`                                 |
| `admin.image.name`            | Name of image for admin              | `docker.io/makeplane/plane-admin`    |
| `admin.image.tag`             | Tag of image for admin               | `""`                                 |
| `admin.image.pullPolicy`      | Pull policy for image for admin      | `""`                                 |
| `admin.service.type`          | Type of service for admin            | `""`                                 |
| `api.replicas`                | Number of replicas for api           | `1`                                  |
| `api.resources`               | Resources for api                    | `{}`                                 |
| `api.image.name`              | Name of image for api                | `docker.io/makeplane/plane-backend`  |
| `api.image.tag`               | Tag of image for api                 | `""`                                 |
| `api.image.pullPolicy`        | Pull policy for image for api        | `""`                                 |
| `api.service.type`            | Type of service for api              | `""`                                 |
| `worker.replicas`             | Number of replicas for worker        | `1`                                  |
| `worker.resources`            | Resources for worker                 | `{}`                                 |
| `worker.image.name`           | Name of image for worker             | `docker.io/makeplane/plane-backend`  |
| `worker.image.tag`            | Tag of image for worker              | `""`                                 |
| `worker.image.pullPolicy`     | Pull policy for image for worker     | `""`                                 |
| `beatworker.replicas`         | Number of replicas for beatworker    | `1`                                  |
| `beatworker.resources`        | Resources for beatworker             | `{}`                                 |
| `beatworker.image.name`       | Name of image for beatworker         | `docker.io/makeplane/plane-backend`  |
| `beatworker.image.tag`        | Tag of image for beatworker          | `""`                                 |
| `beatworker.image.pullPolicy` | Pull policy for image for beatworker | `""`                                 |

### Configuration

| Name                       | Description                        | Value |
| -------------------------- | ---------------------------------- | ----- |
| `env.secret_key`           | Secret key for plane               | `""`  |
| `env.sentry_dsn`           | Sentry DSN for plane               | `""`  |
| `env.sentry_environment`   | Sentry environment for plane       | `""`  |
| `env.gunicorn_api_workers` | Number of workers for gunicorn api | `1`   |
| `env.cors_allowed_origins` | CORS allowed origins for plane     | `""`  |
| `env.enable_signups`       | Enable signups for plane           | `1`   |
