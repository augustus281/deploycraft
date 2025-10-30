# API Helm Chart (Blue/Green)

This chart deploys your API with Blue/Green support.

## Build the API image

Using Minikube Docker daemon

```bash
eval $(minikube -p minikube docker-env)
docker build -t deploycraft:blue -f Dockerfile .
# tag for green later:
docker tag deploycraft:blue deploycraft:green
```

## Install Blue release

```bash
helm install api-blue ./charts/api --set color=blue \
  --set image.repository=deploycraft --set image.tag=blue

# Output:
NAME: api-blue
LAST DEPLOYED: Fri Oct 31 03:18:01 2025
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
1. Check the deployment:
   kubectl get deploy -l app=api

2. Check which color is active:
   kubectl get svc api-blue-api-svc -o yaml | grep color

3. To switch traffic:
   helm upgrade api-blue ./charts/api --set color=green
```

## Install Green release (parallel)

Install green alongside blue (different release name):

```bash
# If using local images: ensure the green image exists (tag or built)
docker tag deploycraft:blue deploycraft:green
# or build green with new image tag that points to new code
helm install api-green ./charts/bluegreen --set color=green \
  --set image.repository=deploycraft --set image.tag=green
```

## Switch traffic (Blue -> Green)

### Option 1: Patch the Service selector:

```bash
kubectl patch svc api-api-svc -p '{"spec":{"selector":{"app":"api","color":"green"}}}'
# verify
kubectl get endpoints api-api-svc -o yaml
```

### Option 2: Use Helm to manage service selector (recommended for reproducibility)

Upgrade the service-managing release (choose one release to own the service). Example — let the api-blue release own the service; to switch, run:

```bash
helm upgrade api-blue ./charts/bluegreen --set color=green --set image.repository=... --set image.tag=green
```

## Rollback (fast & safe)

If green is bad, switch back:

Patch back service:
```bash
kubectl patch svc api-api-svc -p '{"spec":{"selector":{"app":"api","color":"blue"}}}'
```

Or with Helm:
```bash
helm upgrade api-blue ./charts/api --set color=blue
```

## Cleanup old color

```bash
kubectl scale deployment api-blue --replicas=0
# or delete
helm uninstall api-blue
```