# Dependency-track

## Installing
To install this chart on Kubernetes, use the following commands:
```
kubectl create namespace dependency-track
helm install dependency-track evryfs-oss/dependency-track [--set ingress.enabled=true --set ingress.host=<desired_fqdn>] --namespace dependency-track
```

**Note:** Depending on how you install the chart, the `API_BASE_URL` value in values.yaml may need to be amended.
 - If `ingress.enabled=true` then it can be left as `API_BASE_URL=""`
 - If ingress is not used, or separate ingress URLs are desired for the frontend and backend, then the `API_BASE_URL` will need to be set as the URL for the Backend
 - If you wish to use port-forwarding then `API_BASE_URL=http://127.0.0.1:<port>`, see values.yaml for more information

To install this chart on OpenShift, using the `nonroot` SCC, use the following command:
```
oc create namespace dependency-track
oc create rolebinding nonroot --clusterrole=system:openshift:scc:nonroot --serviceaccount=<namespace>:dependency-track-frontend --serviceaccount=<namespace>:dependency-track-apiserver --serviceaccount=<namespace>:dependency-track-postgresql
helm install dependency-track evryfs-oss/dependency-track [--set ingress.enabled=true] --namespace dependency-track
```

**Note:** If you change the release name from `dependency-track` then the service accounts will have a different name, e.g. `<release_name>-frontend`.

To install this chart on OpenShift using the Restricted SCC, use the following command:
```
helm install dependency-track evryfs-oss/dependency-track --set apiserver.podSecurityContext.enabled=false \
   --set apiserver.securityContext.enabled=false --set frontend.securityContext.enabled=false \
   --set frontend.podSecurityContext.enabled=false [--set ingress.enabled=true --set ingress.host=<desired_URL>] \
   --set postgresql.serviceAccount.enabled=true --set postgresql.containerSecurityContext.enabled=false \
   --set postgresql.securityContext.enabled=false --set postgresql.volumePermissions.enabled=true \
   --set postgresql.volumePermissions.securityContext.runAsUser="auto"
```

**Note:** To use the chart with the Restricted SCC it requires changes to the Frontend and Backend Dockerfiles to be compatible. PRs have been raised and these will need to be merged and released before installation under Restricted SCC can take place.
 - https://github.com/DependencyTrack/dependency-track/pull/994
 - https://github.com/DependencyTrack/frontend/pull/67 

Therefore as of release 4.2.1, these PRs have not yet been released.

## Configuration
PostgreSQL is enabled by default. In conjunction with PostgreSQL, by default in initContainer `wait-for-db` is enabled and configured to check the database is up before the frontend and backend are started.

If this is not required, it can be disabled via `--set apiserver.initContainers.enabled=false --set frontend.initContainers.enabled=false` at install time.

See [values.yaml](values.yaml) for configuration parameters.
