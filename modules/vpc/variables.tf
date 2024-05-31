variable "getRealVPC" {
  type        = bool
  default     = false
  description = "if true, then try to fetch the default VPC id"
}

variable "region" {
  type    = string
  default = "us-west-2"
}