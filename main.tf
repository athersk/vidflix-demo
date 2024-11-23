provider "aws" {}

variable "cidr_blocks" {
  description = "subnet cidr block"
  type = list(object({
    cidr_block=string
    name=string
  }))

}


resource "aws_vpc" "mobeefliks-infra-vpc" {
    cidr_block = var.cidr_blocks[0].cidr_block
    tags = {
      Name: var.cidr_blocks[0].name
    }
  
}

resource "aws_subnet" "mobeefliks-dev-subnet-01" {
vpc_id = aws_vpc.mobeefliks-infra-vpc.id 
cidr_block = var.cidr_blocks[1].cidr_block
availability_zone = "ap-south-1a"
tags = {
  Name: var.cidr_blocks[1].name
}
}
