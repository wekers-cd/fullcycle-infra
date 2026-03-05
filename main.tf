provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type = "t3.micro"

  subnet_id = "subnet-013476ae50908ea44"

  vpc_security_group_ids = [
    "sg-0edd85f1e8bc51aab"
  ]

  monitoring = false

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name        = "Teste pipeline"
  }
}

terraform {
  backend "s3" {
    bucket = "wekers-teste-repo-fullcycle"
    key    = "terraform/ec2-test.tfstate"
    region = "sa-east-1"
  }
}