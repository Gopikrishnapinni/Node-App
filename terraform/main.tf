resource "kubernetes_deployment_v1" "app" {
  metadata {
    name      = "simple-node-app"
    namespace = var.namespace
    labels = {
      app = "simple-node-app"
    }
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        app = "simple-node-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "simple-node-app"
        }
      }

      spec {
        container {
          name              = "simple-node-app"
          image             = var.image
          image_pull_policy = "IfNotPresent"

          port {
            name           = "http"
            container_port = 3000
          }

          env {
            name  = "PORT"
            value = "3000"
          }

          readiness_probe {
            http_get {
              path = "/health"
              port = "http"
            }
            initial_delay_seconds = 5
            period_seconds        = 10
          }

          liveness_probe {
            http_get {
              path = "/health"
              port = "http"
            }
            initial_delay_seconds = 15
            period_seconds        = 20
          }

          resources {
            requests = {
              cpu    = "50m"
              memory = "64Mi"
            }
            limits = {
              cpu    = "250m"
              memory = "128Mi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service_v1" "app" {
  metadata {
    name      = "simple-node-app"
    namespace = var.namespace
    labels = {
      app = "simple-node-app"
    }
  }

  spec {
    selector = {
      app = "simple-node-app"
    }

    port {
      name        = "http"
      port        = 80
      target_port = "http"
    }

    type = "ClusterIP"
  }
}
