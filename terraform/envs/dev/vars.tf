variable "civo_token" {
    description = "Civo API token"
}

variable "region" {
    type        = string
    default     = "LON1" #Change region if required
    description = "Region where the cluster will be provisioned"
}

variable "cluster_name" {
  type        = string
  default = "civo-letsencrypt"
  description = "The name of the Kubernetes cluster to create"
}

# Number of CPU nodes to provision in the cluster
variable "cluster_cpu_node_count" {
    type        = number
    default     = 1
    description = "Number of CPU nodes to provision in the cluster"
}

# Size specification for CPU nodes in the cluster
variable "cluster_cpu_node_size" {
    type        = string
    default     = "g4c.kube.medium" 
    description = "Size specification for CPU nodes in the cluster"
}

variable "frontend_reserved_ip" {
  type        = string
  description = "Reserved IP for the frontend"
}

variable "domain" {
  description = "Domain name"
  type        = string
}

variable "www_enabled" {
  description = "is the www subdomain enabled?"
  type        = bool
  default     = true
}