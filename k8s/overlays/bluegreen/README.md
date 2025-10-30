# Blue/Green Deployment

This directory demonstrates the Blue/Green deployment strategy.

## How It Works
- Both Blue and Green environments run the same app versioned differently.
- The Service routes traffic to only one color at a time.
- Switching is done by updating the Service selector.

## Steps
```bash
# 1. Deploy both blue and green
kubectl apply -k k8s/overlays/bluegreen

# Check current active color
kubectl get svc app-service -o yaml | grep color

# Switch traffic to green
kubectl patch svc app-service -p '{"spec":{"selector":{"app":"demo","color":"green"}}}'

# Verify traffic switched
kubectl get pods -l color=green
```