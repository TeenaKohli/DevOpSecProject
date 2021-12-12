terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

#resource "aws_security_group" "sg-068c3024703e67d64" {
# (resource argumet)
#}

resource "aws_instance" "DevOpSec" {
  ami           = "ami-0ed9277fb7eb570c9"
  instance_type = "t2.micro"
  #vpc_security_group_ids = "sg-068c3024703e67d64"
  #aws_security_group = "sg-068c3024703e67d64"
  user_data     = file("file.sh")
#  key_name = "DevOpSec"

  tags = {
    Name = "DevOpsSec-App"
  }
}
