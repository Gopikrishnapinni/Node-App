variable "kubeconfig" {
  description = "Path to the kubeconfig file used to connect to the cluster."
  type        = string
  default     = "~/.kube/config"
}

variable "namespace" {
  description = "Kubernetes namespace for the application."
  type        = string
  default     = "default"
}

variable "image" {
  description = "Container image for the application."
  type        = string
  default     = "simple-node-app:1.0.0"
}

variable "replicas" {
  description = "Number of application pods."
  type        = number
  default     = 2
}
