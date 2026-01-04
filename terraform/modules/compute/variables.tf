variable "instance_name" {
  type = string
}

variable "machine_type" {
  type = string
}

variable "zone" {
  type = string
}

variable "image" {
  type = string
}

variable "subnet_self_link" {
  type = string
}

variable "network_tags" {
  type = list(string)
}
