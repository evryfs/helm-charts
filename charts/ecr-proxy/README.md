# ECR-proxy

Creates a anonymous proxy towards an ECR registry,
so that you can pull images w/o having to deal with the short-lived ECR tokens.

## Installing

`helm repo add evryfs-oss https://evryfs.github.io/helm-charts/`
`helm install evryfs-oss/ecr-proxy --namespace yourNamespace --name ecr-proxy`

## Configuration

See `values.yaml` for configuration options. The most noticeable ones are the secrets.
Either point to an existing secret in `secret.existingSecret` or
enable secret configuration through `secret.create` and set the values in `secret.awsAccessKeyId` and `secret.awsSecretAccessKey`.
Use the `env`section to set the rest of the variables.


## Weaknesses / TODOs
Could have a PVC for cache but I did not bother.
