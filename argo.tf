data "http" "fetch_argocd_yaml" {
  url = "https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml"

  request_headers = {
    Accept = "application/x-yaml"
  }
}

resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

resource "kubernetes_manifest" "argocd_yaml" {
  manifest = yamlencode(data.http.fetch_argocd_yaml.response_body)
}
