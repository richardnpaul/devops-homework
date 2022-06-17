variable "region" {
  description = "value of region"
  type        = string
  default     = "europe-west2"
}

variable "network" {
  description = "value of network"
  type        = string
  nullable    = false
}
