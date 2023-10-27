variable "region" {
  default     = "us-east-1"
}
variable "az1"{
  default = "us-east-1a"
}
variable "az2"{
  default = "us-east-1b"
}
variable "public_ami"{
  type = string
}
variable "private_ami"{
  type = string
}
variable "vpc_cidr" {
  default     = "10.0.0.0/16"
}
variable "ec2_instance_type" {
  type     = string
}

variable "db_instance_type" {
  type     = string
}

variable "db_engine_version" {
  default     = "14.8"
}

variable "db_allocated_storage" {
  default     = 20
}

variable "db_identifier" {
  default     = "default-db"
}

variable "db_username" {
  default     = "db_user"
}

variable "db_password" {
  default     = "db_password"
}
variable "db_storage_type"{
  default = "gp2"
}
variable "bucket_name"{
  default = "default"
}
variable "public_cidr"{
  default = "10.0.1.0/24"
}
variable "private_cidr"{
  default="10.0.2.0/24"
}
variable "nlb_endpoint"{
  description = "nlb-endpoint"
}