# Dependency-track

## Installing

```
kubectl create namespace dependency-track
helm install dependency-track evryfs-oss/dependency-track --namespace dependency-track
```

## Configuration

PostgreSQL is enabled by default.
See [values.yaml](values.yaml) for configuration parameters.
