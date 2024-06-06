# Plane Helm

Forked from [upstream/ref/branch/chore/helm](https://github.com/makeplane/plane/tree/7d6c5dfc751da85cbef15cf911ec5f681e3b24bb)

---

Follow below steps to setup **Plane**

Add Helm Repo

```sh
helm repo add makeplane https://helm.plane.so/
```

You must refer the configuration variables before proceeding. This can be done by running the below command or visiting **Configuration** tab.

```sh
helm show values plane-ce --repo https://helm.plane.so 
```

Basic Install

```sh
helm install \
    --create-namespace \
    --namespace plane-ns \
    --set ingress.appHost="plane.example.com" \
    --set ingress.minioHost="plane-minio.example.com" \
    my-plane makeplane/plane-ce
```

Customise Remote Postgress URL

```sh
    --set postgres.local_setup=false \
    --set env.pgdb_remote_url="postgress://[username]:[password]@[pg-host]/[db-name]" \
```

Customise Remote Redis URL

```sh
    --set redis.local_setup=false \
    --set env.remote_redis_url="redis://[redis-host]:[6379]" \
```

Customise Document Store - Change from Minio to AWS S3

```sh
    --set minio.local_setup=false \
    --set env.aws_access_key="xxxxxxx" \
    --set env.aws_secret_access_key="xxxxxxx" \
    --set env.aws_region="xxxxxxx" \
    --set env.docstore_bucket="xxxxxxx" \
```

See configuration settings in the values.yaml file, along with their defaults.
