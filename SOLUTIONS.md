Dockerfile

- multi-stage builder steps can be joined
- golang:1.18.0-buster can be replaced with a smaller alpine image
- builder image tag has been substituted with a digest to avoid mutability issues
-

Trust and security

- cosign sign image
- syft generate sbom



# get argocd password
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

# port-forward to argocd-server
kubectl port-forward svc/argocd-server -n argocd 8080:443
