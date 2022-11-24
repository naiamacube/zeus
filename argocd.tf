data "google_client_config" "default" {}

provider "helm" {
  kubernetes {
    host = "https://${google_container_cluster.main.endpoint}"

    token = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(
      google_container_cluster.main.master_auth.0.cluster_ca_certificate
    )
  }
}

resource "helm_release" "argocd" {
  name = "argocd"

  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  version          = "5.14.1"
  create_namespace = true
}
