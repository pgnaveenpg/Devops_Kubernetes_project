## VPC Creation 
# Created VPC with desired configurations
# VPC, priavate and public subnets, CIDR, availabilty zones, IGW and Nat gatway
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc-project-capstone"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true # single nat_gateway allow the vpc with single nat server in public subnet to access the private subnet instances

  create_igw = true # Creates IGW (internet gatway) within the VPC

  tags = {
    Terraform   = "true"
    Environment = "demo_capstone"
    Owner       = "Naveen"
  }
  private_subnet_tags = {
    Name                                        = "private-us-east-1a"
    "kubernetes.io/cluster/eks-upgrad-capstone" = "shared"
    "kubernetes.io/role/internal-elb"           = 1

    Name                                        = "private-us-east-1b"
    "kubernetes.io/cluster/eks-upgrad-capstone" = "shared"
    "kubernetes.io/role/internal-elb"           = 1
  }
  public_subnet_tags = {
    Name                                        = "public-us-east-1a"
    "kubernetes.io/cluster/eks-upgrad-capstone" = "shared"
    "kubernetes.io/role/elb"                    = 1

    Name                                        = "public-us-east-1b"
    "kubernetes.io/cluster/eks-upgrad-capstone" = "shared"
    "kubernetes.io/role/elb"                    = 1
  }

  vpc_tags = {
    Name = "vpc-project-capstone"
  }
}
