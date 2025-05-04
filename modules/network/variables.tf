variable "location" {}
variable "resource_group_name" {}
variable "vnet_cidr" {
  default = "10.123.0.0/16"
}
variable "subnet_cidr" {
  default = "10.123.1.0/24"
}
variable "allowed_ip" {
  default = "193.25.7.148/32"
}
