################### provider ###################
variable "region" {
  type        = string
  description = ""
}

################### VPC VARS ##################
variable "vpc_cidr_block" {
  type        = string
  description = "cider block for vpc"
}
variable "vpc_tags" {
  type        = map(string)
  description = "tags for vpc"
}

################### subnets vars ###############
variable "subnets" {
  type        = map(any)
  description = ""
}
variable "subnet_tags" {
  type        = map(string)
  description = ""
}

################### route table vars #################
variable "rt_cidr_block" {
  type        = string
  description = "cider block for route table"
}
variable "rt_tags" {
  type        = map(string)
  description = "tags for route table"
}

############ route table subnet association vars ###########
variable "subnets_to_associate" {
  type        = list(string)
  description = "subnets to associate with route table"
}
################### internet gateway vars ##################
variable "ig_gw_tags" {
  type        = map(string)
  description = "tags for internet gateway"
}
