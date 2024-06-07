# Plane Helm

Forked from [upstream/ref/branch/chore/helm](https://github.com/makeplane/plane/tree/7d6c5dfc751da85cbef15cf911ec5f681e3b24bb)

---

Follow below steps to setup **Plane**

You must refer the configuration variables before proceeding. This can be done by running the below command or visiting **Configuration** tab.

```sh
helm show values oci://ghcr.io/karitham/plane-helm/plane-helm
```

Basic Install

```sh
helm install \
    --create-namespace \
    --namespace plane \
    --set ingress.host="plane.example.com" \
    plane oci://ghcr.io/karitham/helm-plane/helm-plane:1.1.2
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
