# provider "kubernetes" {
# host = "https://${google_container_cluster.main.endpoint}"
# 
# client_certificate = base64decode(
# google_container_cluster.main.master_auth.0.client_certificate
# )
# client_key = base64decode(
# google_container_cluster.main.master_auth.0.client_key
# )
# cluster_ca_certificate = base64decode(
# google_container_cluster.main.master_auth.0.cluster_ca_certificate
# )
# }

data "google_client_config" "default" {}

provider "helm" {
  kubernetes {
    host = "https://${google_container_cluster.main.endpoint}"

    # client_certificate = base64decode(
    # google_container_cluster.main.master_auth.0.client_certificate
    # )
    # client_key = base64decode(
    # google_container_cluster.main.master_auth.0.client_key
    # )
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

  # values = [
  # file("argocd/application.yaml")
  # ]
}

# data "http" "fetch_argocd_yaml" {
# url = "https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml"
# 
# request_headers = {
# Accept = "application/x-yaml"
# }
# }

# resource "kubernetes_namespace" "argocd" {
# metadata {
# name = "argocd"
# }
# }

# resource "kubernetes_manifest" "argocd_yaml" {
# manifest = yamldecode(data.http.fetch_argocd_yaml.response_body)
# }
