resource "helm_release" "jenkins" {

  name       = "jenkins"
  repository = "https://charts.jenkins.io"
  chart      = "jenkins"
  version    = "4.1.14"
  namespace  = "jenkins"
  timeout    = 900
  values = [
    file("aks-values.yaml"),
  ]
  
  set {
    name  = "jenkinsUrl"
    value = "http://${var.ip}:8080/"
  }

  depends_on = [
    kubernetes_namespace.jenkins,
  ]
}

resource "kubernetes_namespace" "jenkins" {
  metadata {
    name = "jenkins"

    labels = {
      name        = "jenkins"
      description = "jenkins"
    }
  }
}

# provide the loadbalancer ip for the nlb
# if you want to provide a static dns entry please use a ingress service insted
variable "ip" {
  default = "20.85.197.214"
}