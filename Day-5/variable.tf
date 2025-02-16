variable "region" {
  description = "value of region"
  type        = string
  default     = "ap-south-1"
}

variable "cidr" {
  description = "cidr ip range"
  type        = string
  default     = "10.0.0.0/16"
}

variable "pub-sub-cidr" {
  default = "10.0.1.0/24"
}

variable "pvt-sub-cidr" {
  default = "10.0.2.0/24"
}

variable "ami" {
  default = "ami-00bb6a80f01f03502"
}