variable "frontend_reserved_ip" {
  type        = string
  description = "Reserved IP for the frontend"
}

variable "domain" {
  type        = string
  description = "domain of the relax"
}

variable "www_enabled" {
  description = "is the www subdomain enabled?"
  type = bool
  default = true
}