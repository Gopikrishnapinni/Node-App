output "service_name" {
  description = "Kubernetes Service name."
  value       = kubernetes_service_v1.app.metadata[0].name
}

output "service_namespace" {
  description = "Kubernetes namespace containing the Service."
  value       = kubernetes_service_v1.app.metadata[0].namespace
}
