### This is Variable which we have Defined ####################
variable "region" {
  default = "us-east-1"
}

 variable "access_key" {
  description = "access-key"
    type        = string
  default     = ""
}

variable "secret_key" {
  description = "secret-key"
    type        = string
  default     = ""
}
 


variable "ami_id" {
  default = "ami-053b0d53c279acc90"
}
variable "instance_type" {
  default = "t2.medium"
}
variable "az_zone" {
  default = "us-east-1a"
}

variable "vpc_cidr" {
    default = "10.232.0.0/16"
  
}

variable "pub_subnet_cidr" {
  default = "10.232.2.0/24"
}

variable "priv_subnet_cidr" {
  default = "10.232.3.0/24"
}
variable "route" {
  default = "0.0.0.0/0"
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type = number
  default = 8080
}

variable "elb_port" {
  description = "The port the NLB will use for HTTP requests"
  type = number
  default = 80
}

## it will create pemkey for instances

/* variable "key_name" {
  default = "ec2Key-dev"      # if we keep default blank it will ask for a value when we execute terraform apply
} */
