data "google_client_config" "default" {}

provider "helm" {
  kubernetes {
    host = google_container_cluster.main.endpoint

    token = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(
      google_container_cluster.main.master_auth.0.cluster_ca_certificate
    )
  }
  experiments {
    manifest = true
  }
}

resource "helm_release" "argocd" {
  name = "argocd"

  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  version          = "5.14.1"
  create_namespace = true

  depends_on = [
    google_container_node_pool.main
  ]
}

resource "helm_release" "argoworkflows" {
  name = "argoworkflows"

  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-workflows"
  namespace        = "argoworkflows"
  version          = "0.20.11"
  create_namespace = true

  depends_on = [
    google_container_node_pool.main
  ]
}
