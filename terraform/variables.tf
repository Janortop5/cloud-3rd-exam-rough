variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  type = map(any)
  default = {
    "eks-public-1" = {
      name       = "eks-public-1"
      az         = "us-east-1a"
      cidr_block = "10.0.1.0/24"
      key        = "eks-public-1"
    },

    "eks-public-2" = {
      name       = "eks-public-2"
      az         = "us-east-1b"
      cidr_block = "10.0.2.0/24"
      key        = "eks-public-2"
    }
  }
}
variable "private_subnets" {
  type = map(any)
  default = {
    "eks-private-1" = {
      name       = "eks-private-1"
      az         = "us-east-1a"
      cidr_block = "10.0.3.0/24"
      key        = "eks-private-1"
    },

    "eks-private-2" = {
      name       = "eks-private-2"
      az         = "us-east-1b"
      cidr_block = "10.0.4.0/24"
      key        = "eks-private-2"
    }
  }
}

variable "eks_sg" {
  type = map(any)
  default = {
    name           = "eks_sg"
    description    = "security group for eks cluster"
    eks_from_port  = 0
    eks_to_port    = 65535
  }
}

variable "cluster_name" {
  default = "altschool-exam-eks-cluster"
}

variable "eks_cidr_block" {
  default = ["0.0.0.0/0"]
}

variable "tags" {
  type = map(any)
  default = {
    vpc              = "eks-vpc"
    internet_gateway = "eks-igw"
    nat_gateway      = "eks-nat-gw"
    publicRT         = "eks-publicRT"
    privateRT        = "eks-privateRT"
    elastic_ip       = "eks-eip"
    sg               = "eks_sg"
  }
}

