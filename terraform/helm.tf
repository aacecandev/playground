resource "helm_release" "argocd" {
  name = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  version          = "4.9.7"
  create_namespace = true

  values = [
    file("../argocd/application.yaml")
  ]
}

data "helm_template" "argocd" {
  name       = "argocd"
  namespace  = "argocd"
  repository = "https://argoproj.github.io/argo-helm"

  chart   = "argo-cd"
  version = "4.9.7"
}
