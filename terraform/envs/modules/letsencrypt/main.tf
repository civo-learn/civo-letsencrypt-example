resource "helm_release" "ingress-nginx" {
  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  replace      = true
  force_update = true
  # set {
  #   type  = "string"
  #   name  = "installCRDs"
  #   value = true
  # }
      
  # set {
  #     name  = "controller.service.annotations.kubernetes\\.civo\\.com/ipv4-address"
  #     value = var.frontend_reserved_ip
  # }
}

resource "kubernetes_namespace" "frontend" {
  metadata {
    name = "frontend"
  }
}

resource "helm_release" "ingress" {
  name  = "ingress"
  chart = "../../../helm-charts/ingress"
  replace      = true
  force_update = true
  depends_on = [
    helm_release.cert-manager,
  ]
  set {
    type  = "string"
    name  = "domain"
    value = var.domain
  }
  set {
    type  = "string"
    name  = "apidomain"
    value = var.domain
  }
  set {
    type  = "string"
    name  = "dashboarddomain"
    value = var.domain
  }
  set {
    type = "auto"
    name = "www_enabled"
    value = var.www_enabled
  }
  set {
    name  = "ip"
    value = var.frontend_reserved_ip
  }
}


resource "helm_release" "letsencrypt" {
  name         = "letsencrypt"
  chart        = "../../../helm-charts/letsencrypt"
  replace      = true
  force_update = true
  depends_on = [
    helm_release.ingress-nginx,
    helm_release.ingress,
  ]

}

# create a certmanager namespace
resource "kubernetes_namespace" "cert-manager" {
  metadata {
    name = "cert-manager"
  }
}

resource "helm_release" "cert-manager" {
  name = "cert-manager"

  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"

  create_namespace = false
  namespace    = kubernetes_namespace.cert-manager.metadata[0].name 
  version          = "v1.14.1"

  depends_on = [
    kubernetes_namespace.cert-manager,
  ]

  set {
    type  = "string"
    name  = "installCRDs"
    value = true
  }
  set {
    type  = "string"
    name  = "crds.enabled"
    value = true
  }
}
