# 🧱 deploycraft
A platform engineering lab for mastering modern deployment strategies using Kubernetes, ArgoCD, and GitOps.

## 🎯Project Goals
- Practice multiple Kubernetes deployment types: Rolling, Recreate, Blue-Green, Canary.
- Learn to automate deployments with ArgoCD.
- Explore GitOps workflows and progressive delivery.
- Add observability to measure rollout health.

## ⚙️ Tech Stack
- Language: Go
- Containerization: Docker
- Orchestration: Kubernetes, Kustomize
- CD / GitOps: ArgoCD, Argo Rollouts
- Monitoring: Prometheus, Grafana
- CD: GitHub Actions

## 🧩 Structure Overview
```text
deploycraft/
├── api/              # Go microservice
├── build/            # Dockerfile & Makefile
├── k8s/              # Base + overlays for different strategies
├── helm/             # Optional Helm chart
├── terraform/        # Infra setup (optional)
└── .github/workflows # CI/CD pipelines
```