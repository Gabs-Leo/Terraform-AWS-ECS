variable "cluster_name" {
  type = string
}
variable "region" {
  type = string
}
variable "public_subnet_a_cidr" {
  type = string
  default = "10.10.10.0/24"
}
variable "public_subnet_b_cidr" {
  type = string
  default = "10.10.20.0/24"
}